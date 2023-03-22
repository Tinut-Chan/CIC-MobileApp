import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/controller/app_controller.dart';
import 'package:flutter_project/widgets/custom_textfiled.dart';
import 'package:get/get.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key});

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  bool isChecked = false;
  final appController = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              CustomTextFieldWidget(
                initialValue: appController.usernameField.value.text,
                isRequird: true,
                labelText: 'User name ',
                readOnly: false,
                onChanged: (value) {
                  appController.usernameField.value.text = value;
                  debugPrint(
                      '=== UserName: ${appController.usernameField.value.text}');
                },
                validator: (value) {
                  if (value != null && value.length < 100) {
                    return 'String must be at least 8 charactor';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.phone,
              ),
              CustomTextFieldWidget(
                initialValue: appController.nameField.value.text,
                isRequird: false,
                labelText: 'name',
                readOnly: false,
                onChanged: (value) {
                  appController.nameField.value.text = value;
                  debugPrint('=== Name: ${appController.nameField.value.text}');
                },
                validator: (value) {
                  if (value != null && value.length < 100) {
                    return 'String must be at least 8 charactor';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.phone,
              ),
              CustomTextFieldWidget(
                initialValue: appController.ageField.value.text,
                readOnly: false,
                labelText: 'Age',
                onChanged: (value) {
                  appController.ageField.value.text = value;
                  debugPrint('=== Age: ${appController.ageField.value.text}');
                },
                validator: (value) {
                  if (value != null && value.length < 100) {
                    return 'String must be at least 8 charactor';
                  } else {
                    return null;
                  }
                },
                maxLines: 2,
                keyboardType: TextInputType.phone,
              ),
              CustomTextFieldWidget(
                initialValue: appController.phoneNumberField.value.text,
                enable: true,
                readOnly: true,
                onChanged: (value) {
                  appController.phoneNumberField.value.text = value;
                  debugPrint(
                      '=== ValueController === ${appController.ageField.value.text}');
                },
                validator: (value) {
                  if (value != null && value.length < 100) {
                    return 'String must be at least 8 charactor';
                  } else {
                    return null;
                  }
                },
                maxLines: 2,
                keyboardType: TextInputType.phone,
              ),
              CustomTextFieldWidget(
                initialValue: appController.addressField.value.text,
                enable: true,
                readOnly: true,
                onChanged: (value) {
                  appController.ageField.value.text = value;
                  debugPrint(
                      '=== ValueController === ${appController.addressField.value.text}');
                },
                validator: (value) {
                  if (value != null && value.length < 100) {
                    return 'String must be at least 8 charactor';
                  } else {
                    return null;
                  }
                },
                maxLines: 2,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  color: Colors.blue,
                  onPressed: () {},
                  child: const Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
