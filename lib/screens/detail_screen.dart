import 'package:aplikasi_topi/models/size.dart';
import 'package:aplikasi_topi/screens/theme.dart';
import 'package:aplikasi_topi/widgets/size_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  int id;
  String image;
  String name;
  int price;
  int pricepromo;
  String note;
  bool isPromo;
  DetailScreen(this.id, this.image, this.name, this.price, this.pricepromo,
      this.note, this.isPromo,
      {Key? key})
      : super(key: key);

  @override
  State<DetailScreen> createState() =>
      // ignore: no_logic_in_create_state
      _DetailScreen(id, image, name, price, pricepromo, note, isPromo);
}

class _DetailScreen extends State<DetailScreen> {
  // ignore: unused_field
  final int _id;
  final String _image;
  final String _name;
  final int _price;
  final int _pricePromo;
  final String _note;
  final bool _isPromo;

  _DetailScreen(this._id, this._image, this._name, this._price,
      this._pricePromo, this._note, this._isPromo);

  launchUrl(String url) async {
    launchUrl(url);
  }

  int i = 1;

  late int dataPrice = _price;
  late int dataPricePromo = _pricePromo;

  int price = 75000;
  int pricePromo = 50000;

  bool isM = true; // harga tetap

  // ignore: non_constant_identifier_names
  void _Minus() {
    if (i > 1) {
      setState(() {
        i--;
        if (isM == true) {
          price = dataPrice * i;
          pricePromo = dataPricePromo * i;
        }
      });
    }
  }

  // ignore: non_constant_identifier_names
  void _Plus() {
    setState(() {
      i++;
      if (isM == true) {
        price = dataPrice * i;
        pricePromo = dataPricePromo * i;
      }
    });
  }

  // ignore: non_constant_identifier_names
  void _M() {
    setState(() {
      price = dataPrice * i;
      pricePromo = dataPricePromo * i;
      isM = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      launch(url);
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              _image,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                const SizedBox(height: 264),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _isPromo
                                ? Image.asset(
                                    'assets/Promo.png',
                                    width: 60,
                                  )
                                : Image.asset(
                                    'assets/Terlaris.png',
                                    width: 60,
                                  ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  _name,
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: blackColor,
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: _Minus,
                                  child: Image.asset(
                                    'assets/Minus.png',
                                    width: 34,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  // ignore: unnecessary_brace_in_string_interps
                                  '${i}',
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: blackColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                InkWell(
                                  onTap: _Plus,
                                  child: Image.asset(
                                    'assets/Plus.png',
                                    width: 34,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp ',
                                          decimalDigits: 0)
                                      .format(price),
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
                                          decimalDigits: 0)
                                      .format(pricePromo),
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: yellowColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Text(
                              'Ukuran',
                              style: poppinsTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                InkWell(
                                  onTap: _M,
                                  child: SizeCard(
                                    Size(
                                      id: 1,
                                      name: 'M',
                                      isActive: isM,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Text(
                              'Deskripsi',
                              style: poppinsTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            // ignore: sized_box_for_whitespace
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                _note,
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: greyColor,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Text(
                              'Toko',
                              style: poppinsTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(
                                    "https://goo.gl/maps/kLhqkHNog5DBbBrb8");
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/store.png',
                                    width: 50,
                                  ),
                                  const SizedBox(width: 18),
                                  Text(
                                    'Jl. Raya Margaendah\nJawa Barat',
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: greyColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.chevron_right,
                                      color: greyColor,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 18),
                            // ignore: sized_box_for_whitespace
                            Container(
                              width: MediaQuery.of(context).size.width,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                  bottom: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                elevation: 0,
                                focusElevation: 0,
                                hoverElevation: 0,
                                highlightElevation: 0,
                                disabledElevation: 0,
                                onPressed: () {
                                  launchUrl(
                                      'https://wa.me/62895708726662?text=Saya%20tertarik%20dengan%20topi%20yang%20anda%20jual');
                                },
                                color: yellowColor,
                                child: Text(
                                  'Buy',
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
