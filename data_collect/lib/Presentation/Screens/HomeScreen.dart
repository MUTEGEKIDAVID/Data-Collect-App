import 'dart:io';

import 'package:data_collect/Data/user.dart';
import 'package:data_collect/Data/user_sheets_api.dart';
import 'package:data_collect/Logic%20layer/Functional%20logic/cubit/plant_no_cubit.dart';
import 'package:data_collect/Logic%20layer/Functional%20logic/cubit/plot_no_cubit_cubit.dart';
import 'package:data_collect/Logic%20layer/Functional%20logic/cubit/range_no_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../Logic layer/Functional logic/Operations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Operations obj = Operations(plantNo: 0, plotNo: 0, rangeNo: 0);

  static int? RangeNO1;
  static int? plotNO1;
  static int? plantNO1;

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
          backgroundColor: Colors.green,
          title: Center(
              child: const Text(
            "Data collection App",
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.normal,

            ),
          )),
        ),
        body: Column(
          children: [
            Text(
              "Select Plot Number:",
              style: TextStyle(color: Colors.green[900]),
            ),
            MultiBlocListener(
              listeners: [
                BlocListener<PlantNoCubit, PlantNoState>(
                  listener: (context, state) {
                    if (state.plantNo == 10) {
                      BlocProvider.of<RangeNoCubit>(context).increment();
                      BlocProvider.of<PlantNoCubit>(context).reset();
                    }
                  },
                ),
                BlocListener<RangeNoCubit, RangeNoState>(
                  listener: (context, state) {
                    if (state.rangeNo == 11) {
                      BlocProvider.of<PlotNoCubitCubit>(context).increment();
                      BlocProvider.of<PlantNoCubit>(context).reset();
                      BlocProvider.of<RangeNoCubit>(context).reset();
                    }
                  },
                ),
                BlocListener<PlotNoCubitCubit, PlotNoCubitState>(
                  listener: (context, state) {
                    if (state.plotNo == 10) {
                      BlocProvider.of<PlantNoCubit>(context).reset();
                      BlocProvider.of<RangeNoCubit>(context).reset();
                    }
                  },
                ),
              ],
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        color: Colors.green[900],
                        iconSize: 30.0,
                        icon: Icon(Icons.remove_circle_outline_rounded),
                        onPressed: () {
                          setState(() {
                            BlocProvider.of<PlotNoCubitCubit>(context)
                                .decrement();
                          });
                        }),
                    SizedBox(
                      height: 30,
                      width: 200,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Colors.green, // Border color
                            width: 2, // Border width
                          ), // Set the border radius to 4
                        ),
                        child: Center(child:
                            BlocBuilder<PlotNoCubitCubit, PlotNoCubitState>(
                          builder: (context, state) {
                            plotNO1 = state.plotNo;
                            return Text(
                              '${state.plotNo}',
                              style: TextStyle(color: Colors.green[900]),
                            );
                          },
                        )),
                      ),
                    ),
                    IconButton(
                        color: Colors.green[900],
                        iconSize: 30.0,
                        icon: Icon(Icons.add_circle_outline_outlined),
                        onPressed: () {
                          setState(() {
                            BlocProvider.of<PlotNoCubitCubit>(context)
                                .increment();
                          });
                        }),
                  ]),
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              "Select Range Number:",
              style: TextStyle(color: Colors.green[900]),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              IconButton(
                  color: Colors.green[900],
                  iconSize: 30.0,
                  icon: Icon(Icons.remove_circle_outline_rounded),
                  onPressed: () {
                    setState(() {
                      BlocProvider.of<RangeNoCubit>(context).decrement();
                    });
                  }),
              SizedBox(
                height: 30,
                width: 200,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Colors.green, // Border color
                      width: 2, // Border width
                    ), // Set the border radius to 4
                  ),
                  child: Center(child: BlocBuilder<RangeNoCubit, RangeNoState>(
                    builder: (context, state) {
                      RangeNO1 = state.rangeNo;
                      return Text('${state.rangeNo}',
                          style: TextStyle(color: Colors.green[900]));
                    },
                  )),
                ),
              ),
              IconButton(
                color: Colors.green[900],
                iconSize: 30.0,
                icon: Icon(Icons.add_circle_outline_outlined),
                onPressed: () {
                  setState(() {
                    BlocProvider.of<RangeNoCubit>(context).increment();
                  });
                },
              ),
            ]),
            SizedBox(
              height: 4.0,
            ),
            Text(
              "Select Plant Number:",
              style: TextStyle(color: Colors.green[900]),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              IconButton(
                color: Colors.green[900],
                iconSize: 30.0,
                icon: Icon(Icons.remove_circle_outline_rounded),
                onPressed: () {
                  setState(() {
                    BlocProvider.of<PlantNoCubit>(context).decrement();
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
                      color: Colors.green, // Border color
                      width: 2, // Border width
                    ), // Set the border radius to 4
                  ),
                  child: Center(child: BlocBuilder<PlantNoCubit, PlantNoState>(
                    builder: (context, state) {
                      plantNO1 = state.plantNo;
                      return Text(
                        '${state.plantNo}',
                        style: TextStyle(color: Colors.green[900]),
                      );
                    },
                  )),
                ),
              ),
              IconButton(
                  color: Colors.green[900],
                  iconSize: 30.0,
                  icon: Icon(Icons.add_circle_outline_outlined),
                  onPressed: () {
                    setState(() {
                      BlocProvider.of<PlantNoCubit>(context).increment();
                    });
                  }),
            ]),
            SizedBox(height: 20),
            _imageFile != null
                ? Image.file(_imageFile!,
                    width: 160, height: 160, fit: BoxFit.cover)
                : SizedBox(
                    width: 200,
                    height: 60,
                    child: ColoredBox(
                      color: Colors.white,
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
                  color: Colors.green[900],
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
                onPressed: () async {
                  final user = {
                    UserFields.RangeNo: RangeNO1,
                    UserFields.PlotNo: plotNO1,
                    UserFields.PlantNo: plantNO1,
                    UserFields.image: '$_imageFile'
                  };
                  await UserSheetsApi.insert([user]);
                  const snackBar = SnackBar(
                    content: Center(child: Text('Data uploaded successfully')),
                    backgroundColor: Colors.green,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.green[900]),
                ),
              ),
            )
          ],
        ));
  }
}
