class Operations {
  int plotNo;
  int rangeNo;
  int plantNo;

  Operations(
      {required this.plotNo, required this.rangeNo, required this.plantNo});

  int incrementPlantNo() {
    
    if (plantNo == 9 && rangeNo !=10 ) {
      rangeNo += 1;
      plantNo = 0;
      return plantNo;
    }
     if (rangeNo == 10 && plantNo == 9) {
      plotNo += 1;
      plantNo = 0;
      rangeNo = 1;
      return plantNo;
    }
    return plantNo += 1;
  }

  int decrementPlantNo() {
    if (plantNo == 0) {
      return plantNo;
    }
    return plantNo -= 1;
  }

  int incrementPlotNo() {
   
    return plotNo += 1;
  }

  int decrementPlotNo() {
    if (plotNo == 0) {
      return plotNo;
    }
    return plotNo -= 1;
  }

  int incrementRangeNo() {
    return rangeNo += 1;
  }

  int decrementRangeNo() {
    if (rangeNo == 0) {
      return rangeNo;
    }
    return rangeNo -= 1;
  }
}
