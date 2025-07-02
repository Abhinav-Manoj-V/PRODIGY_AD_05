# 📷 QR Code Scanner App (Flutter)

A simple and powerful **QR Code Scanner app** built using Flutter.  
Scan QR codes instantly and open links with one tap!

---

## ✅ Features

- 📲 Scan QR codes in real time  
- 🌐 Automatically detects URLs  
- 🔗 Open scanned links in browser  
- 🔄 Option to rescan QR codes  
- 📱 Clean and minimal user interface

---

## 🖼️ Screenshots

![IMG_20250702_115807](https://github.com/user-attachments/assets/498ee891-acb6-4111-a05b-4d3e87db6967)

![Screenshot_2025-07-02-11-53-27-99_2de955086dd1561336b1bee3b6585adf](https://github.com/user-attachments/assets/2fa3ba7e-d346-4480-83fd-039fc77d6416)


---

## 📦 Requirements

- Flutter SDK  
- Dart SDK  
- VS Code or Android Studio  
- Emulator or Android/iOS device

---

## 🧩 Dependencies Used

mobile_scanner – for camera-based QR scanning

url_launcher – to open scanned URLs in the browser

Add these in pubspec.yaml:

```yaml
dependencies:
  flutter:
    sdk: flutter
  mobile_scanner: ^3.5.0
  url_launcher: ^6.2.6
```

## 🚀 How to Run

### 1. Clone the repository

```bash
git clone https://github.com/your-username/stopwatch-app.git
cd stopwatch-app
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Run the app

```bash
flutter run
```

#### *Make sure an emulator or real device is connected.

### 4. Build APK (Optional)

To build a release APK:

```bash
flutter build apk --release
```

### The .apk file will be located in:

```bash
build/app/outputs/flutter-apk/app-release.apk
```

📁 Project Structure

```bash
lib/
 └── main.dart          # Main QR_Code_Scanner app code
assets/                 # (Optional: Add icon/fonts/images here)
pubspec.yaml            # Project configuration
```

👨‍💻 Author

Made by Abhinav Manoj.

Feel free to fork, modify, or contribute!

📄 License

This project is open source and free to use.
