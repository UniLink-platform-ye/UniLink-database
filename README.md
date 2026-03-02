
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@400;600;700&display=swap" rel="stylesheet">

<div dir="rtl" style="font-family: 'Cairo', Tahoma, Arial, sans-serif; max-width: 900px; margin: 0 auto; padding: 1.5rem;">


# UniLink — قاعدة بيانات المنصة الأكاديمية

> منصة تواصل اجتماعي جامعية آمنة وموثوقة

---

## 🎯 عن هذا المشروع

يحتوي هذا المستودع على **سكربتات SQL الكاملة** لقاعدة بيانات منصة **UniLink**، وهي منصة تواصل اجتماعي أكاديمية مغلقة تجمع الطلاب والأساتذة والإدارة الجامعية في نظام واحد آمن ومنظّم.

تم تصميم قاعدة البيانات بناءً على وثائق التحليل والتصميم الكاملة (SRS, ERD, DFD, Class Diagram, Data Dictionary).

---

## 🎬 فيديو الشرح

<div align="center">

[![شرح UniLink على YouTube](https://img.youtube.com/vi/ANbLrJcsnA8/0.jpg)](https://www.youtube.com/watch?v=ANbLrJcsnA8)

</div>


## 📁 هيكل المجلدات

```
UniLink-database/
├── video/
│   └── demo.gif              ← 🎬 عرض توضيحي متحرك
├── scripts/
│   ├── 01_schema.sql         ← إنشاء قاعدة البيانات وجميع الجداول (DDL)
│   └── 02_seed_data.sql      ← بيانات تجريبية شاملة (INSERT)
├── Docs/
│   ├── UniLink_documentions.md          ← وثيقة التحليل الكاملة (SRS)
│   ├── UniLink_ExecutionPlan.md         ← خطة العمل التنفيذية
│   ├── 01-setup-database-xampp.md      ← دليل إعداد قاعدة البيانات
│   └── 02-database-operations-guide.md ← دليل الاستعلامات والعمليات كاملة
└── README.md
```

---

## 🗄️ محتوى مجلد scripts

| الملف | الغرض | الأولوية |
|---|---|---|
| `01_schema.sql` | إنشاء قاعدة البيانات وجميع الجداول العشرة مع القيود والمفاتيح | **أول** |
| `02_seed_data.sql` | إدراج بيانات تجريبية تغطي جميع الأدوار والسيناريوهات | **ثانياً** |

---

## 🏗️ الجداول في قاعدة البيانات

| الجدول | الوصف |
|---|---|
| `users` | المستخدمون (طالب / أستاذ / مدير / مشرف) |
| `groups` | المجموعات الدراسية والأكاديمية |
| `group_members` | ربط المستخدمين بالمجموعات (جدول وسيط) |
| `posts` | المنشورات، الإعلانات، الأسئلة، المحاضرات |
| `post_likes` | إعجابات المنشورات (جدول وسيط) |
| `messages` | الرسائل الخاصة بين المستخدمين |
| `files` | الملفات الأكاديمية المرفوعة |
| `reports` | البلاغات ومخالفات المحتوى |
| `notifications` | الإشعارات الفورية |
| `audit_logs` | سجل التدقيق والأمن |

---

## ⚡ خطوات التشغيل السريع

> راجع `Docs/01-setup-database-xampp.md` للشرح التفصيلي الكامل.

### الطريقة السريعة (phpMyAdmin)

1. افتح `http://localhost/phpmyadmin`
2. اضغط **Import** من القائمة العلوية
3. ارفع ملف `scripts/01_schema.sql` — اضغط **Go**
4. افتح قاعدة البيانات `unilink_db`، ارفع `scripts/02_seed_data.sql` — اضغط **Go**

### من سطر الأوامر (MySQL CLI)

```bash
# الخطوة 1: إنشاء الجداول
mysql -u root -p < scripts/01_schema.sql

# الخطوة 2: إدراج البيانات التجريبية
mysql -u root -p unilink_db < scripts/02_seed_data.sql
```

---

## 📋 المتطلبات

- **MySQL** 8.x أو **MariaDB** 10.6+
- ترميز قاعدة البيانات: `utf8mb4` (يدعم العربية والإيموجي)
- **XAMPP** (مُوصى به للتطوير المحلي)

---

## 🔐 ملاحظات أمنية

- كلمات المرور في البيانات التجريبية هي **hashes bcrypt محاكاة** — لا تُستخدم في الإنتاج.
- كلمة المرور التجريبية لجميع الحسابات: `UniLink@2026`
- جميع الجداول تستخدم `InnoDB` لدعم المعاملات (Transactions) والمفاتيح الخارجية.

---

## 📖 التوثيق

راجع ملفات التوثيق في مجلد `Docs/`:

- **`01-setup-database-xampp.md`** — دليل إعداد قاعدة البيانات خطوة بخطوة
- **`02-database-operations-guide.md`** — دليل الاستعلامات الكامل مع جميع الأمثلة SQL

---

*منصة UniLink — مشروع تخرج أكاديمي*
