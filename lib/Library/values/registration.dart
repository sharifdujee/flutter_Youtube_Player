import 'package:flutter/material.dart';
import 'package:Flutter_Library/Widget/app_button.dart';
import 'package:Flutter_Library/Widget/custom_textfield.dart';
import 'package:Flutter_Library/Widget/top_title.dart';
import 'package:Flutter_Library/service/auth_service.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key}) ;

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopTitle(
                  title: 'Register',
                  subTitle: 'Create an Account',
                ),
                CustomTextField(
                  controller: nameController,
                  name: 'Name',
                  prefixIcon: Icons.person_outline,
                  inputType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                ),
                CustomTextField(
                  controller: emailController,
                  name: 'Email',
                  prefixIcon: Icons.email_outlined,
                  inputType: TextInputType.emailAddress,
                ),
                CustomTextField(
                  controller: passController,
                  name: 'Password',
                  prefixIcon: Icons.lock_outline,
                  inputType: TextInputType.text,
                  obscureText: true,
                ),
                AppButton(
                  text: 'Register',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      AuthServices.createUser(
                        context,
                        nameController.text,
                        emailController.text,
                        passController.text,
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('LogIn'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
