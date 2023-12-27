import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final IconData prefixIcon;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final TextInputType inputType;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.name,
    required this.prefixIcon,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    required this.inputType,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: TextFormField(
          enabled: true,
          controller: controller,
          textCapitalization: textCapitalization,
          maxLines: 1,
          maxLength: 32,
          obscureText: obscureText,
          keyboardType: inputType,
          textAlign: TextAlign.start,
          style: const TextStyle(color: Colors.black, fontSize: 16),
          validator: (value) => validate(context, name, value),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              prefixIcon: Icon(prefixIcon),
              isDense: true,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.indigo),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.indigo),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              labelText: name,
              counterText: "",
              labelStyle: const TextStyle(
                color: Colors.grey,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.indigo),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.indigo),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              )),
        ));
  }

  validate(BuildContext context, String name, value) {
    if (name == 'Email') {
      if (value == null || value.isEmpty) {
        return 'Please Enter your Email';
      } else if (!isEmailValidate(value)) {
        return 'Please Enter a Valid Email';
      }
    } else if (name == 'Name') {
      if (value == null || value.isEmpty) {
        return 'Please Enter Your Name';
      }
    } else if (name == 'Password') {
      if (value == null || value.isEmpty) {
        return 'Please enter Your Password';
      } else if (value.length < 8) {
        return 'Password can\'t be Less Than 8 Character';
      }
    }

    return null;
  }

  bool isEmailValidate(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}
