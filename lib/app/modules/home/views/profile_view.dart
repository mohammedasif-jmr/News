import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends GetView {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'coming soon',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
