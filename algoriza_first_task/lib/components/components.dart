// ignore_for_file: must_be_immutable, sort_child_properties_last, prefer_typing_uninitialized_variables

// Flutter imports:
import 'package:flutter/material.dart';

// The Default Button
class DefaultButton extends StatelessWidget {
  double width = double.infinity;
  Color color = Colors.teal;
  bool isUpperCase = true;
  double radius = 0.0;
  String text;
  Color textColor;
  Function? onPressed;

  DefaultButton({
    Key? key,
    required this.width,
    required this.color,
    required this.isUpperCase,
    required this.radius,
    required this.text,
    required this.textColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 52.0,
      child: MaterialButton(
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            fontSize: 15,
            color: textColor,
          ),
        ),
        onPressed: () {},
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

// The defaultFormField
class DefaultFormField extends StatelessWidget {
  TextEditingController? controller;
  TextInputType? type;
  String? label;
  IconData? prefix;
  IconData? suffix;
  var validate;
  bool isPassword = false;
  var suffixPressed;
  var onTap;
  var onChange;

  DefaultFormField({
    Key? key,
    this.controller,
    this.type,
    this.label,
    this.prefix,
    this.suffix,
    this.validate,
    required this.isPassword,
    this.suffixPressed,
    this.onTap,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontFamily: 'Helvetica',
        fontSize: 15,
      ),
      onTap: onTap,
      onChanged: onChange,
      obscureText: isPassword,
      validator: validate,
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        suffixIcon: IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
            color: Colors.black,
          ),
        ),
        labelText: label,
        prefixIcon: Icon(
          prefix,
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.black)),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(
            5,
          ),
        ),
      ),
    );
  }
}

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );
