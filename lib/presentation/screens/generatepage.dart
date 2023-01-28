import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controller/datacontroller.dart';
import '../widget/bigtext.dart';
import '../widget/detailtext.dart';

class GeneratePage extends StatelessWidget {
  const GeneratePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BigText(text: "Your Resume"),
          const SizedBox(
            height: 10,
          ),
          const BigText(text: "Contact Details:", issmall: true),
          const SizedBox(
            height: 7,
          ),
          DetailText(
            main: "Name: ",
            sub: controller.name.value,
          ),
          DetailText(
            main: "Address: ",
            sub: controller.address.value,
          ),
          DetailText(
            main: "Email: ",
            sub: controller.email.value,
          ),
          DetailText(
            main: "Mobile No: ",
            sub: controller.mobileno.value,
          ),
          const SizedBox(
            height: 10,
          ),
          const BigText(text: "Academic Details:", issmall: true),
          const SizedBox(
            height: 7,
          ),
          DetailText(
            main: "Course: ",
            sub: controller.course.value,
          ),
          DetailText(
            main: "College: ",
            sub: controller.college.value,
          ),
          DetailText(
            main: "Marks: ",
            sub: controller.mark.value,
          ),
          DetailText(
            main: "Passing Year: ",
            sub: controller.year.value,
          ),
          const SizedBox(
            height: 10,
          ),
          const BigText(text: "Experience Details:", issmall: true),
          const SizedBox(
            height: 7,
          ),
          ListView.builder(
              itemCount: controller.explist.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailText(
                      main: "Organization: ",
                      sub: controller.explist[i].organization,
                    ),
                    DetailText(
                      main: "Designation: ",
                      sub: controller.explist[i].designation,
                    ),
                    Row(
                      children: [
                        DetailText(
                          main: "From: ",
                          sub: controller.explist[i].fromdate,
                        ),
                        DetailText(
                          main: "To: ",
                          sub: controller.explist[i].todate,
                        ),
                      ],
                    ),
                    DetailText(
                      main: "Role: ",
                      sub: controller.explist[i].role,
                    ),
                    i != controller.explist.length - 1
                    ? Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.grey.shade600,
                      margin: const EdgeInsets.only(right: 80,left: 6),
                    )
                        : const SizedBox()
                  ],
                );
              }),
          const SizedBox(
            height: 10,
          ),
          const BigText(text: "Project Details:", issmall: true),
          const SizedBox(
            height: 7,
          ),
          ListView.builder(
              itemCount: controller.projectlist.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailText(
                      main: "Project Title: ",
                      sub: controller.projectlist[i].title,
                    ),
                    DetailText(
                      main: "Description: ",
                      sub: controller.projectlist[i].desc,
                    ),
                    DetailText(
                      main: "Duration: ",
                      sub: controller.projectlist[i].duration,
                    ),
                    DetailText(
                      main: "Role: ",
                      sub: controller.projectlist[i].prorole,
                    ),
                    DetailText(
                      main: "Team Size: ",
                      sub: controller.projectlist[i].teamsize,
                    ),
                    i != controller.explist.length - 1
                        ? Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.grey.shade600,
                      margin: const EdgeInsets.only(right: 80,left: 6),
                    )
                        : const SizedBox()
                  ],
                );
              })
        ],
      ),
    );
  }
}
