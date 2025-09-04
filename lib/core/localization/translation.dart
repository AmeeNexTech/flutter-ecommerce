import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'ar': {
      '1': 'اللغة',
      '2': 'حدد لغة أو متابعة لغة جهازك.',
      '3': 'تحديد اللغة',
      '4': 'الإنجليزية',
      '5': 'العربية',
      '6': 'متابعة بـ العربية',
      'onboardingTitle1': 'اختر منتجك',
      'onboardingBody1':
          'لدينا أكثر من 100 ألف منتج. اختر منتجك من متجرنا الإلكتروني.',
      'onboardingTitle2': 'دفع سهل وآمن',
      'onboardingBody2':
          'عملية شراء سهلة وطريقة دفع آمنة. موثوقة من قبل عملائنا حول العالم.',
      'onboardingTitle3': 'تتبع طلبك',
      'onboardingBody3':
          'تم استخدام أفضل أدوات التتبع لمتابعة طلبك. ستعرف مكان منتجك في كل لحظة.',
      'onboardingTitle4': 'توصيل سريع',
      'onboardingBody4': 'توصيل سريع وموثوق. نحن نوصل منتجك بأسرع طريقة ممكنة.',
      '7': 'متابعة',
      'sign1': 'تسجيل الدخول',
      'sign2': 'مرحبًا بعودتك',
      'sign3': 'سجّل الدخول للوصول إلى حسابك ومتابعة التسوق',
      'sign4': 'البريد الإلكتروني',
      'sign5': 'كلمة المرور',
      'sign6': 'هل نسيت كلمة المرور؟',
      'sign7': 'تسجيل الدخول',
      'sign8': 'ليس لديك حساب؟',
      'sign9': 'إنشاء حساب',

      'signUp': 'إنشاء حساب',
      'signUp1': 'لنبدأ الآن',
      'signUp2': 'أنشئ حسابك واستمتع بتجربة التسوق معنا',
      'signUp3': 'إنشاء حساب',

      'fieldUsername': 'اسم المستخدم',
      'fieldEmail': 'البريد الإلكتروني',
      'fieldPhone': 'رقم الهاتف',
      'fieldPassword': 'كلمة المرور',
      'signUp4': 'لديك حساب بالفعل؟',
      'signUp5': 'سجّل الدخول',

      'recover_password': 'استعادة كلمة المرور',
      'recover_password_subtitle': 'استرجاع كلمة المرور',
      'recover_password_instruction':
          'أدخل بريدك الإلكتروني وسنرسل لك رمزًا لإعادة تعيين كلمة المرور.',
      'email': 'البريد الإلكتروني',
      'send_code': 'إرسال الرمز',
      'remember_password': 'تتذكر كلمة المرور؟',
      'sign_in': 'تسجيل الدخول',

      'verify_code': 'تحقق من الرمز',
      'enter_verification_code': 'أدخل رمز التحقق',
      'code_sent_to': 'تم إرسال رمز مكون من 6 أرقام إلى بريدك الإلكتروني',

      'reset_password': 'إعادة تعيين كلمة المرور',
      'reset_password_title': 'أعد تعيين كلمة المرور',
      'reset_password_instruction': 'أنشئ كلمة مرور جديدة وأكدها للمتابعة.',
      'enter_password': 'أدخل كلمة المرور',
      'confirm_password': 'تأكيد كلمة المرور',
      'save': 'حفظ',

      'success': 'تم بنجاح',
      'password_reset_successful': 'تمت إعادة تعيين كلمة المرور بنجاح',
      'go_to_home': 'سيتم إعادة توجيهك للصفحة الرئيسية.',

      'verify_email': 'تأكيد البريد الإلكتروني',
      'enter_email_verification_code': 'أدخل رمز التحقق',
      'we_sent_code_to': 'تم إرسال رمز التحقق إلى ',
      'did_not_receive_code': 'لم يصلك الرمز؟',
      'resend_code': 'إعادة إرسال الرمز',
      'successs': 'تم بنجاح',
      'done_check': 'تم التحقق من بريدك الإلكتروني بنجاح',

      // Buttons/loading
      'verify': 'تحقق',
      'verifying': 'جاري التحقق...',

      // OTP error message
      'otp_invalid': 'يرجى إدخال رمز مكون من 6 أرقام صالح',

      // App name
      'app_name': 'متجر شوبوريا',

      'validation.email.empty': 'أدخل البريد الإلكتروني',
      'validation.email.missing_at': 'يجب أن يحتوي على @',
      'validation.email.missing_dot': 'يجب أن يحتوي على نقطة',
      'validation.email.invalid_format': 'الصيغة غير صحيحة',

      'validation.username.empty': 'أدخل اسم المستخدم',
      'validation.username.too_short': 'قصير جدًا (3+ أحرف)',
      'validation.username.too_long': 'طويل جدًا (20 كحد أقصى)',
      'validation.username.invalid_chars': 'مسموح بالحروف، الأرقام، و (_) فقط',

      'validation.phone.empty': 'أدخل رقم الهاتف',
      'validation.phone.invalid_format': 'الصيغة غير صحيحة (11 رقمًا)',

      'validation.password.empty': 'أدخل كلمة المرور',
      'validation.password.too_short': 'قصيرة (8+ أحرف)',
      'validation.password.too_long': 'طويلة (32 كحد أقصى)',
      'validation.password.needs_uppercase': 'تحتاج حرفًا كبيرًا',
      'validation.password.needs_lowercase': 'تحتاج حرفًا صغيرًا',
      'validation.password.needs_number': 'تحتاج رقمًا',
      'validation.password.only_letters_numbers': 'فقط حروف وأرقام',

      'validation.confirm_password.empty': 'أكد كلمة المرور',
      'validation.confirm_password.not_match': 'غير متطابقة',

      'exit_title': 'تأكيد الخروج',
      'exit_desc': 'هل أنت متأكد أنك تريد الخروج من التطبيق؟',
      'exit_yes': 'نعم',
      'exit_no': 'لا',

      // Snackbar default titles
      'error': 'خطأ',
      'info': 'معلومة',

      // API error messages
      'error.connection_timeout': 'انتهت المهلة. تحقق من اتصالك بالإنترنت.',
      'error.request_cancelled': 'تم إلغاء الطلب',
      'error.no_internet': 'لا يوجد اتصال بالإنترنت',
      'error.generic_try_again': 'حدث خطأ ما. يرجى المحاولة مرة أخرى.',
      'error.unexpected': 'حدث خطأ غير متوقع.',
      'error.bad_request': 'طلب غير صالح. يرجى التحقق من الإدخال.',
      'error.unauthorized': 'غير مصرح. يرجى تسجيل الدخول مجددًا.',
      'error.forbidden': 'تم رفض الوصول.',
      'error.not_found': 'المورد غير موجود.',
      'error.validation_failed': 'فشل التحقق. يرجى التحقق من الإدخال.',
      'error.too_many_requests': 'طلبات كثيرة. حاول لاحقًا.',
      'error.server_error': 'خطأ في الخادم. حاول لاحقًا.',
      'error.something_wrong': 'حدث خطأ ما.',
      'error.processing_request': 'حدث خطأ أثناء معالجة الطلب.',
      'error.invalid_password': 'كلمة المرور غير صحيحة',
      'Send_Code': 'إرسال الرمز',
    },
    'en': {
      '1': 'Language',
      '2': 'Select a language or continue with  \n your device language.',
      '3': 'Select Language',
      '4': 'English ',
      '5': 'Arabic',
      '6': 'Continue with English',
      'onboardingTitle1': 'Choose Product',
      'onboardingBody1':
          'We Have a 100K+ Products. Choose Your product from our E-commerce shop.',
      'onboardingTitle2': 'Easy & Safe Payment',
      'onboardingBody2':
          'Easy Checkout & Safe Payment method. Trusted by our Customers from all over the world.',
      'onboardingTitle3': 'Track Your Order',
      'onboardingBody3':
          'Best Tracker has been Used For Track your order. You’ll know where your product is at the moment.',
      'onboardingTitle4': 'Fast Delivery',
      'onboardingBody4':
          'Reliable And Fast Delivery. We Deliver your product the fastest way possible.',
      '7': 'Continue',
      'sign1': 'Sign In',
      'sign2': 'Welcome back',
      'sign3': 'Login to access your account and continue shopping',
      'sign4': 'Email',
      'sign5': 'Password',
      'sign6': 'Forgot your password?',
      'sign7': 'Sign In',
      'sign8': 'Don’t have an account?',
      'sign9': 'Sign Up',

      'signUp': 'Sign Up',
      'signUp1': 'Let’s get you started',
      'signUp2': 'Create your account to enjoy shopping with us',
      'signUp3': 'Sign Up',

      'fieldUsername': 'Username',
      'fieldEmail': 'Email',
      'fieldPhone': 'Phone number',
      'fieldPassword': 'Password',
      'signUp4': 'Already have an account?',
      'signUp5': 'Sign In',

      'recover_password': 'Recover Password',
      'recover_password_subtitle': 'Recover your password',
      'recover_password_instruction':
          'Enter your email and we will send you a code to reset your password.',
      'email': 'Email',
      'send_code': 'Send Code',
      'remember_password': 'Remember your password?',
      'sign_in': 'Sign In',

      'verify_code': 'Verify Code',
      'enter_verification_code': 'Enter Verification Code',
      'code_sent_to': 'We sent a 6-digit code to your email: ',

      'reset_password': 'Reset Password',
      'reset_password_title': 'Reset Your Password',
      'reset_password_instruction':
          'Create a new password and confirm it to continue.',
      'enter_password': 'Enter password',
      'confirm_password': 'Confirm password',
      'save': 'Save',

      'success': 'Success',
      'password_reset_successful': 'Password Reset Successful',
      'go_to_home': 'You will be redirected to the home page.',

      'verify_email': 'Verify Email',
      'enter_email_verification_code':
          'Enter the verification code sent to your email',
      'we_sent_code_to': 'We\'ve sent a verification code to ',
      'did_not_receive_code': 'Didn\'t receive the code?',
      'resend_code': 'Resend Code',
      'successs': 'Success',
      'done_check': 'Your email has been verified successfully',

      // Buttons/loading
      'verify': 'Verify',
      'verifying': 'Verifying...',

      // OTP error message
      'otp_invalid': 'Please enter a valid 6-digit code',

      // App name
      'app_name': 'Ecommerce Shoporia',

      'validation.email.empty': 'Enter your email',
      'validation.email.missing_at': 'Must contain @',
      'validation.email.missing_dot': 'Must contain a dot',
      'validation.email.invalid_format': 'Invalid format',

      'validation.username.empty': 'Enter username',
      'validation.username.too_short': 'Too short (min 3)',
      'validation.username.too_long': 'Too long (max 20)',
      'validation.username.invalid_chars': 'Only letters, numbers, _',

      'validation.phone.empty': 'Enter phone number',
      'validation.phone.invalid_format': 'Invalid format (11 digits)',

      'validation.password.empty': 'Enter password',
      'validation.password.too_short': 'Too short (min 8)',
      'validation.password.too_long': 'Too long (max 32)',
      'validation.password.needs_uppercase': 'Needs uppercase letter',
      'validation.password.needs_lowercase': 'Needs lowercase letter',
      'validation.password.needs_number': 'Needs a number',
      'validation.password.only_letters_numbers': 'Letters/numbers only',

      'validation.confirm_password.empty': 'Confirm password',
      'validation.confirm_password.not_match': 'Passwords mismatch',

      'exit_title': 'Exit Confirmation',
      'exit_desc': 'Are you sure you want to exit the app?',
      'exit_yes': 'Yes',
      'exit_no': 'No',

      // Snackbar default titles
      'error': 'Error',
      'info': 'Info',

      // API error messages
      'error.connection_timeout':
          'Connection timeout. Please check your internet connection.',
      'error.request_cancelled': 'Request was cancelled',
      'error.no_internet': 'No internet connection',
      'error.generic_try_again': 'Something went wrong. Please try again.',
      'error.unexpected': 'An unexpected error occurred.',
      'error.bad_request': 'Bad request. Please check your input.',
      'error.unauthorized': 'Unauthorized. Please login again.',
      'error.forbidden': 'Access denied.',
      'error.not_found': 'Resource not found.',
      'error.validation_failed': 'Validation failed. Please check your input.',
      'error.too_many_requests': 'Too many requests. Please try again later.',
      'error.server_error': 'Server error. Please try again later.',
      'error.something_wrong': 'Something went wrong.',
      'error.processing_request':
          'An error occurred while processing the request.',
      'error.invalid_password': 'Invalid password',
      'Send_Code': 'Send Code',
    },
  };
}
