import 'dart:convert';
import 'package:http/http.dart' as http;

List<Map<String, dynamic>> firebaseDataList = [];

void getdata() async{
  final url = Uri.https('dhan-manthan-default-rtdb.firebaseio.com','PersonalData.json');
final response = await  http.get(url);
if (response.statusCode == 200) {
    // Parse the JSON response, assuming it's a Map<String, dynamic>
    final Map<String, dynamic> data = json.decode(response.body);
    
    // Use the data as needed
     data.forEach((key, value) {
      firebaseDataList.add({key: value});
    });
   
  } else {
    throw Exception('Failed to load data from Firebase');
  }
}
