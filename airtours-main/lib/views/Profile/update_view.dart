import 'package:AirTours/utilities/show_feedback.dart';
import 'package:flutter/material.dart';
import '../../services/cloud/firebase_cloud_storage.dart';
import '../../services_auth/auth_service.dart';

class UpdateView extends StatefulWidget {
  const UpdateView({super.key});

  @override
  State<UpdateView> createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  late final TextEditingController _email;
  final FirebaseCloudStorage c = FirebaseCloudStorage();

  @override
  void initState() {
    _email = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _email,
              decoration: const InputDecoration(
                labelText: 'New Email',
              ),
            ),
            const SizedBox(height: 16.0),
            TextButton(
                onPressed: () async {
                  //DB
                  final String currentUser =
                      AuthService.firebase().currentUser!.id;
                  c.updateUser(
                      ownerUserId: currentUser,
                      email: _email.text,
                      phoneNum: "0580647715"
                      //DB end
                      );
                  await showFeedback(context, 'Information Updated');
                },
                child: const Text('update!'))
          ],
        ),
      ),
    );
  }
}
