import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knovtar/presentation/widget/customTextField.dart';
import 'package:knovtar/presentation/widget/custombutton.dart';

import '../../data/controller/datacontroller.dart';
import '../widget/bigtext.dart';

class AcademicPage extends StatelessWidget {
  const AcademicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController controller = Get.find();
    TextEditingController course = TextEditingController();
    TextEditingController college = TextEditingController();
    TextEditingController mark = TextEditingController();
    TextEditingController year = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const Text("List your highest education", style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.w600),),
          const SizedBox(height: 10,),
          const BigText(text: "Academic Details"),
          CustomTextField(
              controller: course,
              label: "Course/Degree",
          ),
          CustomTextField(
            controller: college,
            label: "College/University",
          ),
          CustomTextField(
            controller: mark,
            label: "Marks",
          ),
          CustomTextField(
            controller: year,
            label: "Year of Passing",
          ),
          CustomButton(name: "Save", func: () {
            controller.course.value = course.text;
            controller.college.value = college.text;
            controller.mark.value = mark.text;
            controller.year.value = year.text;
            // course.clear();
            // college.clear();
            // mark.clear();
            // year.clear();
          }),
        ],
      ),
    );
  }
}
