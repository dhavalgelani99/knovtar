import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knovtar/presentation/screens/projectpage.dart';

import '../../data/controller/datacontroller.dart';
import '../../data/source/datasource.dart';
import 'academicpage.dart';
import 'contactpage.dart';
import 'experiencepage.dart';
import 'generatepage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    DataController controller = Get.find();

    List pagelist = [
      const ContactPage(),
      const AcademicPage(),
      const ExperiencePage(),
      const ProjectPage(),
      const GeneratePage(),
    ];
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          Obx(() => Expanded(child: pagelist[controller.bottombar.value])),
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listdata.length,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      controller.bottombar.value = i;
                    },
                    child: Obx(() => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: controller.bottombar.value == i ? Colors.blue.shade800 : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2, color: Colors.blue.shade800)
                        ),
                        child: Text(listdata[i], style: TextStyle(fontSize: 18, color: controller.bottombar.value == i ? Colors.white : Colors.blue.shade800)),
                      ),
                    ),
                  );
                },
            ),
          )
        ],
      )
    );
  }
}
