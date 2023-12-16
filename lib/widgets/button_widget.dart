import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String txt;
  final VoidCallback onTap;
  const ButtonWidget({super.key, required this.txt, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 330,
        height: 46,
        decoration: BoxDecoration(
            color: Color(0xffff6969),
            borderRadius: BorderRadius.circular(23),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(4, 255, 105, 105),
                offset: Offset(0, 10),
                blurRadius: 5,
                spreadRadius: 2,
              )
            ]),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  txt,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    color: Color(0xffffffff),
                  ),
                ),
                Container(
                  width: 29,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Color(0xffffffff),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 15,
                    color: Color(
                      0xffff6969,
                    ),
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
