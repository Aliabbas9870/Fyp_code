// // Replace with your Gemini secret key
// import 'dart:convert';

// import 'package:http/http.dart' as http;

// class GeminiService {
//   final String baseUrl = "https://api.gemini.com"; // Gemini API base URL
//   final String apiKey =
//       "AIzaSyDf3GSMQjwCJuRNItySQM7DZ8Igk3F_vcs"; // Replace with your Gemini API key
//   final String secretKey =
//       "AIzaSyDf3GSMQjwCJuRNItySQM7DZ8Igk3F_vcs"; // Replace with your Gemini secret key

//   // Fetch data from a specific endpoint, e.g., getting market data
//   Future<Map<String, dynamic>> fetchMarketData(String symbol) async {
//     final url = Uri.parse('$baseUrl/v1/pubticker/$symbol'); // Example endpoint
//     final headers = {
//       'Content-Type': 'application/json',
//       'X-GEMINI-APIKEY': apiKey,
//     };

//     try {
//       final response = await http.get(url, headers: headers);
//       if (response.statusCode == 200) {
//         return json.decode(response.body);
//       } else {
//         throw Exception('Failed to load market data');
//       }
//     } catch (e) {
//       print('Error fetching market data: $e');
//       return {};
//     }
//   }

//   // Add a getResponse method to handle image responses if required
//   String getResponse(String input) {
//     // Example response; customize this logic as needed.
//     if (input == 'image') {
//       return 'Processing the image...'; // Dummy response
//     }
//     return 'Default response'; // Fallback response
//   }
// }




// Future<Map<String, dynamic>> fetchBTCData() async {
//   const url = 'https://api.gemini.com/v1/pubticker/btcusd';
//   final response = await http.get(Uri.parse(url));

//   if (response.statusCode == 200) {
//     return json.decode(response.body);
//   } else {
//     throw Exception('Failed to fetch BTC data');
//   }
// }
