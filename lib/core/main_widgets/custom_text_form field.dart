import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {super.key,
      this.preIcon,
      required this.hintText,
      required this.MyController});

  final String hintText;
  final IconData? preIcon;

  final TextEditingController MyController;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: _focus.hasFocus ? 4 : 0,
      borderRadius: BorderRadius.circular(20),
      shadowColor: Colors.grey.withOpacity(0.6),
      child: TextFormField(
          focusNode: _focus,
          controller: widget.MyController,
          validator: (data) {
            if (data!.trim().isEmpty || data == null || data == '') {
              return 'This Field is Required';
            }
          },
          cursorColor: AppConstants.kPrimaryColor,
          style: TextStyle(),
          decoration: InputDecoration(
              fillColor: Colors.transparent,
              filled: true,
              isDense: true,
              errorMaxLines: 1,
              errorStyle: TextStyle(
                color: Colors.transparent,
                fontSize: 0,
              ),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(20)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(20)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppConstants.kPrimaryColor,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: AppConstants.kPrimaryColor,
                  )),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppConstants.kPrimaryColor)),
              hintStyle: TextStyle(),
              hintText: widget.hintText,
              labelStyle: TextStyle(),
              prefixIcon: GestureDetector(
                child: Container(
                    child: Icon(
                  widget.preIcon,
                  size: 26,
                  color: AppConstants.kPrimaryColor,
                )),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
              ),

          )),
    );
  }
}
