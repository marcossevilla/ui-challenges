import 'package:flutter/material.dart';

class Transaction {
  final String date;
  final String title;
  final double amount;
  final IconData icon;

  const Transaction({this.title, this.date, this.amount, this.icon});
}
