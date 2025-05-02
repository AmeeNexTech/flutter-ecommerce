/*### localizations And Services ###

        - Localization: دعم الترجمة داخل التطبيق وتغيير اللغة
        - Services: لحفظ اللغة المختارة حتى بعد إغلاق التطبيق SharedPreferences استخدام 
          - اي تهيئة جميع الخدمات الأساسية (مثل: التخزين المحلي، إعدادات المستخدم، لغة التطبيق، بيانات الجلسة، .. إلخ) قبل تشغيل التطبيق


        > 1- Services: انشئنا خدمه التخزين لحفظ الحاله واي شئ نحتاجه في االتخزين المحلي واي شئ نريد استدعائه قبل بدء التطبيق  
          class MyServices extends GetxService { 
             //وهوا كلاس خاص يسمح بإنشاء خدمات تشتغل طول عمر التطبيق (مثل التخزين، الإعدادات، الاتصال بالإنترنت...) GetxService هذا الكلاس يرث من 
            late SharedPreferences sharedPreferences;
            //لأنه راح يتم تهيئته لاحقًا late استخدمنا SharedPreferences من نوع sharedPreferences هنا بنجهز متغير اسمه
            Future<MyServices> init() async { //إنه يجهز نفسه SharedPreferences داخلها بنطلب من (Future) ترجع مستقبل init()هذه دالة 
              sharedPreferences = await SharedPreferences.getInstance(); //وخزنها داخل المتغير SharedPreferences هذه السطر معناها "هاتلي نسخة من
              return this;  // علشان نقدر نستخدمه بعدين (MyServices يعني نرجع الكائن الحالي من ) this في الآخر نرجع
            }
          }
          initialServices() async {  // runApp() هذه دالة بنسميها لما يبدأ التطبيق قبل
            await Get.putAsync(() => MyServices().init()); //GetX وتخزنها في الذاكرة باستخدام (Service) وظيفتها تجهز الخدمة 
          }  // لكن انتظر لما يجهز GetX معناها سجل هذا الكائن داخل putAsync 
         -ليه بنسوي كده؟
          - في أي مكان في التطبيق بسهولة، بدل ما نعيد إنشاؤه كل مرة SharedPreferences عشان نستخدم 
          -  طوال عمر التطبيق GetX تبقى محفوظة داخل (Service) الخدمة
          - ونقدر نوصل لها في أي مكان عن طريق: >> MyServices myServices = Get.find();
          - >>> myServices.sharedPreferences.setString("lang", "ar");


        > 2- localizations:
          - في تطبيقك (translations) اولا نقوم بعمل كلاس مسؤول عن توفير كل الترجمات
            class MyTranslation extends Translations { // هذا اولا
              Map<String, Map<String, String>> get keys => { //( "ar", "en" مثلاً ) لتحديد اللغه Map أول 
                "ar": {"1": "اهلا"}, //والقيمة هي الترجمة "welcome" تانية للمفاتيح مثلاً "1" أو Map واللي جواها 
                "en": {"1": "hi"},
              };
            }
          - GetMaterialApp( 
            - translations: MyTranslation(), //  هنا بنستخدم الكلاس اللي عملته 
            - locale: Locale('ar'), // اللغة الأساسية للتطبيق 
            - fallbackLocale: Locale('en'),) // لغة بديلة لو حصلت مشكلة


        > 3- قمت ببناء واجها لاختيار اللغه    
          - وكان بها زرارين لتغيير الغه وزرار تاكيد علي الغه والانتقال الي التالي 
                    Custombuttomlang(
                      textbutton: "4".tr, // استخدام الترجمة
                      onPressed: () {
                        controller.changeLang("en"); //الي داله التغيير والحفظ "en" عند الضغط علي هذا الزر سيتم تمرير قيمه 
                      },
                    ),
                  Custombuttomlang(
                      textbutton: "5".tr, // عرض الترجمة
                      onPressed: () {
                        controller.changeLang("ar");//الي داله التغيير والحفظ "ar" عند الضغط علي هذا الزر سيتم تمرير قيمه 
                      },
                  ),
                  CustomButtonOnBoarding(
                    text: "6".tr,
                    onPressed: () {
                      Get.offAllNamed(AppRoute.onboarding); 
                      //سيتم الاكمال بلغه الجهاز وحفظها في الشيرد changeLang("ar") وهنا لانتقال الي الصفحه التاليه بعد اختيار 
                      //وان لم يختر واكمل بلغه الجهاز هكذا لم يتم تمرير اي شئ لداله
                    },
                  ),

            
        > 4-LocaleController: والان الكلاس الذي يحتوي علي دوال التغيير والحفظ
          - // بسهولة onInit() و update() و Get.updateLocale() عني تقدر تستخدم GetxController اولا هوا يرث من 
              class LocaleController extends GetxController {
                Locale? language; // >>> وقابل ان يكون نال حتي يتم تهئتة ويمكن الوصول لهLocale هذا متغير يخزن اللغة الحالية للتطبيق نوعه
                MyServices myServices = Get.find(); //وتخزين فيه وقرائه ما فيه اذا كان مخزن sharedPreferences للوصول لل MyServices لجلب الكائن

                changeLang(String langcode) {  // داله تستقبل  كود الغه وهو نص
                  Locale locale = Locale(langcode); 
                  //تقبل هذا النوع وليس نص الكود Get.updateLocale(Localel) لان Locale إلى كائن ("ar" أو "en") يحول كود اللغه  
                  myServices.sharedPreferences.setString("lang", langcode); //"lang" باسم SharedPreferences يخزّن كود اللغة اللي اختارها المستخدم في
                  language = locale;  //للوصول له من اي مكان language خزن اللغة المختارة في المتغير
                  Get.updateLocale(locale); // GetX يحدّث لغة التطبيق في كل الصفحات باستخدام 
                  update(); //GetBuilder تحديث الواجهة إذا كانت مربوطة بـ 
                }

                @override
                void onInit() { // هذه تعمل عند او ما يحصل حقن او مناديه لهذا الكلاس الذي داخل وهنا يتم حقنه في الصفحه الرئسيه اي اول ما التطبيق يشتغل
                  String? shardPrefLang = myServices.sharedPreferences.getString("lang");  //SharedPreferences يحاول قرائه لو في كود لغه محفوظ في 
                  if (shardPrefLang == "ar") {    // لو عربي
                    language = const Locale("ar"); 
                    //ليتم عرضها locale: controller.language, لانه سيمرر وقتها في الصفحه الرئيسيه الي Locale وهما من نفس النوع language يقوم باسناد الكود الي
                  } else if (shardPrefLang == "en") { // لو انجليزي
                    language = const Locale("en");
                    //ليتم عرضها locale: controller.language, لانه سيمرر وقتها في الصفحه الرئيسيه الي Locale وهما من نفس النوع language يقوم باسناد الكود الي
                  } else { // لو لا يوجد لغه محفوظه
                    language = Locale(Get.deviceLocale!.languageCode); 
                    //اي ليس له علاقه ب المعرف الذي اتلاقاه Get.deviceLocale. معرف داخل languageCode يأخذ لغة الجهاز تلقائيًا وهذا 
                    // اي يحولها لتتناسب معه Locale وايضا هنا ياخذها في صيغه
                    myServices.sharedPreferences.setString(  // >>> لأول مرة SharedPreferences ثم يحفظ اللغة المختارة في
                      "lang",
                      Get.deviceLocale!.languageCode,  // هذا الكود الذي سيحفظ
                    );
                  }super.onInit();
                }
              }            


        5- تمام main هنا اتاكد من انا الاعدادات الربط الرئيسيه في 
          - MyTranslation إعداد لترجمة النصوص وهي ايضا التي يحصل منها علي مفتاح لتحديد الغه وهو كود الغه 
          - لربط الترجمة وتحديث اللغة عبر التطبيق GetMaterialApp الآن سنقوم بإعداد
            - LocaleController controller = Get.put(LocaleController()) //LocaleController تعيين اللغة بناءً على  language تم الحقن للوصول الي 
            - translations: MyTranslation(), لاستخدامه ايها ماب لترجمه 
               لمعرف ما المفتاح المستخرج من Locale للوصول لكود الغه من نوع locale: controller.language, واستخدام 
            - fontFamily: controller.language?.languageCode == "ar" ? "Cairo" : "Poppins", وهنا سيتم تحديد نوع الخط علي حسب الغه المحدده


        6- MyTranslation والان لعرض اي نص بالغتان ندخله في الخريطه الخاصه بالغه بتاعته في     
          - سيتم عرض النص بنائا علي الترجمه "key".tr ويكون كل نص له مفتاح في ايا يكن مكان داخل ويدجكت تكست نديد عليه وبجانبه
          - ومثلا الان عند النداء علي البنات الي ستتك نمرر بشكل منتظم الان مفتاح النص المترجم في صفحه العرض للحصول علي داتا بطريقه منظمه
      // والان ننتقل لصفحه تسجيل دخول وانشاء الحساب

### localizations And Services ###*/