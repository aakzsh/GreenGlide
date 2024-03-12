import 'package:http/http.dart' as http;

addToGoogleWallet(email)async{
var url = Uri.parse('https://google-wallet-backend.onrender.com/addtowallet');
var response = await http.post(url, body: {'email': email});
// print('Response status: ${response.statusCode}');
// print('Response body: ${response.body}');
return response.body;
}
