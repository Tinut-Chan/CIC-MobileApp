import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/controller/app_controller.dart';
import 'package:flutter_project/widgets/custom_textfiled.dart';
import 'package:get/get.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  bool isValidated = false;
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      index.toString(),
                    ),
                  ),
                  title: const Text('Cambodia'),
                  subtitle: const Text('I Love Cambodia'),
                  onTap: () {
                    debugPrint(index.toString());
                  },
                );
              },
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Divider(
                  height: 2,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: CustomTextFieldWidget(
              isRequird: true,
              labelText: 'Enter Your Name:',
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(CupertinoIcons.add),
        onPressed: () async {
          await showModalBottomSheet(
            clipBehavior: Clip.none,
            useSafeArea: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Container(
                padding: const EdgeInsets.only(top: 30.0),
                height: MediaQuery.of(context).size.height * 0.94,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 15.0,
                      left: 3.0,
                      right: 3.0,
                      child: Container(
                        margin: const EdgeInsets.only(left: 7.0, right: 7.0),
                        child: SingleChildScrollView(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.9,
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTapDown: (_) {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              },
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Text(
                                      'Create Information Detail1',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    CustomTextFieldWidget(
                                      isRequird: true,
                                      labelText: 'Enter Your Name:',
                                      onChanged: (value) {
                                        controller.nameField.value.text = value;
                                      },
                                      validator: (value) {
                                        if (controller
                                            .nameField.value.text.isEmpty) {
                                          isValidated = true;
                                        } else {
                                          isValidated = false;
                                        }
                                        return value;
                                      },
                                      isValidate: isValidated,
                                      errorText: 'Please Enter your Name',
                                    ),
                                    const SizedBox(height: 20),
                                    SizedBox(
                                      width: double.infinity,
                                      child: CupertinoButton(
                                        color: Colors.black54,
                                        onPressed: () {
                                          if (isValidated == true) {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              _formKey.currentState!.save();
                                            }
                                            debugPrint(
                                                'validate: $isValidated');
                                          } else {
                                            debugPrint(
                                                '= = = validate $isValidated');
                                          }
                                          controller.clear();
                                        },
                                        child: const Text('Submit'),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -15.0,
                      child: Container(
                        width: 50,
                        height: 8.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
