import 'package:covid/connection.dart';
import 'package:covid/constants.dart';

class Data {
  var data;
  Future<void> updateData() async {
    NetworkHelper networkHelper = NetworkHelper(kAPI);
    data = await networkHelper.getData();
    // print(data['statewise'][0]['active']);
  }
}