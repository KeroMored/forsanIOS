# دليل رفع التطبيق على App Store

## معلومات التطبيق
- **Bundle ID**: `com.mored.forsaneltaafy`
- **اسم التطبيق**: فرسان التعافي
- **الإصدار الحالي**: 1.0.0 (11)

## المتطلبات الأساسية

### 1. حساب Apple Developer
- يجب أن يكون لديك حساب Apple Developer نشط
- سجل دخول على: https://developer.apple.com

### 2. إنشاء App ID
1. اذهب إلى [Apple Developer Portal](https://developer.apple.com/account)
2. اختر "Certificates, Identifiers & Profiles"
3. اختر "Identifiers" ثم انقر على "+"
4. اختر "App IDs" واملأ البيانات:
   - **Description**: Forsan Eltaafyوظبط
   - **Bundle ID**: `com.mored.forsaneltaafy`
   - **Capabilities**: فعّل الصلاحيات المطلوبة

### 3. إنشاء Provisioning Profile
1. في نفس القسم، اختر "Profiles"
2. انقر على "+" لإنشاء profile جديد
3. اختر "App Store" distribution
4. اختر الـ App ID الذي أنشأته
5. اختر الـ Certificate الخاص بك
6. احفظ الـ profile

### 4. تحديث Xcode
1. افتح الملف: `ios/Runner.xcworkspace` (وليس .xcodeproj)
2. اختر Runner من القائمة اليسرى
3. في التبويب "Signing & Capabilities":
   - اختر Team الخاص بك
   - تأكد من أن Bundle Identifier هو: `com.mored.forsaneltaafy`
   - فعّل "Automatically manage signing"

## خطوات الرفع

### الطريقة الأولى: باستخدام Flutter CLI

1. **تنظيف المشروع**
```bash
flutter clean
flutter pub get
cd ios
pod install
cd ..
```

2. **بناء التطبيق للـ Release**
```bash
flutter build ios --release
```

3. **فتح Xcode وأرشفة التطبيق**
```bash
open ios/Runner.xcworkspace
```

4. في Xcode:
   - اختر "Any iOS Device (arm64)" من قائمة الأجهزة
   - اذهب إلى Product > Archive
   - بعد انتهاء الأرشفة، سيفتح نافذة Organizer
   - اختر "Distribute App"
   - اختر "App Store Connect"
   - اتبع الخطوات لرفع التطبيق

### الطريقة الثانية: باستخدام Fastlane

1. **تثبيت Fastlane**
```bash
sudo gem install fastlane -NV
# أو باستخدام Homebrew
brew install fastlane
```

2. **تحديث ملفات Fastlane**
افتح الملفات التالية وحدّث البيانات:
- `ios/fastlane/Appfile`: ضع Apple ID و Team ID
- `ios/ExportOptions.plist`: ضع Team ID

3. **رفع إلى TestFlight**
```bash
cd ios
fastlane beta
```

4. **رفع إلى App Store**
```bash
cd ios
fastlane release
```

## إعدادات App Store Connect

### 1. إنشاء التطبيق على App Store Connect
1. اذهب إلى [App Store Connect](https://appstoreconnect.apple.com)
2. اختر "My Apps" ثم انقر على "+"
3. اختر "New App"
4. املأ البيانات:
   - **Platform**: iOS
   - **Name**: فرسان التعافي
   - **Primary Language**: Arabic
   - **Bundle ID**: اختر `com.mored.forsaneltaafy`
   - **SKU**: يمكنك استخدام: forsaneltaafyوظبط

### 2. تعبئة معلومات التطبيق
املأ جميع الأقسام المطلوبة:
- **App Information**
- **Pricing and Availability**
- **App Privacy**: أجب على أسئلة الخصوصية
- **Version Information**: وصف التطبيق، الكلمات المفتاحية، Screenshots

### 3. Screenshots المطلوبة
يجب توفير Screenshots للأحجام التالية:
- iPhone 6.7" (1290 x 2796 px) - مطلوب
- iPhone 6.5" (1242 x 2688 px) - مطلوب
- iPad Pro 12.9" (2048 x 2732 px) - اختياري

يمكنك استخدام أدوات مثل:
- Screenshot Simulator في Xcode
- [App Screenshot](https://www.appsscreenshot.com/)

### 4. ملف Privacy Policy
يجب توفير رابط لسياسة الخصوصية. يمكنك:
- استضافتها على موقعك
- استخدام خدمة مجانية مثل [PrivacyPolicies.com](https://www.privacypolicies.com/)

## الأذونات المضافة

التطبيق يحتوي على الأذونات التالية في `Info.plist`:
- **NSPhotoLibraryUsageDescription**: للوصول إلى معرض الصور
- **NSCameraUsageDescription**: للوصول إلى الكاميرا
- **NSMicrophoneUsageDescription**: للوصول إلى الميكروفون
- **NSLocationWhenInUseUsageDescription**: للوصول إلى الموقع
- **ITSAppUsesNonExemptEncryption**: تم تعيينه على false

## ملاحظات مهمة

1. **Bundle ID**: تم تغيير Bundle ID إلى `com.mored.forsaneltaafy` في:
   - `ios/Runner.xcodeproj/project.pbxproj` (Debug, Release, Profile)
   - جميع ملفات الإعدادات

2. **الإصدار**: الإصدار الحالي هو 1.0.0 (Build 11)
   - يمكنك تغييره في `pubspec.yaml` ثم تشغيل `flutter pub get`

3. **الأيقونة (App Icon)**:
   - يجب إضافة أيقونة التطبيق في `ios/Runner/Assets.xcassets/AppIcon.appiconset`
   - الأحجام المطلوبة: 1024x1024 (App Store), 60x60, 76x76, 83.5x83.5، إلخ

4. **Launch Screen**:
   - يمكنك تخصيص شاشة الإطلاق في `ios/Runner/Base.lproj/LaunchScreen.storyboard`

## حل المشاكل الشائعة

### خطأ في Signing
```
Error: No profiles for 'com.mored.forsaneltaafy' were found
```
**الحل**: تأكد من إنشاء Provisioning Profile في Apple Developer Portal

### خطأ في Build
```
Error: Could not find an option named "export-options-plist"
```
**الحل**: تأكد من تشغيل الأمر من داخل مجلد ios

### خطأ في Pods
```
Error: CocoaPods not installed
```
**الحل**:
```bash
sudo gem install cocoapods
cd ios
pod install
```

## الخطوة النهائية

بعد رفع التطبيق بنجاح:
1. انتظر معالجة Build على App Store Connect (قد يستغرق 10-20 دقيقة)
2. اذهب إلى App Store Connect
3. اختر التطبيق
4. اختر الإصدار
5. اربط الـ Build الذي رفعته
6. اضغط على "Submit for Review"
7. انتظر موافقة Apple (عادة 24-48 ساعة)

## روابط مفيدة

- [Apple Developer Portal](https://developer.apple.com/account)
- [App Store Connect](https://appstoreconnect.apple.com)
- [Flutter iOS Deployment Guide](https://docs.flutter.dev/deployment/ios)
- [Fastlane Documentation](https://docs.fastlane.tools/)

---

**ملاحظة**: تأكد من اختبار التطبيق بشكل كامل على أجهزة حقيقية قبل الرفع.
