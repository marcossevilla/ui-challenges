import 'package:flutter/material.dart';

import '../colors.dart';
import '../widgets/bank_card.dart';
import '../../shared/widgets/modern_drawer.dart';

class CardDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSolidPink,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0, right: 20.0),
            child: ModernDrawer(),
          )
        ],
      ),
      backgroundColor: kSolidPink,
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Expanded(child: Container(color: kSolidPink)),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          child: SizedBox(
            height: 250,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Hero(tag: 'card', child: BankCard()),
          ),
        ),
      ],
    );
  }
}
