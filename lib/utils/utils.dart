// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:blackcoffer/screens/post_video_screen.dart';
import 'package:blackcoffer/screens/profile_screen.dart';
import 'package:blackcoffer/screens/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Pages:
List pages = [
  const VideoScreen(),
  const PostVideoScreen(),
  const ProfileScreen(),
];

// snackbar
showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

Future<File?> pickImage(BuildContext context) async {
  File? image;
  try {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  } catch (e) {
    showSnackBar(context, e.toString());
  }
  return image;
}

// colors
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

const black = Colors.black;
const white = Colors.white;
const red = Colors.red;
const green = Colors.green;
const gray01 = Colors.grey;
const gray02 = Color(0xffededed);
const colorPrimary = Colors.black;
// const colorPrimary = Color(0xff183764);

