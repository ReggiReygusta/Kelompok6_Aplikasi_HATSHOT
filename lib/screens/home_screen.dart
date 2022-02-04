import 'package:aplikasi_topi/models/menu.dart';
import 'package:aplikasi_topi/screens/theme.dart';
import 'package:aplikasi_topi/widgets/card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference products = firestore.collection('products');
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'HATSHOT',
                style: poppinsTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
              Text(
                'Produk Topi Original',
                style: poppinsTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: greyColor,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Hot Produk',
                style: poppinsTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: blackColor,
                ),
              ),
              const SizedBox(height: 22),
              StreamBuilder<QuerySnapshot>(
                  stream: products.orderBy('id', descending: false).snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        // ignore: unnecessary_cast
                        children: (snapshot.data! as QuerySnapshot)
                            .docs
                            .map(
                              (e) => MenuCard(
                                Menu(
                                  id: e['id'],
                                  image: e['image'],
                                  name: e['name'],
                                  price: e['price'],
                                  pricePromo: e['pricePromo'],
                                  note: e['note'],
                                  isPromo: e['isPromo'],
                                ),
                              ),
                            )
                            .toList(),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
