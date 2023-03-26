// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataField extends StatelessWidget {
  int? maxlength;
  TextEditingController fieldController = TextEditingController();
  DataField(this.hintText, this.dataType,
      {super.key, required this.fieldController, this.maxlength});
  String hintText;
  TextInputType dataType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fieldController,
      maxLength: maxlength,
      validator: (value) => (value == '') ? 'This Value is Required' : null,
      decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: const Color(0xff4D5151),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
          contentPadding: REdgeInsets.all(16)),
      keyboardType: dataType,
      style: TextStyle(color: Colors.white, fontSize: 14.sp),
    );
  }
}
