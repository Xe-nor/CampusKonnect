import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:image_picker/image_picker.dart';
//
class GetImage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const GetImage({Key? key});

  @override
  State<GetImage> createState() => _GetImageState();
}

class _GetImageState extends State<GetImage> {
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Image'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey.shade300,
              ),
            ),
            child: _image == null
                ? const Center(child: Text('No image selected.'))
                : Image.file(
                    _image!,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton.extended(
                onPressed: () => _pickImage(ImageSource.camera),
                tooltip: 'Take a photo',
                icon: const Icon(Icons.camera_alt),
                label: const Text('Take a photo'),
              ),
              const SizedBox(width: 20),
              FloatingActionButton.extended(
                onPressed: () => _pickImage(ImageSource.gallery),
                tooltip: 'Pick an image from gallery',
                icon: const Icon(Icons.image),
                label: const Text('Pick an image'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
