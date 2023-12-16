import 'package:Division/Library/values/app_color.dart';
import 'package:Division/Library/values/app_constants.dart';
import 'package:Division/Library/values/route.dart';
import 'package:Division/components/apexTextForm.dart';
import 'package:Division/resouce/vector.dart';
import 'package:Division/utlits/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
class FacebookLoginScreen extends StatefulWidget {
  const FacebookLoginScreen({super.key});

  @override
  State<FacebookLoginScreen> createState() => _FacebookLoginScreenState();
}

class _FacebookLoginScreenState extends State<FacebookLoginScreen> {
  final _formKey = GlobalKey <FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final size = context.mediaQuerySize;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.login_rounded),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: size.height* 0.24,
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFF039BE5),
                          Color(0xFFE1F5FE),
                          Color(0xFF03A9F4),
                        ]
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sign In To Your \nAccount',
                        style: Theme.of(context).textTheme.titleLarge,
                        
                      ),
                      Gap(10),
                      Text('Sign In To Your Account',
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppTextFormField(
                          textInputAction: TextInputAction.next,
                          labelText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                        onChanged: (value){
                            _formKey.currentState?.validate();
                        },
                        validator: (value){
                          return value!.isEmpty
                              ? 'Please , Enter Email Address'
                              : AppConstants.emailRegex.hasMatch(value)
                              ? null
                              : 'Invalid Email Address' ;
                        },
                      ),
                      AppTextFormField(
                          textInputAction: TextInputAction.done,
                          labelText: 'Password',
                          keyboardType: TextInputType.visiblePassword,
                          controller: _passwordController,
                        obscureText: isObscure,
                        onChanged: (value){
                            _formKey.currentState?.validate();
                        },
                        validator: (value){
                            return value!.isEmpty
                                ? 'Please Enter Your Password'
                                : AppConstants.passwordRegex.hasMatch(value)
                                ? null
                                : 'Invalid Password';
                        },
                        suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 15),
                          child: IconButton(onPressed: (){
                            setState(() {
                              isObscure = !isObscure;
                            });

                          },
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                  const Size(48, 48)
                                ),
                              ),
                              icon:  Icon(
                                isObscure
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.black,
                              )
                          ),
                        ),

                      ),
                      TextButton(onPressed: (){},
                          style: Theme.of(context).textButtonTheme.style,
                          child: Text('Forget Password',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ),
                      Gap(15),
                      FilledButton(onPressed: _formKey.currentState?.validate()?? false?  (){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Logged In!'),
                        ),
                        );
                        _emailController.clear();
                        _passwordController.clear();
                      }: null,
                          style: const ButtonStyle().copyWith(
                            backgroundColor: MaterialStateProperty.all(
                              _formKey.currentState?.validate()??false
                                  ?null
                                  : Colors.grey.shade300,
                            )
                          ),
                          child: Text('LogIn'),
                      ),
                      Gap(15),
                      Row(
                        children: [
                          Expanded(
                              child: Divider(
                                color: Colors.grey.shade200,
                              ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(
                              horizontal: 20),
                            child: Text(
                              'Or Log in With',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(child: Divider(
                            color: Colors.grey.shade200,

                          ),
                          ),

                        ],
                      ),
                      Gap(15),
                      Row(
                        children: [
                          Expanded(child: OutlinedButton.icon(
                              onPressed: (){},
                              style: Theme.of(context).outlinedButtonTheme.style,
                              icon: SvgPicture.asset(
                                Vectors.googleIcon,
                                width: 14,
                              ),
                              label: const Text('Google',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                          ),
                          ),
                          Expanded(child: OutlinedButton.icon(
                            onPressed: (){},
                            style: Theme.of(context).outlinedButtonTheme.style,
                            icon: SvgPicture.asset(
                              Vectors.facebookIcon,
                              width: 14,
                            ),
                            label: const Text('FaceBook',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text("Don't Have an Account?",
                             style: Theme.of(context)
                                 .textTheme
                                 .bodySmall
                                 ?.copyWith(color: Colors.black),
                            ),
                            TextButton(onPressed: () => AppRoutes.registerScreen.pushName(),
                             style: Theme.of(context).textButtonTheme.style,

                             child: Text('Register',
                               style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                 color: AppColors.primaryColor,
                                 fontWeight: FontWeight.bold,
                             ),
                            ),
                            ),
                          ],
                        ),
                      ),



                    ],
                  ),
                ),
              ],

            ),
        ),
        
      ),


    );
  }
}
