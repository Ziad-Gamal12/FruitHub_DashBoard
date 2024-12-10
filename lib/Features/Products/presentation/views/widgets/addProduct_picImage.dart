// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class addProduct_picImage extends StatefulWidget {
  const addProduct_picImage({
    super.key,
    required this.imageFile,
  });
  final ValueChanged<File?> imageFile;

  @override
  State<addProduct_picImage> createState() => _addProduct_picImageState();
}

class _addProduct_picImageState extends State<addProduct_picImage> {
  File? imagefile;
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isloading,
      child: InkWell(
          onTap: () async {
            await picPRoductImage(context);
          },
          child: Container(
            height: MediaQuery.of(context).size.height * .25,
            width: double.infinity,
            decoration: BoxDecoration(
              border: imagefile == null
                  ? Border.all(color: Colors.black, width: 1)
                  : null,
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: imagefile == null
                ? const Icon(Icons.image_outlined,
                    size: 150, color: Colors.black)
                : Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.file(
                          imagefile!,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent.withOpacity(.5),
                          child: IconButton(
                              onPressed: () {
                                imagefile = null;
                                setState(() {});
                                widget.imageFile(imagefile);
                              },
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              )),
                        ),
                      ),
                    ],
                  ),
          )),
    );
  }

  Future<void> picPRoductImage(BuildContext context) async {
    isloading = true;
    setState(() {});
    if (imagefile == null) {
      final ImagePicker picker = ImagePicker();
      // Pick an image.
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        imagefile = File(image.path);
        widget.imageFile(imagefile!);
        isloading = false;
        setState(() {});
      } else {
        isloading = false;
        setState(() {});
        widget.imageFile(imagefile);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('No image selected'),
        ));
      }
    }
  }
}
