# دليل إنشاء Screenshots للـ App Store

## الأحجام المطلوبة

### iPhone (مطلوب)
1. **iPhone 6.7" Display** (iPhone 14 Pro Max, 15 Plus, 15 Pro Max)
   - الحجم: 1290 x 2796 بكسل
   - الاتجاه: عمودي (Portrait)
   - العدد المطلوب: 3-10 صور

2. **iPhone 6.5" Display** (iPhone XS Max, 11 Pro Max, 12 Pro Max, 13 Pro Max)
   - الحجم: 1242 x 2688 بكسل
   - الاتجاه: عمودي (Portrait)
   - العدد المطلوب: 3-10 صور

### iPad (اختياري)
1. **iPad Pro 12.9" Display**
   - الحجم: 2048 x 2732 بكسل
   - الاتجاه: عمودي (Portrait)

## طرق إنشاء Screenshots

### الطريقة 1: باستخدام Simulator في Xcode

1. **افتح المشروع في Xcode**
```bash
open ios/Runner.xcworkspace
```

2. **اختر الـ Simulator المناسب**
   - اذهب إلى: Xcode > Open Developer Tool > Simulator
   - اختر Device:
     - iPhone 15 Pro Max (6.7")
     - iPhone 14 Pro Max (6.7")
     - iPhone 11 Pro Max (6.5")

3. **شغّل التطبيق**
```bash
flutter run
```

4. **التقط Screenshots**
   - اضغط: `Cmd + S` أو
   - File > New Screen Shot
   - أو `Cmd + Shift + 4` ثم اسحب على نافذة الـ Simulator

5. **Screenshots ستُحفظ في**
```
~/Desktop/
```

### الطريقة 2: باستخدام جهاز حقيقي

1. **وصّل iPhone/iPad بالكمبيوتر**

2. **شغّل التطبيق على الجهاز**
```bash
flutter run
```

3. **التقط Screenshots**
   - iPhone: اضغط الـ Side Button + Volume Up
   - الصور ستُحفظ في Photos

4. **انقل الصور للكمبيوتر**
   - استخدم AirDrop
   - أو استخدم Image Capture
   - أو استخدم iCloud Photos

### الطريقة 3: باستخدام Fastlane Snapshot (متقدم)

1. **ثبّت Fastlane**
```bash
brew install fastlane
```

2. **أعد إعداد snapshot**
```bash
cd ios
fastlane snapshot init
```

3. **عدّل ملف Snapfile**

4. **شغّل snapshot**
```bash
fastlane snapshot
```

### الطريقة 4: باستخدام أدوات أونلاين

1. **[App Store Screenshot Generator](https://www.appsscreenshot.com/)**
   - ارفع screenshots عادية
   - سيقوم بتحويلها للأحجام المطلوبة

2. **[Placeit by Envato](https://placeit.net/)**
   - خدمة مدفوعة
   - تقدم قوالب احترافية

3. **[Screenshot Maker](https://screenshots.pro/)**
   - أداة مجانية
   - تدعم إضافة إطارات للأجهزة

## نصائح لـ Screenshots احترافية

### 1. المحتوى
- اعرض أهم ميزات التطبيق
- استخدم 3-5 screenshots على الأقل
- رتّبها من الأهم للأقل أهمية
- أول screenshot هو الأهم (يظهر في البحث)

### 2. التصميم
- استخدم خلفية نظيفة
- أضف عناوين توضيحية بالعربية
- استخدم ألوان متناسقة مع هوية التطبيق
- تأكد من قراءة النصوص بوضوح

### 3. الأفضليات
- استخدم بيانات حقيقية (وليس Lorem Ipsum)
- تجنب المحتوى الحساس
- احذف معلومات شخصية
- استخدم أسماء وهمية إذا لزم

### 4. الاختبار
- اعرض Screenshots على أشخاص آخرين
- تأكد من وضوح الميزات
- تأكد من عدم وجود أخطاء إملائية

## أدوات إضافة نصوص على Screenshots

### 1. Figma (مجاني)
```
https://www.figma.com
```
- أنشئ تصميم بالحجم المطلوب
- أضف Screenshot كخلفية
- أضف نصوص وعناصر توضيحية

### 2. Canva (مجاني/مدفوع)
```
https://www.canva.com
```
- استخدم قوالب جاهزة
- عدّل النصوص
- صدّر بالحجم المطلوب

### 3. Sketch (macOS فقط - مدفوع)
```
https://www.sketch.com
```
- أداة احترافية
- قوالب App Store جاهزة

## مثال على تنظيم Screenshots

### Screenshot 1: الشاشة الرئيسية
- عنوان: "مرحباً بك في فرسان التعافي"
- يعرض: الواجهة الرئيسية

### Screenshot 2: الميزة الرئيسية
- عنوان: "تابع تقدمك اليومي"
- يعرض: أهم ميزة في التطبيق

### Screenshot 3: ميزة إضافية
- عنوان: "تواصل مع المجتمع"
- يعرض: ميزة التواصل

### Screenshot 4: الإعدادات/البروفايل
- عنوان: "خصص تجربتك"
- يعرض: إعدادات التطبيق

### Screenshot 5: ميزة فريدة
- عنوان: "احصل على الدعم متى احتجته"
- يعرض: ميزة فريدة للتطبيق

## حفظ وتنظيم Screenshots

أنشئ مجلد بالبنية التالية:
```
screenshots/
├── iPhone-6.7/
│   ├── 01-home.png (1290 x 2796)
│   ├── 02-feature1.png
│   ├── 03-feature2.png
│   ├── 04-feature3.png
│   └── 05-settings.png
├── iPhone-6.5/
│   ├── 01-home.png (1242 x 2688)
│   ├── 02-feature1.png
│   ├── 03-feature2.png
│   ├── 04-feature3.png
│   └── 05-settings.png
└── iPad-12.9/
    ├── 01-home.png (2048 x 2732)
    ├── 02-feature1.png
    └── 03-feature2.png
```

## التحقق من الأحجام

استخدم الأمر التالي للتحقق من أحجام الصور:
```bash
sips -g pixelWidth -g pixelHeight screenshots/iPhone-6.7/*.png
```

أو استخدم أداة Preview:
1. افتح الصورة في Preview
2. Tools > Show Inspector
3. تحقق من الأبعاد

## رفع Screenshots على App Store Connect

1. اذهب إلى App Store Connect
2. اختر التطبيق
3. اذهب إلى "App Store" tab
4. اختر الإصدار
5. انزل إلى قسم "App Preview and Screenshots"
6. اختر حجم الجهاز
7. اسحب وأفلت الصور بالترتيب المطلوب
8. احفظ التغييرات

## متطلبات إضافية

### App Preview Video (اختياري)
- المدة: 15-30 ثانية
- الحجم: نفس أحجام Screenshots
- الصيغة: .mov, .mp4, .m4v
- يُعرض قبل Screenshots

### Promotional Text (اختياري)
- نص قصير يظهر أعلى الوصف
- يمكن تحديثه بدون إرسال للمراجعة
- الحد الأقصى: 170 حرف

---

**ملاحظة**: يجب أن تكون جميع Screenshots واقعية وتمثل التطبيق الفعلي. لا تستخدم صوراً مضللة أو لا تمثل التطبيق الحقيقي.
