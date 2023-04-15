import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GetImage extends StatefulWidget {
  const GetImage({Key? key});

  @override
  State<GetImage> createState() => _GetImageState();
}

class _GetImageState extends State<GetImage> {
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().getImage(source: source);
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
      body: Center(
        child: _image == null
            ? const Text('No image selected.')
            : Image.file(_image!),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
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
    );
  }
}