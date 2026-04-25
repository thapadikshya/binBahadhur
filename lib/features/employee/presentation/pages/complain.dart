import 'package:binbahadhur/core/theme/app_pallete.dart';
import 'package:binbahadhur/features/employee/Data/complain_services.dart';
import 'package:binbahadhur/features/employee/presentation/widgets/custom_button.dart';
import 'package:binbahadhur/features/employee/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class Complain extends StatefulWidget {
  static const String routeName = '/Complain';
  const Complain({super.key});

  @override
  State<Complain> createState() => _ComplainState();
}

class _ComplainState extends State<Complain> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController DescriptionController = TextEditingController();
  final TextEditingController EmployeeController = TextEditingController();
  final EmployeeServices employeeServices = EmployeeServices();

  final _addComplainFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    DescriptionController.dispose();
    EmployeeController.dispose();
  }

  void complain() {
    if (_addComplainFormKey.currentState!.validate()) {
      employeeServices.complain(
        context: context,
        email: emailController.text,
        description: DescriptionController.text,
        employee: EmployeeController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Complain',
            style: TextStyle(color: AppPallete.whiteColor),
          ),
        ),
        backgroundColor: AppPallete.backgroundColor,
      ),
      backgroundColor: AppPallete.whiteColor,

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: _addComplainFormKey,
            child: Column(
              children: [
                SizedBox(height: 10),
                CustomTextField(
                  controller: emailController,
                  hintText: " Email",
                ),
                SizedBox(height: 10),
                CustomTextField(
                  controller: DescriptionController,
                  hintText: "What is bothering you?",
                  maxLines: 3, //description the size hunxa
                ),
                SizedBox(height: 10),
                CustomTextField(
                  controller: EmployeeController,
                  hintText: "Employee name/Id",
                ),

                SizedBox(height: 20),
                CustomButton(text: " Submit", onTap: complain),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
