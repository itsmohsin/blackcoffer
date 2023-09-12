import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/auth_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.purple,
            backgroundImage: NetworkImage(ap.userModel.profilePicture),
            radius: 100,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Name : ", style: TextStyle(fontSize: 17)),
              Text(ap.userModel.name, style: const TextStyle(fontSize: 17)),
            ],
          ),
          const Divider(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Email : ", style: TextStyle(fontSize: 17)),
              Text(ap.userModel.email, style: const TextStyle(fontSize: 17)),
            ],
          ),
          const Divider(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Phone No : ", style: TextStyle(fontSize: 17)),
              Text(ap.userModel.phoneNumber,
                  style: const TextStyle(fontSize: 17)),
            ],
          ),
          const Divider(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Bio : ", style: TextStyle(fontSize: 17)),
              Text(ap.userModel.bio, style: const TextStyle(fontSize: 17)),
            ],
          ),
        ],
      )),
    );
  }
}
