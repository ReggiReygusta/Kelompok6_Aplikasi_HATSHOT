import 'package:aplikasi_topi/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_topi/screens/theme.dart';
import 'package:aplikasi_topi/models/menu.dart';
import 'package:intl/intl.dart';

class MenuCard extends StatelessWidget {
  final Menu menu;
  const MenuCard(this.menu, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(
                      menu.id,
                      menu.image,
                      menu.name,
                      menu.price,
                      menu.pricePromo,
                      menu.note,
                      menu.isPromo,
                    )));
      },
      // ignore: avoid_unnecessary_containers

      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                // ignore: sized_box_for_whitespace
                child: Container(
                  width: 130,
                  height: 110,
                  child: Image.network(
                    menu.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  menu.isPromo
                      ? Image.asset(
                          'assets/Promo.png',
                          width: 47,
                          height: 16,
                        )
                      : Image.asset(
                          'assets/Terlaris.png',
                          width: 47,
                          height: 16,
                        ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    menu.name,
                    style: poppinsTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'Rp ',
                          decimalDigits: 0,
                        ).format(
                          menu.price,
                        ),
                        style: poppinsTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: greyColor,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'Rp ',
                          decimalDigits: 0,
                        ).format(
                          menu.pricePromo,
                        ),
                        style: poppinsTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: yellowColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Free Ongkir',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: greyColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
