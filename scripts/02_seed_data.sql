USE `unilink_db`;

SET NAMES 'utf8mb4';
SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO `users`
  (`user_id`,`username`,`email`,`password_hash`,
   `role`,`full_name`,`academic_id`,`department`,`is_verified`,`status`)
VALUES
  (1, 'admin_omar',
   'omar.admin@unilink.edu',
   '$2y$10$exampleBcryptHashAdminOmar123456789012345678',
   'admin', 'عمر عبدالله السعيد', 'ADM-001', 'إدارة النظام', 1, 'active'),

  (2, 'supervisor_salma',
   'salma.supervisor@unilink.edu',
   '$2y$10$exampleBcryptHashSalmaSupervisor1234567890',
   'supervisor', 'سلمى محمود الأنصاري', 'SUP-001', 'ضبط الجودة', 1, 'active'),

  (3, 'prof_ahmed',
   'ahmed.prof@unilink.edu',
   '$2y$10$exampleBcryptHashProfAhmed12345678901234567',
   'professor', 'د. أحمد خالد النجار', 'FAC-301', 'قسم علوم الحاسوب', 1, 'active'),

  (4, 'prof_lina',
   'lina.prof@unilink.edu',
   '$2y$10$exampleBcryptHashProfLina123456789012345678',
   'professor', 'د. لينا سامي الرشيد', 'FAC-302', 'قسم نظم المعلومات', 1, 'active'),

  (5, 'student_rania',
   'rania.student@unilink.edu',
   '$2y$10$exampleBcryptHashStudentRania12345678901234',
   'student', 'رانيا فهد الزهراني', 'STU-2001', 'قسم علوم الحاسوب', 1, 'active'),

  (6, 'student_khalid',
   'khalid.student@unilink.edu',
   '$2y$10$exampleBcryptHashStudentKhalid1234567890123',
   'student', 'خالد عبدالرحمن البلوي', 'STU-2002', 'قسم نظم المعلومات', 1, 'active'),

  (7, 'student_noor',
   'noor.student@unilink.edu',
   '$2y$10$exampleBcryptHashStudentNoor12345678901234',
   'student', 'نور إبراهيم الحمدان', 'STU-2003', 'قسم علوم الحاسوب', 1, 'active'),

  (8, 'student_yusuf',
   'yusuf.student@unilink.edu',
   '$2y$10$exampleBcryptHashStudentYusuf1234567890123',
   'student', 'يوسف محمد القحطاني', 'STU-2004', 'قسم نظم المعلومات', 0, 'active'),

  (9, 'student_suspended',
   'suspended.student@unilink.edu',
   '$2y$10$exampleBcryptHashSuspendedUser123456789012',
   'student', 'سارة علي المطيري', 'STU-2005', 'قسم علوم الحاسوب', 1, 'suspended');


INSERT INTO `groups`
  (`group_id`,`group_name`,`description`,`type`,`privacy`,`created_by`,`members_count`)
VALUES
  (1, 'CS-401 قواعد البيانات',
   'مجموعة مادة قواعد البيانات المتقدمة — الفصل الثاني 2026',
   'course', 'private', 3, 4),

  (2, 'CS-302 برمجة الويب',
   'مجموعة مادة تطوير تطبيقات الويب باستخدام PHP وLaravel',
   'course', 'private', 3, 3),

  (3, 'قسم علوم الحاسوب',
   'القناة الرسمية لإعلانات وأنشطة قسم علوم الحاسوب',
   'department', 'public', 1, 5),

  (4, 'نادي الطالب التقني',
   'مجموعة نشاط نادي الطلاب التقني لتنظيم الفعاليات والمسابقات',
   'activity', 'public', 3, 3),

  (5, 'IS-201 نظم المعلومات',
   'مجموعة مادة مقدمة في نظم المعلومات — المستوى الثاني',
   'course', 'private', 4, 3);


INSERT INTO `group_members` (`group_id`,`user_id`,`member_role`) VALUES
  (1, 3, 'owner'),
  (1, 5, 'member'),
  (1, 7, 'member'),
  (1, 6, 'member'),
  (2, 3, 'owner'),
  (2, 5, 'member'),
  (2, 7, 'member'),
  (3, 1, 'moderator'),
  (3, 3, 'owner'),
  (3, 5, 'member'),
  (3, 7, 'member'),
  (3, 6, 'member'),
  (4, 3, 'owner'),
  (4, 5, 'member'),
  (4, 7, 'member'),
  (5, 4, 'owner'),
  (5, 6, 'member'),
  (5, 8, 'member');


INSERT INTO `posts`
  (`post_id`,`user_id`,`group_id`,`content`,`type`,`visibility`,`likes_count`,`comments_count`)
VALUES
  (1, 1, 3,
   'مرحباً بجميع طلاب وأساتذة قسم علوم الحاسوب في منصة UniLink. تهدف المنصة إلى تنظيم التواصل الأكاديمي وتوفير بيئة آمنة وموثوقة لجميع أفراد الجامعة.',
   'announcement', 'public', 12, 3),

  (2, 3, 1,
   'تم رفع ملف محاضرة الأسبوع الأول: مقدمة في قواعد البيانات العلائقية. يُرجى الاطلاع قبل يوم الاثنين القادم.',
   'lecture', 'group', 8, 2),

  (3, 5, 1,
   'السلام عليكم د. أحمد، لدي سؤال حول الفرق بين المفتاح الأساسي والفريد (Primary Key vs Unique Key)، هل يمكن توضيح متى نستخدم كلاً منهما؟',
   'question', 'group', 5, 4),

  (4, 4, 5,
   'تذكير هام: الاختبار القصير القادم سيغطي الفصول 1-3 من الكتاب المقرر. يوم الأحد الساعة 10 صباحاً في قاعة B-201.',
   'announcement', 'group', 15, 6),

  (5, 6, NULL,
   'هل هناك أحد لديه ملخص لمادة نظم المعلومات الفصل السابق؟ سأكون ممتناً للمساعدة.',
   'post', 'public', 3, 2),

  (6, 7, 2,
   'ما الفرق بين GET وPOST في بروتوكول HTTP؟ وهل هناك حالات نستخدم فيها PUT بدلاً من POST؟',
   'question', 'group', 7, 3),

  (7, 3, 3,
   'إعلان عن المسابقة البرمجية السنوية: ستُقام مسابقة البرمجة في 15 مارس 2026. التسجيل مفتوح على منصة UniLink حتى 10 مارس.',
   'announcement', 'public', 20, 8);


INSERT INTO `files`
  (`file_id`,`user_id`,`post_id`,`original_name`,`stored_name`,
   `file_type`,`file_size`,`storage_path`,`is_encrypted`,`download_count`)
VALUES
  (1, 3, 2,
   'DB_Week01_Introduction.pdf',
   'f1a2b3c4-db-week01.pdf',
   'pdf', 2457600, '/uploads/2026/03/f1a2b3c4-db-week01.pdf', 1, 24),

  (2, 3, 2,
   'DB_Week01_Slides.pptx',
   'f2b3c4d5-db-week01-slides.pptx',
   'presentation', 5242880, '/uploads/2026/03/f2b3c4d5-db-week01-slides.pptx', 1, 18),

  (3, 5, 5,
   'IS_Summary_Chapters1to3.pdf',
   'f3c4d5e6-is-summary.pdf',
   'pdf', 1048576, '/uploads/2026/03/f3c4d5e6-is-summary.pdf', 0, 7),

  (4, 7, 6,
   'Web_Project_Demo.zip',
   'f4d5e6f7-web-demo.zip',
   'archive', 15728640, '/uploads/2026/03/f4d5e6f7-web-demo.zip', 1, 5),

  (5, 3, NULL,
   'ERD_Diagram_UniLink.png',
   'f5e6f7a8-erd-unilink.png',
   'image', 524288, '/uploads/2026/03/f5e6f7a8-erd-unilink.png', 0, 12);


INSERT INTO `messages`
  (`msg_id`,`sender_id`,`receiver_id`,`content`,`type`,`is_read`,`file_id`)
VALUES
  (1, 5, 3,
   'السلام عليكم دكتور، هل يمكنني تسليم التقرير غداً بدلاً من اليوم؟',
   'text', 1, NULL),
  (2, 3, 5,
   'وعليكم السلام رانيا، نعم لا مشكلة، لكن يجب أن يكون قبل الساعة 12 ظهراً.',
   'text', 1, NULL),
  (3, 5, 3,
   'شكراً دكتور، سأرسله في الصباح مع الملاحظات المطلوبة.',
   'text', 1, NULL),
  (4, 5, 3,
   'دكتور، هذا تقرير المشروع كاملاً.',
   'file', 1, 3),
  (5, 6, 7,
   'هل حضرت محاضرة الأمس؟ فاتتني بسبب ظرف طارئ.',
   'text', 1, NULL),
  (6, 7, 6,
   'نعم حضرت، الدكتورة شرحت الفصل الثاني بالكامل. سأشاركك ملاحظاتي.',
   'text', 1, NULL),
  (7, 7, 6,
   'هذا ملف الملاحظات الذي كتبته.',
   'file', 0, 3),
  (8, 6, 1,
   'مرحباً، أواجه مشكلة في تسجيل الدخول، هل يمكنكم المساعدة؟',
   'text', 0, NULL);


INSERT INTO `post_likes` (`post_id`,`user_id`) VALUES
  (1, 3), (1, 4), (1, 5), (1, 6), (1, 7),
  (2, 5), (2, 7), (2, 6),
  (3, 3), (3, 7),
  (4, 5), (4, 6), (4, 7), (4, 8),
  (6, 3), (6, 5),
  (7, 5), (7, 6), (7, 7);


INSERT INTO `reports`
  (`report_id`,`reporter_id`,`post_id`,`reported_user_id`,
   `reason`,`details`,`status`,`handled_by`,`action_taken`)
VALUES
  (1, 7, 5, NULL,
   'spam',
   'المنشور يبدو وكأنه طلب مشبوه للحصول على مواد امتحانات.',
   'pending', NULL, NULL),

  (2, 5, NULL, 9,
   'harassment',
   'هذا المستخدم أرسل لي رسائل خاصة مزعجة ومضايقة.',
   'under_review', 2, NULL),

  (3, 6, 5, NULL,
   'inappropriate_content',
   'المحتوى يحتوي على معلومات غير دقيقة عن المادة.',
   'resolved', 2, 'تم تحذير المستخدم وحذف المنشور المخالف.'),

  (4, 8, 7, NULL,
   'other',
   'أعتقد أن هذا الإعلان لا يخص مادتي.',
   'rejected', 1, 'البلاغ لا يستوفي شروط المخالفة، الإعلان عام وموجه للجميع.');


INSERT INTO `notifications`
  (`user_id`,`type`,`content`,`reference`,`is_read`)
VALUES
  (5, 'post_like',      'أعجب د. أحمد خالد بسؤالك في مجموعة CS-401.',  'post:3', 1),
  (5, 'new_message',    'لديك رسالة جديدة من د. أحمد.',                 'msg:2',  1),
  (5, 'announcement',   'إعلان جديد في مجموعة CS-401: ملف محاضرة الأسبوع الأول.', 'post:2', 1),
  (6, 'new_message',    'لديك رسالة جديدة من نور.',                     'msg:7',  0),
  (6, 'post_like',      'أُعجب 3 أشخاص بمنشورك.',                      'post:5', 1),
  (9, 'account_warning','تم إيقاف حسابك مؤقتاً بسبب بلاغات متعددة، يُرجى التواصل مع الإدارة.', NULL, 0),
  (1, 'report_update',  'تم استقبال بلاغ جديد يحتاج مراجعة.',           'report:1', 0),
  (2, 'report_update',  'تم تعيين بلاغ جديد لك لمراجعته.',             'report:2', 1);


INSERT INTO `audit_logs`
  (`user_id`,`action`,`description`,`ip_address`)
VALUES
  (1, 'register',        'إنشاء حساب المدير omar.admin@unilink.edu',            '192.168.1.1'),
  (3, 'register',        'تسجيل أستاذ: ahmed.prof@unilink.edu',                 '192.168.1.5'),
  (5, 'register',        'تسجيل طالبة: rania.student@unilink.edu',              '10.0.0.20'),
  (5, 'login',           'تسجيل دخول ناجح مع OTP',                             '10.0.0.20'),
  (6, 'login',           'تسجيل دخول ناجح مع OTP',                             '10.0.0.21'),
  (9, 'login_failed',    'محاولة دخول فاشلة — كلمة مرور خاطئة',               '10.0.0.99'),
  (3, 'file_upload',     'رُفع ملف: DB_Week01_Introduction.pdf',                '192.168.1.5'),
  (2, 'account_suspend', 'تعليق حساب سارة علي (STU-2005) بسبب بلاغات',        '192.168.1.2'),
  (1, 'permission_change','تعديل صلاحيات المشرف salma — منح صلاحية حذف المحتوى','192.168.1.1'),
  (5, 'post_create',     'نشر سؤال جديد في مجموعة CS-401',                     '10.0.0.20');

SET FOREIGN_KEY_CHECKS = 1;
