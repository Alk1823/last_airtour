
import 'package:AirTours/constants/pages_route.dart';
import 'package:AirTours/views/Profile/balance_credit_card.dart';
import 'package:flutter/material.dart';
import '../../services/cloud/firebase_cloud_storage.dart';


class AddBalance extends StatefulWidget {
  const AddBalance({super.key});



  @override
  State<AddBalance> createState() => _AddBalanceState();
}

class _AddBalanceState extends State<AddBalance> {
  late final TextEditingController _amount;
  final FirebaseCloudStorage c = FirebaseCloudStorage();

  @override
  void initState() {
    _amount = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('adding balance'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _amount,
              decoration: const InputDecoration(
                labelText: 'amount required',
              ),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
              final balance = _amount.text;
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => ChargeBalance(balance: balance),
                  ));
              } ,
                child: const Text('add the amount'))
          ],
        ),
      ),
    );
  }
}