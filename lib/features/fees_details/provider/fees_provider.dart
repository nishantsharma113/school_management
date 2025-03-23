import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/fees_details/model/fees_model.dart';

class FeesProvider extends ChangeNotifier {
  List<FeeModel> feesList = [];
  String selectedFeeType = "School Fee";

  // Sample data for fees
  List<dynamic> feesData = [
    {
      "month": "January",
      "totalFee": 14500.0,
      "extraFee": 2000.0,
      "lateCharges": 600.0,
      "discount": 500.0,
      "isPaid": true,
      "paymentDate": "06 May"
    },
    {
      "month": "December",
      "totalFee": 14500.0,
      "extraFee": 0.0,
      "lateCharges": 0.0,
      "discount": 0.0,
      "isPaid": true,
      "paymentDate": "06 May"
    },
    {
      "month": "November",
      "totalFee": 16500.0,
      "extraFee": 0.0,
      "lateCharges": 0.0,
      "discount": 0.0,
      "isPaid": true,
      "paymentDate": "06 May"
    },
    {
      "month": "October",
      "totalFee": 14500.0,
      "extraFee": 0.0,
      "lateCharges": 0.0,
      "discount": 0.0,
      "isPaid": true,
      "paymentDate": "06 May"
    },
    {
      "month": "September",
      "totalFee": 14500.0,
      "extraFee": 0.0,
      "lateCharges": 0.0,
      "discount": 0.0,
      "isPaid": true,
      "paymentDate": "06 May"
    }
  ];

  void getData() {
    feesList = feesData.map((e) => FeeModel.fromJson(e)).toList();
    notifyListeners();
  }

  void toggleExpanded(int index) {
    if (index >= 0 && index < feesList.length) {
      feesList[index].isExpanded = !feesList[index].isExpanded;
      notifyListeners();
    }
  }

  void changeSelectedFeeType(String type) {
    selectedFeeType = type;
    notifyListeners();
  }
} 