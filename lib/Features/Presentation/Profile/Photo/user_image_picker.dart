import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:happy_shop/Core/Design/constant.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File pickedimage) imagepickfn;

  UserImagePicker(this.imagepickfn);

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  final picker = ImagePicker();
  File? _image;

  _showMaterialDialog() {
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: const Text("Oops..!"),
        content: const Text("Please select image !"),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok!'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  void _imagepick() async {
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(
      () {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          _showMaterialDialog();
        }
      },
    );
    widget.imagepickfn(_image!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 16,
            bottom: 5,
            top: 20,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Aperçu de l'image",
              style: headline6,
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, top: 10),
              child: Column(
                children: [
                  (_image != null)
                      ? Image(
                          width: 400,
                          height: 300,
                          image: FileImage(
                            _image!,
                          ),
                          fit: BoxFit.cover,
                        )
                      : Image(
                          width: 400,
                          height: 300,
                          image: AssetImage("assets/images/placeholder.png"),
                          fit: BoxFit.cover,
                        )
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 16,
            bottom: 5,
            top: 20,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Ajouter/Modifier l'image",
              style: headline6,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey[400]!)),
                width: 185,
                height: 40,
                child: Center(
                  child: _image == null
                      ? Text('aucune fichier selectionner!')
                      : Text("Image sélectionnée"),
                ),
              ),
              TextButton(
                onPressed: _imagepick,
                child: Container(
                  height: 40,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Telecharger une photo',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
