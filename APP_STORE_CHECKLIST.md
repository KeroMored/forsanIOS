# قائمة التحقق قبل رفع التطبيق على App Store

## ✅ الإعدادات التقنية (تم إنجازها)

- [x] تغيير Bundle ID إلى: `com.mored.forsaneltaafy`
- [x] إضافة أذونات الخصوصية (Info.plist):
  - NSPhotoLibraryUsageDescription
  - NSCameraUsageDescription
  - NSMicrophoneUsageDescription
  - NSLocationWhenInUseUsageDescription
  - ITSAppUsesNonExemptEncryption
- [x] إنشاء ملف Podfile
- [x] إنشاء ملف ExportOptions.plist
- [x] إعداد ملفات Fastlane (Fastfile و Appfile)
- [x] إنشاء سكريبت البناء (build_ios.sh)

## 📋 ما يجب فعله قبل الرفع

### 1. إعدادات Apple Developer Account
- [ ] إنشاء App ID على Developer Portal
- [ ] إنشاء Distribution Certificate
- [ ] إنشاء App Store Provisioning Profile
- [ ] تحديث Team ID في:
  - [ ] `ios/fastlane/Appfile`
  - [ ] `ios/ExportOptions.plist`

### 2. إعدادات App Store Connect
- [ ] إنشاء التطبيق على App Store Connect
- [ ] تعيين اسم التطبيق: "فرسان التعافي"
- [ ] اختيار اللغة الأساسية: Arabic
- [ ] تعيين السعر والتوافر
- [ ] إضافة وصف التطبيق (بالعربية والإنجليزية)
- [ ] إضافة الكلمات المفتاحية
- [ ] إضافة فئة التطبيق المناسبة
- [ ] رفع أيقونة التطبيق 1024x1024px

### 3. Screenshots والوسائط
- [ ] تحضير Screenshots لـ iPhone:
  - [ ] 6.7" Display (1290 x 2796 px) - مطلوب
  - [ ] 6.5" Display (1242 x 2688 px) - مطلوب
  - [ ] 5.5" Display (1242 x 2208 px) - اختياري
- [ ] تحضير Screenshots لـ iPad (اختياري):
  - [ ] 12.9" Display (2048 x 2732 px)
  - [ ] 11" Display (1668 x 2388 px)

### 4. المحتوى القانوني
- [ ] إنشاء صفحة Privacy Policy
- [ ] إضافة رابط Privacy Policy في App Store Connect
- [ ] إنشاء صفحة Terms of Service (اختياري)
- [ ] إنشاء صفحة Support URL

### 5. App Icon والـ Launch Screen
- [ ] تصميم وإضافة App Icon بجميع الأحجام المطلوبة:
  - [ ] 1024x1024 (App Store)
  - [ ] 180x180 (@3x iPhone)
  - [ ] 120x120 (@2x iPhone)
  - [ ] 167x167 (@2x iPad)
  - [ ] 152x152 (@2x iPad)
  - [ ] 76x76 (iPad)
  - [ ] 40x40 (Spotlight)
  - [ ] 29x29 (Settings)
- [ ] تخصيص Launch Screen

### 6. اختبار التطبيق
- [ ] اختبار على iPhone حقيقي
- [ ] اختبار على iPad (إذا كان مدعوماً)
- [ ] اختبار جميع الميزات
- [ ] اختبار الأذونات (الكاميرا، الصور، الموقع)
- [ ] اختبار الاتصال بالإنترنت وبدونه
- [ ] التأكد من عدم وجود crashes
- [ ] اختبار على iOS 13.0 (الحد الأدنى المدعوم)

### 7. معلومات الخصوصية (App Privacy)
- [ ] الإجابة على أسئلة الخصوصية في App Store Connect:
  - [ ] هل يجمع التطبيق بيانات؟
  - [ ] ما نوع البيانات المجموعة؟
  - [ ] كيف يتم استخدام البيانات؟
  - [ ] هل البيانات مرتبطة بالمستخدم؟

### 8. معلومات المحتوى (Age Rating)
- [ ] ملء استبيان Age Rating
- [ ] التأكد من اختيار التصنيف المناسب

### 9. البناء والرفع
- [ ] تشغيل `./build_ios.sh` للتأكد من عدم وجود أخطاء
- [ ] فتح Xcode وتحديث Signing & Capabilities
- [ ] إنشاء Archive
- [ ] رفع إلى App Store Connect
- [ ] ربط الـ Build بالإصدار
- [ ] إضافة ملاحظات للمراجعين (What to test)
- [ ] إرسال للمراجعة (Submit for Review)

### 10. بعد الموافقة
- [ ] تحديد تاريخ النشر (Release manually أو automatic)
- [ ] نشر التطبيق
- [ ] مراقبة التقييمات والمراجعات
- [ ] متابعة Crash Reports

## 📱 معلومات التطبيق الحالية

```
App Name: فرسان التعافي (Forsan Eltaafyوظبط)
Bundle ID: com.mored.forsaneltaafy
Version: 1.0.0
Build Number: 11
Min iOS Version: 13.0
Support Device: iPhone & iPad
```

## 🔧 الأوامر المفيدة

### بناء التطبيق
```bash
./build_ios.sh
```

### فتح Xcode Workspace
```bash
open ios/Runner.xcworkspace
```

### تحديث الـ Pods
```bash
cd ios
pod install
pod update
```

### رفع باستخدام Fastlane
```bash
cd ios
fastlane beta    # للرفع على TestFlight
fastlane release # للرفع على App Store
```

## ⚠️ ملاحظات هامة

1. **لا تنسَ تغيير**:
   - Team ID في ملفات fastlane
   - Apple ID في Appfile
   - Provisioning Profile Name

2. **التأكد من**:
   - جميع الأيقونات موجودة
   - جميع Screenshots جاهزة
   - Privacy Policy متاحة على رابط عام
   - التطبيق لا يحتوي على crashes

3. **مراجعة Apple**:
   - قد تستغرق 24-48 ساعة
   - قد يطلبون معلومات إضافية
   - قد يرفضون لأسباب متعددة (راجع App Store Review Guidelines)

## 📞 الدعم

إذا واجهت أي مشاكل:
1. راجع [App Store Review Guidelines](https://developer.apple.com/app-store/review/guidelines/)
2. راجع [Flutter iOS Deployment](https://docs.flutter.dev/deployment/ios)
3. تحقق من [Apple Developer Forums](https://developer.apple.com/forums/)

---

**آخر تحديث**: تم تجهيز جميع الملفات الأساسية للرفع
**الحالة**: جاهز للبدء في عملية الرفع
