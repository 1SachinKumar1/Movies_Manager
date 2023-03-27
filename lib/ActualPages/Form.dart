import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Formes extends StatefulWidget {
  const Formes({Key? key}) : super(key: key);

  @override
  State<Formes> createState() => _FormesState();
}

class _FormesState extends State<Formes> {
 var _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      // Save the image file and update your UI
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blueGrey.shade100,),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children:[
                        Container(
                          width: 380,
                          height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Colors.black
                              )),
                          child: _imageFile != null
                              ? Image.file(_imageFile, fit: BoxFit.cover)
                              : null,
                      ),
                        Positioned(
                          top: 19,
                          left: 120,
                          child: FloatingActionButton(onPressed: _pickImage,
                            child: const Icon(Icons.add_a_photo),
                          ),
                        )]),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.pink,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          labelText: "Name")),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.pink,
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        labelText: "Director"),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepPurpleAccent)
                        // MaterialStateProperty
                        ),
                    onPressed: () {},
                    child: const Text("Done"),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
