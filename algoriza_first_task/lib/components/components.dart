// The defaultButon

// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  double width = double.infinity;
  Color color = Colors.teal;
  bool isUpperCase = true;
  double radius = 0.0;
  String text;
  void Function()? onPressed;

  DefaultButton({
    Key? key,
    required this.width,
    required this.color,
    required this.isUpperCase,
    required this.radius,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            fontSize: 15,
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

class DefaultFormField {
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
    this.controller,
    this.type,
    required this.label,
    required this.prefix,
    required this.suffix,
    required this.validate,
    required this.isPassword,
    this.suffixPressed,
    this.onTap,
    this.onChange,
  });

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
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.black)),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(
            25,
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
