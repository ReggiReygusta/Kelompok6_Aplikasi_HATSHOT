import 'package:aplikasi_topi/screens/theme.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_topi/models/size.dart';

class SizeCard extends StatelessWidget {
  // const SizeCard({ Key? key }) : super(key: key);

  final Size size;
  const SizeCard(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: size.isActive
          ? Container(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: whitegreyColor,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: whitegreyColor,
                  width: 1.5,
                ),
              ),
              child: Text(
                size.name,
                style: poppinsTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: blackColor,
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: whitegreyColor,
                  width: 1.5,
                ),
              ),
              child: Text(
                size.name,
                style: poppinsTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: blackColor,
                ),
              ),
            ),
    );
  }
}
