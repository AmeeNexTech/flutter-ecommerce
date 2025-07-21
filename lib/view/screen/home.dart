import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: const Center(child: Text('Welcome to the Home Screen!')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.info,
            animType: AnimType.scale,
            title: 'Hello',
            desc: 'This is a optional logout & delete account dialog.',
            btnOkText: 'Logout',
            btnCancelText: 'Delete Account',
            btnOkOnPress: () {},
            btnCancelOnPress: () {},
          ).show();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
