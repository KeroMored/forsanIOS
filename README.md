# مؤسسة فرسان التعافي (Forsan Eltaafyوظبط)

تطبيق Flutter للدعم والمساندة

## 📱 معلومات التطبيق

- **الاسم**: مؤسسة فرسان التعافي
- **Bundle ID**: `com.mored.forsaneltaafy`
- **الإصدار**: 1.0.0 (Build 11)
- **Min iOS**: 13.0
- **Target Platforms**: iOS & Android

## 🚀 البدء السريع

### المتطلبات
- Flutter SDK (3.11.0 أو أحدث)
- Xcode 14+ (للـ iOS)
- CocoaPods (للـ iOS)
- Android Studio (للـ Android)

### التثبيت

```bash
# استنساخ المشروع
git clone [repository-url]
cd forsan-elatafe-for-ios-main

# الحصول على Dependencies
flutter pub get

# تشغيل التطبيق
flutter run
```

## 📦 الحزم المستخدمة

- `shared_preferences`: ^2.2.2
- `flutter_screenutil`: ^5.9.3
- `url_launcher`: ^6.2.6
- `font_awesome_flutter`: ^10.7.0
- `flutter_phone_direct_caller`: ^2.1.0
- `youtube_player_flutter`: ^9.1.3
- `connectivity_plus`: ^6.0.3
- `dio`: ^5.9.2
- `flutter_bloc`: ^9.1.1
- `intl`: ^0.19.0
- `permission_handler`: ^11.0.1
- `equatable`: ^2.0.5

## 📱 الرفع على App Store

تم تجهيز المشروع بالكامل للرفع على App Store. راجع الملفات التالية:

### 📖 أدلة الرفع
1. **[IOS_DEPLOYMENT_QUICK_START.md](IOS_DEPLOYMENT_QUICK_START.md)** - دليل البدء السريع (ابدأ من هنا!)
2. **[APP_STORE_DEPLOYMENT.md](APP_STORE_DEPLOYMENT.md)** - دليل مفصل خطوة بخطوة
3. **[APP_STORE_CHECKLIST.md](APP_STORE_CHECKLIST.md)** - قائمة التحقق الكاملة
4. **[SCREENSHOTS_GUIDE.md](SCREENSHOTS_GUIDE.md)** - دليل إنشاء Screenshots
5. **[APP_STORE_ASSETS_REQUIREMENTS.md](APP_STORE_ASSETS_REQUIREMENTS.md)** - متطلبات الأصول
6. **[PRIVACY_POLICY_TEMPLATE.md](PRIVACY_POLICY_TEMPLATE.md)** - نموذج سياسة الخصوصية

### ⚡ رفع سريع

```bash
# 1. بناء التطبيق
./build_ios.sh

# 2. فتح Xcode
open ios/Runner.xcworkspace

# 3. في Xcode: Product → Archive → Distribute
```

### ✅ ما تم إعداده

- [x] Bundle ID تم تغييره إلى `com.mored.forsaneltaafy`
- [x] أذونات الخصوصية تم إضافتها (Info.plist)
- [x] ملف Podfile تم إنشاؤه
- [x] ملفات Fastlane تم إعدادها
- [x] سكريبت البناء تم إنشاؤه
- [x] ExportOptions.plist تم إعداده
- [x] الأيقونات موجودة

### ⚠️ ما يجب فعله

- [ ] تحديث Team ID في:
  - `ios/fastlane/Appfile`
  - `ios/ExportOptions.plist`
- [ ] إنشاء Screenshots (3-10 صور)
- [ ] كتابة الوصف والكلمات المفتاحية
- [ ] إعداد Privacy Policy URL
- [ ] إنشاء App ID في Apple Developer Portal
- [ ] إنشاء Provisioning Profile

## 🏗️ بنية المشروع

```
lib/
├── main.dart
├── core/
│   ├── config/
│   ├── constants/
│   └── utils/
├── features/
│   └── [feature modules]
├── shared/
│   ├── widgets/
│   └── models/
└── ...

ios/
├── Runner.xcworkspace    ← افتح هذا في Xcode
├── Podfile              ← تم إنشاؤه
├── ExportOptions.plist  ← تم إنشاؤه
└── fastlane/           ← تم إعداده
    ├── Fastfile
    └── Appfile

assets/
├── image/
├── montaga/
└── wehda/
```

## 🔧 الأوامر المفيدة

```bash
# تنظيف المشروع
flutter clean

# الحصول على Dependencies
flutter pub get

# تشغيل التطبيق
flutter run

# بناء للـ Release (iOS)
flutter build ios --release

# بناء للـ Release (Android)
flutter build apk --release

# تحليل الكود
flutter analyze

# تشغيل الاختبارات
flutter test
```

## 🍎 iOS Development

```bash
# تثبيت Pods
cd ios && pod install && cd ..

# تحديث Pods
cd ios && pod update && cd ..

# فتح Xcode
open ios/Runner.xcworkspace
```

## 🤖 Android Development

```bash
# بناء APK
flutter build apk

# بناء App Bundle
flutter build appbundle

# فتح Android Studio
open -a /Applications/Android\ Studio.app android/
```

## 📸 Screenshots

لإنشاء Screenshots للـ App Store، راجع: [SCREENSHOTS_GUIDE.md](SCREENSHOTS_GUIDE.md)

الأحجام المطلوبة:
- iPhone 6.7": 1290 x 2796 px
- iPhone 6.5": 1242 x 2688 px

## 🔐 الأذونات

التطبيق يطلب الأذونات التالية:
- **Photos**: للوصول إلى معرض الصور
- **Camera**: لالتقاط الصور
- **Microphone**: لتسجيل الصوت
- **Location**: لخدمات الموقع
- **Phone**: لإجراء المكالمات

## 📞 الدعم

للمساعدة في الرفع على App Store:
- راجع [IOS_DEPLOYMENT_QUICK_START.md](IOS_DEPLOYMENT_QUICK_START.md)
- اقرأ [App Store Review Guidelines](https://developer.apple.com/app-store/review/guidelines/)

## 📄 الترخيص

[أضف معلومات الترخيص هنا]

## 👥 المساهمون

[أضف معلومات المساهمين هنا]

---

**جاهز للرفع على App Store!** 🎉

ابدأ من هنا: [IOS_DEPLOYMENT_QUICK_START.md](IOS_DEPLOYMENT_QUICK_START.md)
