import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:knovtar/presentation/widget/bigtext.dart';
import 'package:knovtar/presentation/widget/custombutton.dart';

import '../../data/controller/datacontroller.dart';
import '../../data/model/experience.dart';
import '../widget/customTextField.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController controller = Get.find();
    TextEditingController organization = TextEditingController();
    TextEditingController designation = TextEditingController();
    TextEditingController role = TextEditingController();

    Future<DateTime> selectdate() async {
      DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101));
      return pickedDate ?? DateTime.now();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const Text(
            "List your latest Experience First",
            style: TextStyle(
                fontSize: 22, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          const BigText(text: "Experience Details"),
          Obx(
            () => controller.explist.isNotEmpty
                ? ListView.builder(
                    itemCount: controller.explist.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          organization.text = controller.explist[i].organization;
                          designation.text = controller.explist[i].designation;
                          role.text = controller.explist[i].role;
                          controller.from.value = controller.explist[i].fromdate;
                          controller.to.value = controller.explist[i].todate;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const BigText(text: "Experience Details"),
                                content: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomTextField(
                                        controller: organization,
                                        label: "Organization",
                                      ),
                                      CustomTextField(
                                        controller: designation,
                                        label: "Designation",
                                      ),
                                      const SizedBox(height: 15,),
                                      Row(
                                        children: [
                                          const Text("From:"),
                                          GestureDetector(
                                              onTap: () async {
                                                controller.from.value = DateFormat("dd-MM-yyyy")
                                                    .format(await selectdate());
                                              },
                                              child: Obx(
                                                () => Text(
                                                  controller.from.value.isNotEmpty ? controller.from.value : "Select",
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.blue,
                                                      fontWeight: FontWeight.w600),
                                                ),
                                              )),
                                          const SizedBox(width: 20,),
                                          const Text("To:"),
                                          GestureDetector(
                                              onTap: () async {
                                                if(!controller.iscurrent.value) {
                                                  controller.to.value = DateFormat("dd-MM-yyyy")
                                                      .format(await selectdate());
                                                }
                                                controller.to.value = DateFormat("dd-MM-yyyy")
                                                    .format(DateTime.now());
                                              },
                                              child: Obx(
                                                () => Text(
                                                  controller.iscurrent.value
                                                      ? DateFormat("dd-MM-yyyy").format(DateTime.now())
                                                      : controller.to.value.isNotEmpty
                                                      ? controller.to.value
                                                      : "Select",
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.blue,
                                                      fontWeight: FontWeight.w600),
                                                ),
                                              )),
                                        ],
                                      ),
                                      CustomTextField(
                                        controller: role,
                                        label: "Role",
                                        maxlines: 2,
                                      ),
                                      CustomButton(
                                          name: "Save",
                                          func: () {
                                            controller.organization.value = organization.text;
                                            controller.designation.value = designation.text;
                                            controller.role.value = role.text;
                                            controller.explist.add(Experience(
                                              organization: controller.organization.value,
                                              designation: controller.designation.value,
                                              fromdate: controller.from.value,
                                              todate: controller.to.value,
                                              role: controller.role.value,
                                            ));
                                            organization.clear();
                                            designation.clear();
                                            role.clear();
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
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade300,
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(controller.explist[i].designation),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text("Add Experience First"),
                  ),
          ),
          const Expanded(child: SizedBox()),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const BigText(text: "Experience Details"),
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextField(
                            controller: organization,
                            label: "Organization",
                          ),
                          CustomTextField(
                            controller: designation,
                            label: "Designation",
                          ),
                          const SizedBox(height: 15,),
                          GestureDetector(
                              onTap: () {
                                controller.iscurrent.value = false;
                              },
                            child: Row(
                              children: [
                                Obx(() => Icon(
                                  controller.iscurrent.value
                                      ? Icons.square_outlined
                                      : Icons.check_box_outlined,
                                  size: 25,
                                  color: controller.iscurrent.value
                                      ? Colors.grey
                                      : Colors.blue,
                                )),
                                const Text("Previous Employer"),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8,),
                          GestureDetector(
                            onTap: () {
                              controller.iscurrent.value = true;
                            },
                            child: Row(
                              children: [
                                Obx(() => Icon(
                                  controller.iscurrent.value
                                      ? Icons.check_box_outlined
                                      : Icons.square_outlined,
                                  size: 25,
                                  color: controller.iscurrent.value
                                      ? Colors.blue
                                      : Colors.grey,
                                )),
                                const Text("Current Employer"),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15,),
                          Row(
                            children: [
                              const Text("From:"),
                              GestureDetector(
                                  onTap: () async {
                                    controller.from.value = DateFormat("dd-MM-yyyy")
                                        .format(await selectdate());
                                  },
                                  child: Obx(() => Text(
                                      controller.from.value.isNotEmpty ? controller.from.value : "Select",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )),
                              const SizedBox(width: 20,),
                              const Text("To:"),
                              GestureDetector(
                                  onTap: () async {
                                    if(!controller.iscurrent.value) {
                                      controller.to.value = DateFormat("dd-MM-yyyy")
                                          .format(await selectdate());
                                    }
                                    controller.to.value = DateFormat("dd-MM-yyyy")
                                        .format(DateTime.now());
                                  },
                                  child: Obx(() => Text(
                                      controller.iscurrent.value
                                          ? DateFormat("dd-MM-yyyy").format(DateTime.now())
                                          : controller.to.value.isNotEmpty
                                          ? controller.to.value
                                          : "Select",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )),
                            ],
                          ),
                          CustomTextField(
                            controller: role,
                            label: "Role",
                            maxlines: 2,
                          ),
                          CustomButton(
                              name: "Save",
                              func: () {
                                controller.organization.value = organization.text;
                                controller.designation.value = designation.text;
                                controller.role.value = role.text;
                                controller.explist.add(Experience(
                                  organization: controller.organization.value,
                                  designation: controller.designation.value,
                                  fromdate: controller.from.value,
                                  todate: controller.to.value,
                                  role: controller.role.value,
                                ));
                                // organization.clear();
                                // designation.clear();
                                // role.clear();
                                // Get.back();
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
