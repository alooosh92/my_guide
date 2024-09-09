import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_guide/data/color_manager.dart';
import 'package:my_guide/screen/home/widget/bottom_bar_home.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              "asset/images/icon3.png",
              height: 100,
              width: 100,
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: const BottomBarHome(val: 1),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "نبذه عن حملة دليلي",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    overflow: TextOverflow.fade,
                  )
                ],
              ),
              Text(
                '''تأتي هذه الحملة لدعم النساء العائدات من مخيم الهول لتعزيز الوعي لديهم من خلال التعريف بحقوقهن الاجتماعية والاقتصادية والقانونية لتمكينهن من اخذ الدور الكامل للمشاركة ضمن النسيج الاجتماعي ورقع السوية الفكرية والثقافية لدى هذه الفئة على وجه الخصوص التي عانت من ضغوطات كبيرة اثناء فترة التواجد في المخيمات كما تشمل الحملة الدعم الكامل لأسر العائدات وخاصة الأطفال والوقوف عند الصعوبات والتحديات التي يوجهونها اثناء فترة التعافي ومنها استخراج الأوراق القانونية التي تشكل عائق امامهم وصعوبة في الوصول الى الخدمات الصحية والتعليم واثبات الهوية الشخصية لدى الأمهات العائدات واطفالهن – الوقوف عند هذا التحدي
يساهم في تعزيز الدمج الاجتماعي   والوقوف عند هذه المشكلة وحيثياتها وطرق علاجها لتحسين الظروف   الاقتصادية والاجتماعية والقانونية للنساء   العائدات واسرهن
يتطلب هذا الامر البحث مع أصاب القرار ضمن الإدارات الخدمية 
  والفاعلين من أطياف المجتمع وقادة المجتمع المحلي التعاون الكامل لتشكيل مراجع رئيسية تشتمل على المعلومات الازم توفرها وكيفية   الوصول اليها لضمان حقوق النساء العائدات من ثبوتيات قانونية ودليل   للوصول الى الخدمات المتاحة التي 
1-	تعزيز التماسك الاجتماعي بين  النساء ا العائدة من مخيم الهول  والمجتمع المضيف
2-	رفع مستوى المعرفة بين النساء العائدات بحقوقهن القانونية والاجتماعية والاقتصادية، وكيفية الوصول إلى هذه الحقوق 
3-	تحقيق وصول النساء العائدات وأطفالهن إلى الخدمات الصحية والتعليمية والاجتماعية اللازمة لإعادة الاستقرار والنمو 
تحتاجها النساء العائدات من المخيم كل هذا يتحقق من العمل   التنسيق ضمن ورشات وجلسات يشارك فيها الفاعلين في المنطقة وأصحاب القرا لتوفير الدعم الكامل لهذه الفئة التي عانت ومازالت تعاني من نقص تام على كافة الأصعدة 
''',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                overflow: TextOverflow.fade,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "هدف حملة دليلي العام",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    overflow: TextOverflow.fade,
                  )
                ],
              ),
              Text(
                '''دعم النساء العائدات من مخيم الهول وأطفالهن في المنطقة  من خلال زيادة الوعي بحقوقهن وتسهيل وصولهن إلى الخدمات الأساسية (القانونية –  الصحية - الخدمية )
''',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                overflow: TextOverflow.fade,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "هدف حملة دليلي الخاص",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    overflow: TextOverflow.fade,
                  )
                ],
              ),
              Text(
                '''تمكين النساء العائدات من ممارسة دورهن ضمن أطياف المجتمع
''',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                overflow: TextOverflow.fade,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "رسالة حملة دليلي",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    overflow: TextOverflow.fade,
                  )
                ],
              ),
              Text(
                '''تعزيز التواصل والدمج المجتمعي بين النساء العائدات من مخيم الهول و المجتمع المضيف 
  الحق في حياة كريمة ومستقرة، من خلال التغيير الإيجابي وتوفير الدعم اللازم، لتمكين هؤلاء النساء من بناء حياة كريمة 
نسعى إلى تغيير الواقع، عبر زيادة الوعي بحقوق النساء، من خلال تقديم الدعم ، وتسهيل الإجراءات القانونية لاستعادة الأوراق الرسمية وتحسين الواقع الخدمي والمعيشي والسعي

''',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                overflow: TextOverflow.fade,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
