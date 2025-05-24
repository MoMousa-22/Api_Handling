import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 130,
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        backgroundImage: const AssetImage("assets/images/avatar.png"),
        child: Stack(
          children: [
            Positioned(
              bottom: 5,
              right: 5,
              child: GestureDetector(
                onTap: () async {
                  File? image = await pickImageFromGallery();
                  if (image != null) {
                    // هنا ممكن تتعامل مع الصورة
                    print('تم اختيار الصورة: ${image.path}');
                  }
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    border: Border.all(color: Colors.white, width: 3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(
                    Icons.camera_alt_sharp,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<File?> pickImageFromGallery() async {
  final ImagePicker picker = ImagePicker();
  final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    return File(pickedFile.path);
  } else {
    print('No image selected.');
    return null;
  }
}
