import 'package:flutter/material.dart';

class EmailFieldWidget extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final TextEditingController controller;
  const EmailFieldWidget(
      {super.key, required this.isFirst, required this.isLast, required this.controller});

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius;
    BoxShadow? boxShadow;
    if (isFirst == true && isLast == true) {
      borderRadius = BorderRadius.circular(10);
      boxShadow = BoxShadow(
        color: Color(0xffe7eaf0),
        offset: Offset(0, 10),
        blurRadius: 5,
        spreadRadius: 2,
      );
    } else if (isFirst == true) {
      borderRadius = BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      );
      boxShadow = BoxShadow(
        color: Color(0xffe7eaf0),
        offset: Offset(0, 10),
        blurRadius: 5,
        spreadRadius: 2,
      );
    } else if (isLast == true) {
      borderRadius = BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      );
      boxShadow = BoxShadow(
        color: Color(0xffe7eaf0),
        offset: Offset(0, 10),
        blurRadius: 5,
        spreadRadius: 2,
      );
    } else {
      borderRadius = BorderRadius.zero;
      boxShadow = null;
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: 325,
      height: 59,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: Color(0xffffffff),
        boxShadow: boxShadow != null ? [boxShadow] : null,
      ),
      child: TextFormField(
        validator: (value) {
          if (value == null || value == '') {
            return 'Email is required';
          } else if (!value.split('@').last.contains('gmail')) {
            return 'Enter Valid Gmail';
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        cursorColor: Color(0xffff6969),
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.email_outlined,
            size: 20,
            color: Color(
              0xff727c8e,
            ),
          ),
          label: Text(
            'EMAIL',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
              color: Color(0xff515c6f).withOpacity(0.502),
            ),
          ),
        ),
      ),
    );
  }
}
