/*########## OnBoarding ##########

 هو مجموعة من الشاشات التوضيحية التي تظهر للمستخدم عند فتح التطبيق لأول مرة، تهدف إلى تعريف المستخدم بالتطبيق وميزاته،
 وكذلك توجيهه حول كيفية الاستخدام أو جمع بيانات أولية مثل اختيار اللغة أو نوع الحساب.
 
  //(MVC⚙️) تقسيم فكره التنسيق – مين مسؤول عن إيه؟


      >1- Model : file(onboardingmodel.dart) // >>> Slide: ده بيحدد شكل الداتا اللي بتظهر في كل 
        - class OnBoardingModel {  //(Object) ذا كلاس عادي يمثل كائن 
            final String? img;   // مسار الصورة
            final String? title;  // العنوان
            final String? body;    // الوصف
            OnBoardingModel({this.img, this.title, this.body});
          }


      >2- Data Source :  file(static.dart) // >>> OnBoardingModel من Object هو Slide هنا مركز البينات الثابته الذي يكون كل 
            - List<OnBoardingModel> onBoardingList = [
                OnBoardingModel(
                  img: AppImageasset.onboardingOne, // مسار الصوره من كلاس الثوابت
                  title: "Choose Priduct",
                  body:"We Have a 100K+ Products.",
                ),
                OnBoardingModel(
                  img: AppImageasset.onboardingTwo,
                  title: "Easy & Safe Payment",
                  body:"Easy Checkout & Safe Payment.",
                ),
            ]  // يساعد جدا في تنظيم وادخال وعرض البينات
            - جاهزة OnBoarding هنا عندنا قائمة بيانات فيها4 شاشات 
            - PageView كل واحدة فيها عنوان، وصف، وصورة. ودي هي اللي بتتكرر جوه 
            

      >3- Controller : file(onboarding_controller.dart) //>>> OnBoardingControllerImp ده قلب المشروع! يحتوي على  
            - (واجهة المستخدم) UI بالـ (Logic) وهي المسؤولة عن إدارة التنقل بين الشرائح والتحكم في الحالة ربط المنطق
           
            1- التعريف بالملف:
              - abstract class OnboardingController extends GetxController {  // عشان احنا بعدين نرث منة GetxController وهنا يرث من
                  next();
                  onPageChanged(int index);
                }  //next() و onPageChanged() الهدف منه تنظيم الكود، وفرض أن أي كلاس يرث منه لازم يطبّق الدوال
          
            2- الكلاس الرئيسي:
              - class OnBoardingControllerImp extends OnboardingController {} //OnboardingController هو يرث من
              - هذا هو الكونترولر الفعلي اللي راح تشتغل عليه

          
            3- المتغيرات المهمة: 
              -late PageController pageController; //(Slides) اللي يعرض الشرائح PageView يتحكم في
                - من خلاله تستطيع النتقال لسليد معين اعرف معرف الصفحه الحاليه والتحكم في حرجه الصفحات
                 // -PageView(controller: controller.pageController) مثلا PageView نقوم بربطه بتمريره ل 
                 // -PageView وتم ربطه في  OnBoardingControllerImp وهنا الكونترولر من نوع 
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


      >4- Viwe: منفصلة، Widgets إلى عدة OnBoarding تم تقسيم الصفحة الرئيسية 
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
                    class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> { 
                    //الذي يوفره تلقائيا controller باستخدام  OnBoardingControllerImp هنا يتم الوصول لما هوا داخل
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
                        //للوصول ما داخل كلاس الكنترولر 
                        builder: (controller) اذا حدث اي تغيير فيه تعيد بناء ما داخلها وتستخدم OnBoardingControllerImp تترقب ل GetBuilder هنا 
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
                                    : LinearGradient(colors: [AppColor.primaryColor.withOpacity(0.3), 
                                    AppColor.primaryColor.withOpacity(0.1)]),
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

###End OnBoarding ; ####  */