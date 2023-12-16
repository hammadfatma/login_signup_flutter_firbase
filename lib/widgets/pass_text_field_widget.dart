import 'package:flutter/material.dart';

class PassFieldWidget extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final VoidCallback onTap;
  final TextEditingController controller;
  final IconData con;
  final bool obstxt;
  const PassFieldWidget(
      {super.key, required this.isFirst, required this.isLast, required this.controller, required this.onTap, required this.con, required this.obstxt});

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
            return 'password is required';
          }
          if (value.length < 8) {
            return 'Password length must be 8';
          }
          return null;
        },
        keyboardType: TextInputType.visiblePassword,
        obscureText: obstxt,
        controller: controller,
        cursorColor: Color(0xffff6969),
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: InkWell(
            onTap: onTap,
            child: Icon(
              con,
              size: 20,
              color: Color(
                0xff727c8e,
              ),
            ),
          ),
          label: Text(
            'PASSWORD',
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
