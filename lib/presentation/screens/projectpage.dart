import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knovtar/data/model/experience.dart';
import 'package:knovtar/presentation/widget/custombutton.dart';

import '../../data/controller/datacontroller.dart';
import '../widget/bigtext.dart';
import '../widget/customTextField.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController controller = Get.find();
    TextEditingController title = TextEditingController();
    TextEditingController desc = TextEditingController();
    TextEditingController duration = TextEditingController();
    TextEditingController prorole = TextEditingController();
    TextEditingController teamsize = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const BigText(text: "Project Details"),
          Obx(
                () => controller.projectlist.isNotEmpty
                ? ListView.builder(
              itemCount: controller.projectlist.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    title.text = controller.projectlist[i].title;
                    desc.text = controller.projectlist[i].desc;
                    duration.text = controller.projectlist[i].duration;
                    prorole.text = controller.projectlist[i].prorole;
                    teamsize.text = controller.projectlist[i].teamsize;
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const BigText(text: "Project Details"),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomTextField(
                                  controller: title,
                                  label: "Project Title",
                                ),
                                CustomTextField(
                                  controller: desc,
                                  label: "Description",
                                ),
                                CustomTextField(
                                  controller: duration,
                                  label: "Duration / Time",
                                ),
                                CustomTextField(
                                  controller: prorole,
                                  label: "Role",
                                ),
                                CustomTextField(
                                  controller: teamsize,
                                  label: "Team Size",
                                ),
                                CustomButton(name: "Save", func: () {}),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Obx(() => Text(controller.projectlist[i].title)),
                  ),
                );
              },
            )
                : const Center(
              child: Text("Add Project First"),
            ),
          ),
          const Expanded(child: SizedBox()),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const BigText(text: "Project Details"),
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextField(
                            controller: title,
                            label: "Project Title",
                          ),
                          CustomTextField(
                            controller: desc,
                            label: "Description",
                          ),
                          CustomTextField(
                            controller: duration,
                            label: "Duration / Time",
                          ),
                          CustomTextField(
                            controller: prorole,
                            label: "Role",
                          ),
                          CustomTextField(
                            controller: teamsize,
                            label: "Team Size",
                          ),
                          CustomButton(name: "Save", func: () {
                            controller.projectlist.add(Project(
                                title: title.text,
                                desc: desc.text,
                                duration: duration.text,
                                prorole: prorole.text,
                                teamsize: teamsize.text,
                            ));
                            // title.clear();
                            // desc.clear();
                            // duration.clear();
                            // prorole.clear();
                            // teamsize.clear();
                            Get.back();
                          }),
                        ],
                      ),
                    ),
                  );
                },
              );

            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blue.shade800,
              ),
              child: const Icon(Icons.add, size: 25, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
