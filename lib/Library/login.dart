import 'package:Flutter_Library/Library/values/registration.dart';
import 'package:Flutter_Library/Widget/app_button.dart';
import 'package:Flutter_Library/Widget/custom_textfield.dart';
import 'package:Flutter_Library/Widget/top_title.dart';
import 'package:Flutter_Library/service/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  LoginPage ({super.key});
  final formKey = GlobalKey <FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            key: formKey,
            child: Form(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopTitle(
                    title: 'Login', 
                    subTitle: 'Welcome Back'),
                CustomTextField(
                    controller: emailController, 
                    name: 'Email', 
                    prefixIcon: Icons.email_outlined, 
                    inputType: TextInputType.emailAddress),
                CustomTextField(
                    controller: passController, 
                    name: 'Password', 
                    prefixIcon: Icons.lock_outline, 
                    inputType: TextInputType.text),
                AppButton(
                    text: 'Login', 
                    onTap: (){
                      if(formKey.currentState!.validate()){
                        AuthServices.login(
                            context, emailController.text, 
                            passController.text);
                      }
                    }
                    ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_)=> RegisterPage())), 
                      child: const Text('Register')),
                ),

              ],
              
            )),
            
          ),
      ),
      
    );
    
  }
}