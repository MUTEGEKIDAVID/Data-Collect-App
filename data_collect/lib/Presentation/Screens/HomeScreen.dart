import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../Logic layer/Functional logic/Operations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Operations obj = Operations(plantNo: 0, plotNo: 0, rangeNo: 0);

   File? _imageFile;
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
              child: const Text(
            "Data collection App",
            style: TextStyle(
              fontSize: 12,
            ),
          )),
        ),
        body: Column(
          children: [
            Text(
              "Select Plot Number:",
              style: TextStyle(color: Colors.blue),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              IconButton(
                  color: Colors.blue,
                  iconSize: 30.0,
                  icon: Icon(Icons.remove_circle_outline_rounded),
                  onPressed: () {
                    setState(() {
                      obj.decrementPlotNo();
                    });
                  }),
              SizedBox(
                height: 30,
                width: 200,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Colors.blue, // Border color
                      width: 2, // Border width
                    ), // Set the border radius to 4
                  ),
                  child: Center(
                      child: Text(
                    obj.plotNo.toString(),
                    style: TextStyle(color: Colors.blue),
                  )),
                ),
              ),
              IconButton(
                  color: Colors.blue,
                  iconSize: 30.0,
                  icon: Icon(Icons.add_circle_outline_outlined),
                  onPressed: () {
                    setState(() {
                      obj.incrementPlotNo();
                    });
                  }),
            ]),
            SizedBox(
              height: 4.0,
            ),
            Text(
              "Select Range Number:",
              style: TextStyle(color: Colors.blue),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              IconButton(
                  color: Colors.blue,
                  iconSize: 30.0,
                  icon: Icon(Icons.remove_circle_outline_rounded),
                  onPressed: () {
                    setState(() {
                      obj.decrementRangeNo();
                    });
                  }),
              SizedBox(
                height: 30,
                width: 200,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Colors.blue, // Border color
                      width: 2, // Border width
                    ), // Set the border radius to 4
                  ),
                  child: Center(
                      child: Text(obj.rangeNo.toString(),
                          style: TextStyle(color: Colors.blue))),
                ),
              ),
              IconButton(
                color: Colors.blue,
                iconSize: 30.0,
                icon: Icon(Icons.add_circle_outline_outlined),
                onPressed: () {
                  setState(() {
                    obj.incrementRangeNo();
                  });
                },
              ),
            ]),
            SizedBox(
              height: 4.0,
            ),
            Text(
              "Select Plant Number:",
              style: TextStyle(color: Colors.blue),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              IconButton(
                color: Colors.blue,
                iconSize: 30.0,
                icon: Icon(Icons.remove_circle_outline_rounded),
                onPressed: () {
                  setState(() {
                    obj.decrementPlantNo();
                  });
                },
              ),
              SizedBox(
                height: 30,
                width: 200,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Colors.blue, // Border color
                      width: 2, // Border width
                    ), // Set the border radius to 4
                  ),
                  child: Center(
                      child: Text(
                    obj.plantNo.toString(),
                    style: TextStyle(color: Colors.blue),
                  )),
                ),
              ),
              IconButton(
                  color: Colors.blue,
                  iconSize: 30.0,
                  icon: Icon(Icons.add_circle_outline_outlined),
                  onPressed: () {
                    setState(() {
                      obj.incrementPlantNo();
                    });
                  }),
            ]),
            SizedBox(height: 20),

            _imageFile!=null ? Image.file(_imageFile!, width:160, height:160, fit: BoxFit.cover): 
            SizedBox(
              width:200,
              height:60,
              child: ColoredBox(color: Colors.white,
              child: Center(child: Text("take plant image")),
              
              ),
            ),
             SizedBox(
              height: 20,
            ),
            SizedBox(
              // height:60,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Adjust the radius as needed
                  ),
                ),
                onPressed: _pickImage,
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Adjust the radius as needed
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            )
          ],
        ));
  }
}
