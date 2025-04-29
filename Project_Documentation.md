/*########## Project Structure ############

 // MVC

######### Project Structure ############*/

/*########## OnBoarding ##########
 //1- OnBoarding >> هو سلسلة من الشاشات تظهر للمستخدم عند فتح التطبيق لأول مرة
  // هدفها يكون
      > تعريف المستخدم بالتطبيق وميزاته.
      > توجيه المستخدم لكيفية الاستخدام.
      > أو حتى جمع بعض البيانات الأولية مثل اللغة، أو نوع الحساب... إلخ.

  // OnBoarding  عباره عن اي
      >1- عادةً يتكوّن من مجموعة من الشاشات  يتنقل بينها المستخدم بالسحب أو الضغط على زر التالي Slides : تقسيم الشاشة إلى 
      >2- وهي مثالية لعرض هذه السلايدات معPageView: استخدام 
      > : احترافية مكونة من OnBoarding هدفه هو بناء شاشة
      > Slides (صور + نصوص)  , مؤشرات التقدم (Dots) , زر  للتنقل بين الشرائح “Continue” , عند انتهاء الشرائح، ينتقل تلقائيًا إلى صفحة تسجيل الدخول

  //(MVC⚙️) تقسيم فكره التنسيق – مين مسؤول عن إيه؟

      >1- Model : file(onboardingmodel.dart) // >>> Slide: ده بيحدد شكل الداتا اللي بتظهر في كل ======================================================
        - class OnBoardingModel {  //(Object) ذا كلاس عادي يمثل كائن 
            final String? title;  // العنوان
            final String? img;    // الوصف
            final String? body;   // مسار الصورة
            OnBoardingModel({this.body, this.img, this.title});
          }

      >2- Data Source :  file(static.dart) // >>> OnBoardingModel من Object هو Slide هنا مركز البينات الثابته الذي يكون كل ======================================================
            - List<OnBoardingModel> onBoardingList = [
                OnBoardingModel(
                  title: "Choose Priduct",
                  body:"We Have a 100K+ Products.",
                  img: AppImageasset.onboardingOne, // مسار الصوره من كلاس الثوابت
                ),
                OnBoardingModel(
                  title: "Easy & Safe Payment",
                  body:"Easy Checkout & Safe Payment.",
                  img: AppImageasset.onboardingTwo,
                ),
            ]  // يساعد جدا في تنظيم وادخال وعرض البينات
            - جاهزة OnBoarding هنا عندنا قائمة بيانات فيها4 شاشات 
            - PageView كل واحدة فيها عنوان، وصف، وصورة. ودي هي اللي بتتكرر جوه 

      >3- Controller : file(onboarding_controller.dart) //>>> OnBoardingControllerImp ده قلب المشروع! يحتوي على  ================================================
            - (واجهة المستخدم) UI بالـ (Logic) وهي المسؤولة عن إدارة التنقل بين الشرائح والتحكم في الحالة ربط المنطق
            1- التعريف بالملف:
              - abstract class OnboardingController extends GetxController {  // عشان احنا بعدين هنشتغل بيها لما نورث منة GetxController وهنا يرث من
                  next();
                  onPageChanged(int index);
                }  //next() و onPageChanged() الهدف منه تنظيم الكود، وفرض أن أي كلاس يرث منه لازم يطبّق الدوال
            2- الكلاس الرئيسي:
              - class OnBoardingControllerImp extends OnboardingController {} //OnboardingController هو يرث من
              - هذا هو الكونترولر الفعلي اللي راح تشتغل عليه
              - Implementation اختصار لـ Imp الكلمة 
            3- المتغيرات المهمة: 
              -late PageController pageController; //(Slides) اللي يعرض الشرائح PageView يتحكم في
                - من خلاله تستطيع النتقال لسليد معين اعرف معرف الصفحه الحاليه والتحكم في حرجه الصفحات
                -PageView(controller: controller.pageController) مثلا PageView نقوم بربطه بتمريره ل 
                -PageView وتم ربطه في  OnBoardingControllerImp وهنا الكونترولر من نوع 
                -لانه سيتم تهئته لاحقا قبل استخدامه late وهنا عرفنا المتغير وجعلناه
                -وربطناه بالمتغير PageController يعني هنا أنشأنا فعليًا كائن من onInit() وتكون التهئه داخل
              -int currentPage = 0;  // (slide الحالي). رقم الصفحة الحالية
          4- دالة next():  // الهدف: الانتقال للصفحة التالية
            - next() {
                if (currentPage >= onBoardingList.length - 1) { // لو كانت آخر صفحة → ينتقل لصفحة تسجيل الدخول.
                  Get.offAllNamed(AppRoute.login);
                } else {
                  currentPage++; // يزيدها عند الضغط وهي اقل من عد الصفحات
                  pageController.animateToPage( // المتحكم في الاسلايدات لانتقال
                    currentPage,  // رقم السلايد بعد الضغط اي زياده واحد
                    duration: Duration(milliseconds: 900), // طريقه سرعه التنقل
                    curve: Curves.easeInOut,
                  );  // animateToPage غير كده → يزيد رقم الصفحة بـ 1 ويفتح الصفحة التالية بـ .
                }  //onPageChanged(currentPage) وهكذا يتم تغيير رقم الصفحه الحاليه للسليد فتقوم بعمل تشغيل لداله 
              } //update() وتمرير رقم السليد الحالي للبيج فيو ب
          5-  دالة onPageChanged(int index)
          -onPageChanged(int index) {
              currentPage = index; //next() لمعرف اين نحن الان لاستخدامه في المره القادمه في pageView وهيا ستمرر في currentPage تحدث قيمة 
              update();  // يتم استدعاء عشان أي واجهة مربوطة بهذا الكونترولر تتحدث تلقائيًا.
            }
          6-onInit():
            -void onInit() {
              pageController = PageController();
              super.onInit();
            }  //الكونترولر عند بداية تشغيله (initialization) الهدف: تهيئة.

      >4- Viwe: منفصلة، Widgets إلى عدة OnBoarding تم تقسيم الصفحة الرئيسية =====================================================================================
        -GetX باستخدام OnBoardingControllerImp مرتبط بالـ Widget وكل
        - الخطوات التي يتم فيها الربط:

          >1- أول شيء نقوم به هو تفعيل الكونترولر: OnBoarding الربط مع الكونترولر: في الصفحة الرئيسية
            -Get.put(OnBoardingControllerImp()); 
              -  Widget tree  بحيث يمكن الوصول إليه من أي مكان في الـ  GetX dependency injectionلى الـ OnBoardingControllerImp هذا يقوم بإضافة الـ 
              - للوصول controllerوتوفر ال extends GetView<OnBoardingControllerImp>او ب Get.find() اما ب

          >2-مع جزئين رئيسيين: Column تحتوي الصفحة على هيكل (OnBoarding): الصفحة الرئيسية 
            -(onboarding الذي يعرض الصور والنصوص الخاصة بـ) CustomSliderOnBoarding() الـ 
            -(الذي يعرض المؤشرات الدائرية أسفل الصور) CustomDotOnBoarding() الـ 
            -(الذي يعرض زر الاستمرار)CustomButtonOnBoarding()الـ
                    Get.put(OnBoardingControllerImp()); // ربط الكونترولر
                    child: Column(
                    children: [
                      Expanded(flex: 6, child: CustomSliderOnBoarding()),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            CustomDotOnBoarding(),
                            SizedBox(height: 60),
                            CustomButtonOnBoarding(),
                          ],
                        ),
            - //المختلفة Widgets ومن ثم يتم استخدامه في الـ Get.put() من خلال GetX يتم وضعه في OnBoardingControllerImp  في هذا الكود، الـ
          
          >3- المختلفةWidgets الـ 
            -onboarding screenمنفصل هنا لديه دوره الخاص في عرض جزء معين من الWidget كل

            > 1- CustomSliderOnBoarding :onboardingحيث يمكن التمرير بين صفحات الـPageViewيعرض الـ Widget هذا الـ
              //extends GetView<OnBoardingControllerImp> من قبل في صفحه العرض الان يمكننا الوصول مثلا باستخدام OnBoardingControllerImp ولاننا قمنا بحقن
                -Get.find() تلقائيا يمكننا استخدامه للوصول الي اي شئ داخل كلاس كنترولر الذي حدته وهكذا لا نحتاج الي controller وهذه توفر لنا 
                    class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> { //الذي يوفره تلقائيا controller باستخدام  OnBoardingControllerImp هنا يتم الوصول لما هوا داخل
                      Widget build(BuildContext context) {
                        return PageView.builder(  // هيا تسمح بعض سلايدات التي تمرر
                          controller: controller.pageController,  //وهكذا الذي داخل الكنترولر يتصرف انه هوا PageController ربط الـ 
                          onPageChanged: (val) => controller.onPageChanged(val), // تحديث الصفحة
                          itemCount: onBoardingList.length,  // عدد عناصر المصفوفه عدد الشاشات
                          itemBuilder: (context, i) => Padding(  // بنيه السلايد
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(onBoardingList[i].img!),
                                Text(onBoardingList[i].title!),
                                Text(onBoardingList[i].body!),
                              ],
                            ),
                          ),
                        );
                      }
                    }

            > 2-onboarding يعرض المؤشرات الدائرية التي تشير إلى الصفحة الحالية في ال CustomDotOnBoarding: Widget هذا الـ 
              //GetBuilder<OnBoardingControllerImp> باستخدام OnBoardingControllerImp يتم ربطه بالـ
                -وتغيير حجم وألوان النقاط بناءً على الصفحة الحالية currentPage هنا يتم مراقبة الـ
                  class CustomDotOnBoarding extends StatelessWidget {
                    Widget build(BuildContext context) {
                      return GetBuilder<OnBoardingControllerImp>(  
                        //للوصول ما داخل كلاس الكنترولر builder: (controller) اذا حدث اي تغيير فيه تعيد بناء ما داخلها وتستخدم OnBoardingControllerImp تترقب ل GetBuilder هنا 
                        //builder يُعاد بناء الواجهة داخل update() وتم استدعاء (currentPage مثل ) كلما تغيرت المتغيرات فيه
                        builder: (controller) => Row( // تستخدم لعرض النقاط بجانب بعض في صف.
                          mainAxisAlignment: MainAxisAlignment.center,  // يجعلها في منتصف الشاشة أفقيًا.
                          children: List.generate(  //List.generate(5, (index) => index + 1); يُستخدم لإنشاء (قائمة) بسرعة وبشكل ديناميكي.
                            onBoardingList.length,  // مررت لها اندكس عدد النقاط علي حسب عدد الشاشات
                            (index) => AnimatedContainer(  // إنشاء نقطة لكل صفحة
                              duration: const Duration(milliseconds: 500),
                              width: controller.currentPage == index ? 22 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                gradient: controller.currentPage == index
                                    ? LinearGradient(colors: [AppColor.primaryColor, AppColor.primaryColor.withOpacity(0.6)])
                                    : LinearGradient(colors: [AppColor.primaryColor.withOpacity(0.3), AppColor.primaryColor.withOpacity(0.1)]),
                                borderRadius: BorderRadius.circular(50),  // يجعل النقطة دائرية أو بيضاوية
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  }

            > 3- CustomButtonOnBoarding: في الكونترولر، ليتم الانتقال للصفحة التالية next() يعرض زر الاستمرار الذي عند الضغط عليه ينفذ دالة Widget هذا الـ
            class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
              Widget build(BuildContext context) {
                return ElevatedButton(
                  onPressed: () {
                    controller.next();  // استدعاء دالة next من الكونترولر
                  },
                  child: Text("Continue"),
                );
              }
            }

      // localizations And Services : 
        - Localization: دعم الترجمة داخل التطبيق وتغيير اللغة
        - Services: لحفظ اللغة المختارة حتى بعد إغلاق التطبيق SharedPreferences استخدام 
          - اي تهيئة جميع الخدمات الأساسية (مثل: التخزين المحلي، إعدادات المستخدم، لغة التطبيق، بيانات الجلسة، .. إلخ) قبل تشغيل التطبيق

        > 1- Services: انشئنا خدمه التخزين لحفظ الحاله واي شئ نحتاجه في االتخزين المحلي واي شئ نريد استدعائه قبل بدء التطبيق  
          class MyServices extends GetxService { 
             //وهوا كلاس خاص يسمح بإنشاء خدمات تشتغل طول عمر التطبيق (مثل التخزين، الإعدادات، الاتصال بالإنترنت...) GetxService هذا الكلاس يرث من 
            late SharedPreferences sharedPreferences; //لأنه راح يتم تهيئته لاحقًا late استخدمنا SharedPreferences من نوع sharedPreferences هنا بنجهز متغير اسمه
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
                "ar": {"1": "اهلا"}, //والقيمة هي الترجمة ("welcome" تانية للمفاتيح (مثلاً "1" أو Map واللي جواها 
                "en": {"1": "hi"},
              };
            }
          - GetMaterialApp( 
            - translations: MyTranslation(), //  هنا بنستخدم الكلاس اللي عملته 
            - locale: Locale('ar'), // اللغة الأساسية للتطبيق 
            - fallbackLocale: Locale('en'), // لغة بديلة لو حصلت مشكلة

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
                      //سيتم الاكمال بلغه الجهاز وحفظها في الشيرد changeLang("ar") وهنا لانتقال الي الصفحه التاليه بعد اختيار وان لم يختر واكمل بلغه الجهاز هكذا لم يتم تمرير اي شئ لداله
                    },
                  ),
            
        > 4-LocaleController: والان الكلاس الذي يحتوي علي دوال التغيير والحفظ
          - // بسهولة onInit() و update() و Get.updateLocale() عني تقدر تستخدم GetxController اولا هوا يرث من 
              class LocaleController extends GetxController {
                Locale? language; // >>> وقابل ان يكون نال حتي يتم تهئتة ويمكن الوصول لهLocale هذا متغير يخزن اللغة الحالية للتطبيق نوعه
                MyServices myServices = Get.find(); //وتخزين فيه وقرائه ما فيه اذا كان مخزن sharedPreferences للوصول لل MyServices لجلب الكائن

                changeLang(String langcode) {  // داله تستقبل  كود الغه وهو نص
                  Locale locale = Locale(langcode);  //تقبل هذا النوع وليس نص الكود Get.updateLocale(Localel) لان Locale إلى كائن ("ar" أو "en") يحول كود اللغه  
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
                    language = Locale(Get.deviceLocale!.languageCode); //اي ليس له علاقه ب المعرف الذي اتلاقاه Get.deviceLocale. معرف داخل languageCode يأخذ لغة الجهاز تلقائيًا وهذا 
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
            - لاستخدامه ايها ماب لترجمه translations: MyTranslation(), لمعرف ما المفتاح المستخرج من Locale للوصول لكود الغه من نوع locale: controller.language, واستخدام 
            - fontFamily: controller.language?.languageCode == "ar" ? "Cairo" : "Poppins", وهنا سيتم تحديد نوع الخط علي حسب الغه المحدده

        6- MyTranslation والان لعرض اي نص بالغتان ندخله في الخريطه الخاصه بالغه بتاعته في     
          - سيتم عرض النص بنائا علي الترجمه "key".tr ويكون كل نص له مفتاح في ايا يكن مكان داخل ويدجكت تكست نديد عليه وبجانبه
          - ومثلا الان عند النداء علي البنات الي ستتك نمرر بشكل منتظم الان مفتاح النص المترجم في صفحه العرض للحصول علي داتا بطريقه منظمه
      // والان ننتقل لصفحه تسجيل دخول وانشاء الحساب
    End OnBoarding ,  */

/*########## Login & SignUp ##########

  // Login &&





########## Login & SignUp ##########*/
