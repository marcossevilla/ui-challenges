import 'package:flutter/material.dart';

import 'package:mdi/mdi.dart';
import 'package:flutter_svg/svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../colors.dart';
import '../widgets/bank_card.dart';
import '../models/transaction.dart';
import '../../shared/widgets/modern_drawer.dart';

const transactions = [
  const Transaction(
    title: 'Netflix Subscription',
    date: '11/11/2020 20:35',
    amount: 10.00,
    icon: Mdi.netflix,
  ),
  const Transaction(
    title: 'Dribbble Pro Account',
    date: '11/11/2020 20:35',
    amount: 15.00,
    icon: FontAwesomeIcons.dribbble,
  ),
  const Transaction(
    title: 'Uber',
    date: '11/11/2020 20:35',
    amount: 22.00,
    icon: FontAwesomeIcons.uber,
  ),
  const Transaction(
    title: 'Grocery Shopping',
    date: '11/11/2020 20:35',
    amount: 10.00,
    icon: Mdi.cart,
  ),
];

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
            _TransactionsCard(),
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

class _TransactionsCard extends StatelessWidget {
  const _TransactionsCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: const EdgeInsets.only(top: 110.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: _SpendingsBanner(),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: _Transactions(),
          ),
        ],
      ),
    );
  }
}

class _Transactions extends StatelessWidget {
  const _Transactions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'Transactions',
              style: TextStyle(color: kNeonAqua, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10.0),
          ListView.builder(
            shrinkWrap: true,
            itemCount: transactions.length,
            itemBuilder: (context, i) => SlideInRight(child: _Tile(index: i)),
          )
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({Key key, this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50.0,
        height: 50.0,
        child: Icon(transactions[index].icon, color: kPinkyPurple),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      title: Text(
        transactions[index].title,
        style: TextStyle(color: kPinkyPurple, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        transactions[index].date,
        style: TextStyle(color: kNeonAqua, fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        '\$${transactions[index].amount}',
        style: TextStyle(color: kSolidPink, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _SpendingsBanner extends StatelessWidget {
  const _SpendingsBanner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.caption.copyWith(
          color: kNeonAqua,
          fontWeight: FontWeight.bold,
        );

    return Container(
      height: 110,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 10.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Spendings', style: style),
              SizedBox(height: 5.0),
              Text(
                '\$995.45',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: kPinkyPurple, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              Text('10% Below Monthly Average', style: style),
            ],
          ),
          SizedBox(width: 10.0),
          Expanded(child: SvgPicture.asset('assets/banking_app/wallet.svg')),
        ],
      ),
    );
  }
}
