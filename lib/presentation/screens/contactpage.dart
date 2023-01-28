import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controller/datacontroller.dart';
import '../widget/bigtext.dart';
import '../widget/customTextField.dart';
import '../widget/custombutton.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController controller = Get.find();
    TextEditingController name = TextEditingController();
    TextEditingController address = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController mobileno = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const BigText(text: "Contact Details"),
          CustomTextField(
            controller: name,
            label: "Name",
          ),
          CustomTextField(
            controller: address,
            label: "Address",
            maxlines: 4,
          ),
          CustomTextField(
            controller: email,
            label: "Email",
          ),
          CustomTextField(
            controller: mobileno,
            label: "Mobile No",
          ),
          CustomButton(
            name: "Done",
            func: () {
              controller.name.value = name.text;
              controller.address.value = address.text;
              controller.email.value = email.text;
              controller.mobileno.value = mobileno.text;
              // name.clear();
              // address.clear();
              // email.clear();
              // mobileno.clear();
            },
          )
        ],
      ),
    );
  }
}
