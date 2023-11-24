import 'dart:io';

class UserFields {
  static final String RangeNo = 'Range Number';
  static final String PlotNo = 'Plot Number';
  static final String PlantNo = 'Plant Number';
  static final String image = 'Image';

  static List<String> getFields() => [RangeNo, PlotNo, PlantNo,image];
}
