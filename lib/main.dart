import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const QRScannerApp());
}

class QRScannerApp extends StatelessWidget {
  const QRScannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QRScannerScreen(),
    );
  }
}

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  String scannedData = '';
  bool isScanning = true;

  final MobileScannerController controller = MobileScannerController();

  void _handleQRCode(String data) {
    if (!isScanning) return;
    setState(() {
      scannedData = data;
      isScanning = false;
    });
    controller.stop();
  }

  void _resetScan() {
    setState(() {
      scannedData = '';
      isScanning = true;
    });
    controller.start();
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Could not launch URL")));
    }
  }

  bool _isURL(String text) {
    final pattern = r'^(https?:\/\/)[^\s/$.?#].[^\s]*$';
    return RegExp(pattern, caseSensitive: false).hasMatch(text.trim());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'QR Scanner',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isScanning)
            Center(
              child: SizedBox(
                width: 220,
                height: 220,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: MobileScanner(
                    controller: controller,
                    onDetect: (capture) {
                      final barcode = capture.barcodes.first;
                      final String? value = barcode.rawValue;
                      if (value != null) {
                        _handleQRCode(value);
                      }
                    },
                  ),
                ),
              ),
            )
          else
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (_isURL(scannedData))
                    ElevatedButton.icon(
                      onPressed: () => _launchURL(scannedData),
                      icon: const Icon(Icons.open_in_browser),
                      label: const Text('Open Link'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                    ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _resetScan,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      'Scan Again',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
