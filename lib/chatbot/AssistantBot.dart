import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fypapp/controller/themeController.dart';
import 'package:fypapp/widgets/constant.dart';
import 'package:get/get.dart';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart'; // For timestamp
class AssistantBot extends StatefulWidget {

  final String message;
  const AssistantBot({required this.message});

  @override
  _AssistantBotState createState() => _AssistantBotState();
}

class _AssistantBotState extends State<AssistantBot> {
  final ThemeController themeController = Get.put(ThemeController());
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _messages = [];
  bool _isLoading = false;
  final Constant constant = Constant();


  final List<Map<String, dynamic>> _initialMessages = [
    {
      'message': 'Hello! How can I assist you?',
      'isBot': true,
      'time': DateTime.now(),
    },
    {
      'message': 'What do you need help with?',
      'isBot': true,
      'time': DateTime.now(),
    },
    {
      'message': 'Ask me anything about salons, services, or bookings.',
      'isBot': true,
      'time': DateTime.now(),
    },
  ];
  @override
  void initState() {
    super.initState();
    _messages.addAll(_initialMessages);
  }
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _messages.add({
          'message': 'Image selected',
          'isBot': false,
          'imagePath': pickedFile.path,
          'time': DateTime.now(),
        });
        _isLoading = true;
      });
      _scrollToBottom();

      // Call image processing function
      await _processImage(File(pickedFile.path));
    }
  }

  Future<void> _processImage(File imageFile) async {
    final GoogleVisionImage visionImage = GoogleVisionImage.fromFile(imageFile);
    final FaceDetector faceDetector = GoogleVision.instance.faceDetector();
    final List<Face> faces = await faceDetector.processImage(visionImage);

    String response = 'Could not detect any faces in the image.';

    if (faces.isNotEmpty) {
      // Detecting face features like face type
      Face face = faces.first;
      response = _analyzeFace(face);

      // Add suggestions based on the detected face
      // response += '\nSuggested haircuts and beauty tips based on your face type!';
    }

    setState(() {
      _messages.add({
        'message': response,
        'isBot': true,
        'time': DateTime.now(),
      });
      _isLoading = false;
    });

    _scrollToBottom();
  }




String _analyzeFace(Face face) {
  String faceShape = 'oval'; 

  // Determine face shape logic
  if (face.boundingBox.width / face.boundingBox.height > 1.1) {
    faceShape = 'round';
  } else if (face.boundingBox.width / face.boundingBox.height < 0.9) {
    faceShape = 'oblong';
  }

  // Example of gender detection placeholder (requires further implementation)
  String gender = _detectGender(face); // Assume a method that returns 'male' or 'female'

  // Include smile or eye status if needed
  String additionalInfo = '';
  if (face.smilingProbability != null) {
    additionalInfo += 'Smile detected: ${(face.smilingProbability! * 100).toStringAsFixed(1)}%.\n';
  }
  if (face.leftEyeOpenProbability != null && face.rightEyeOpenProbability != null) {
    additionalInfo += 'Left eye open: ${(face.leftEyeOpenProbability! * 100).toStringAsFixed(1)}%.\n';
    additionalInfo += 'Right eye open: ${(face.rightEyeOpenProbability! * 100).toStringAsFixed(1)}%.\n';
  }

  // Provide beauty tips based on face type and gender
  String tips = _getBeautyTips(faceShape, gender);

  return 'Your face type appears to be $faceShape.\n$additionalInfo$tips';
}

// Placeholder for gender detection (implement detection based on input)
String _detectGender(Face face) {
  // Assume this method determines gender based on context or user input.
  // Replace with actual implementation as needed.
  return 'female'; // Replace with dynamic input or logic
}

// Beauty tips based on face type and gender
String _getBeautyTips(String faceShape, String gender) {
  String tips = '\nBeauty tips for $faceShape face:\n';

  if (gender == 'female') {
    switch (faceShape) {
      case 'round':
        tips += '- Hairstyles: Long layers, high ponytails, side-swept bangs.\n';
        tips += '- Beauty tips: Emphasize vertical length with contouring.\n';
        break;
      case 'oval':
        tips += '- Hairstyles: Almost any style works; try beach waves or bobs.\n';
        tips += '- Beauty tips: Highlight cheekbones for a balanced look.\n';
        break;
      case 'oblong':
        tips += '- Hairstyles: Soft curls, layered cuts to add width.\n';
        tips += '- Beauty tips: Use blush to create width on the cheeks.\n';
        break;
      // Add more cases if needed
      default:
        tips += '- No specific recommendations.\n';
        break;
    }
  } else if (gender == 'male') {
    switch (faceShape) {
      case 'round':
        tips += '- Hairstyles: Short sides, high fades, pompadours.\n';
        tips += '- Grooming tips: Keep the sides trimmed to elongate the face.\n';
        break;
      case 'oval':
        tips += '- Hairstyles: Quiffs, undercuts, fades.\n';
        tips += '- Grooming tips: Minimal beard to highlight facial symmetry.\n';
        break;
      case 'oblong':
        tips += '- Hairstyles: Side parts, low fade with medium length.\n';
        tips += '- Grooming tips: Maintain a beard to add volume to the lower face.\n';
        break;
      // Add more cases if needed
      default:
        tips += '- No specific recommendations.\n';
        break;
    }
  }

  return tips;
}
  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Image Source"),
          actions: [
            Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.camera),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _pickImage(ImageSource.camera);
                      },
                      child: Text("Camera"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.photo_library),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _pickImage(ImageSource.gallery);
                      },
                      child: Text("Gallery"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> _getResponse() async {
    String query = _controller.text.trim();
    if (query.isEmpty) return;

    setState(() {
      _messages.add({
        'message': query,
        'isBot': false,
        'time': DateTime.now(),
      });
      _isLoading = true;
      _controller.clear();
    });
    _scrollToBottom();

    try {
      final gemini = Gemini.instance;

      // Fetch response using the Gemini API
      final value = await gemini.text(query);
      String response = value?.output ?? 'Sorry, I could not process your request.';

      // Update state with the response message
      setState(() {
        _messages.add({
          'message': response,
          'isBot': true,
          'time': DateTime.now(),
        });
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _messages.add({
          'message': 'Error fetching response: ${e.toString()}',
          'isBot': true,
          'time': DateTime.now(),
        });
        _isLoading = false;
      });
    }

    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(right: 11.0, left: 4),
          child: Row(
            children: [
              Icon(Icons.arrow_back_ios, color: constant.primaryColor),
              SizedBox(width: 6),
              CircleAvatar(child: Icon(Icons.person)),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Assistant',
                    style: TextStyle(
                        color: constant.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Online',
                    style: TextStyle(
                        color: constant.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
        elevation: 5,
       actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert_sharp, size: 30, color: Colors.blue),
            onSelected: (value) {
              if (value == 'Change Theme') {
                themeController.toggleTheme(); // Call GetX method to change theme
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'Change Theme',
                child: Text('Change Theme'),
              ),
            ],
      ),]),
      body: Column(
        children: [
          Expanded(
            child:
            ListView.builder(
  controller: _scrollController,
  padding: const EdgeInsets.all(8.0),
  itemCount: _messages.length,
  itemBuilder: (context, index) {
    final message = _messages[index];
    final isBot = message['isBot'] as bool;
    final timestamp = DateFormat('hh:mm a').format(message['time']);

    return GestureDetector(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Delete Message"),
            content: Text("Are you sure you want to delete this message?"),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _messages.removeAt(index);
                  });
                  Navigator.pop(context);
                },
                child: Text("Delete"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
            ],
          ),
        );
      },
      child: Align(
        alignment: isBot ? Alignment.centerLeft : Alignment.centerRight,
        child: Column(
          crossAxisAlignment: isBot ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            if (message.containsKey('imagePath'))
              Align(
                alignment: isBot ? Alignment.centerLeft : Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      File(message['imagePath']),
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            else
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: isBot ? Color.fromARGB(255, 231, 229, 229) : constant.primaryColor,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message['message'] ?? '',
                      style: TextStyle(color: isBot ? Colors.black : Colors.white),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      timestamp,
                      style: TextStyle(
                        fontSize: 12,
                        color: isBot ? Color.fromARGB(255, 99, 96, 96) : Color.fromARGB(255, 203, 199, 199),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  },
),

        
        
        
          ),
          if (_isLoading)
            SpinKitThreeBounce(color: constant.primaryColor, size: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: _showImageSourceDialog,
                  icon: Icon(Icons.image, color: constant.primaryColor),
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (_) => _getResponse(),
                    decoration: InputDecoration(
                      hintText: "Ask your question",
                      hintStyle: TextStyle(
                        color: constant.primaryColor,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: constant.primaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: constant.primaryColor),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _getResponse,
                  icon: Icon(Icons.send, color: constant.primaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// import 'dart:io'; // To check platform

// import 'package:flutter/material.dart';
// import 'package:flutter_gemini/flutter_gemini.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:fypapp/widgets/constant.dart';
// import 'package:google_ml_vision/google_ml_vision.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart'; // For timestamp

// class AssistantBot extends StatefulWidget {
//   final String message;
//   const AssistantBot({required this.message});

//   @override
//   _AssistantBotState createState() => _AssistantBotState();
// }

// class _AssistantBotState extends State<AssistantBot> {
//   final TextEditingController _controller = TextEditingController();
//   final ScrollController _scrollController = ScrollController();
//   final List<Map<String, dynamic>> _messages = [];
//   bool _isLoading = false;
//   final Constant constant = Constant();

//   final List<Map<String, dynamic>> _initialMessages = [
//     {
//       'message': 'Hello! How can I assist you?',
//       'isBot': true,
//       'time': DateTime.now(),
//     },
//     {
//       'message': 'What do you need help with?',
//       'isBot': true,
//       'time': DateTime.now(),
//     },
//     {
//       'message': 'Ask me anything about salons, services, or bookings.',
//       'isBot': true,
//       'time': DateTime.now(),
//     },
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _messages.addAll(_initialMessages);
//   }

//   void _scrollToBottom() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _scrollController.animateTo(
//         _scrollController.position.maxScrollExtent,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeOut,
//       );
//     });
//   }

//   void _pickImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);
//     if (pickedFile != null) {
//       setState(() {
//         _messages.add({
//           'message': 'Image selected',
//           'isBot': false,
//           'imagePath': pickedFile.path,
//           'time': DateTime.now(),
//         });
//         _isLoading = true;
//       });
//       _scrollToBottom();

//       // Call image processing function
//       await _processImage(File(pickedFile.path));
//     }
//   }

//   Future<void> _processImage(File imageFile) async {
//     final GoogleVisionImage visionImage = GoogleVisionImage.fromFile(imageFile);
//     final FaceDetector faceDetector = GoogleVision.instance.faceDetector();
//     final List<Face> faces = await faceDetector.processImage(visionImage);

//     String response = 'Could not detect any faces in the image.';

//     if (faces.isNotEmpty) {
//       // Detecting face features like face type
//       Face face = faces.first;
//       response = _analyzeFace(face);

//       // Add suggestions based on the detected face
//       response += '\nSuggested haircuts and beauty tips based on your face type!';
//     }

//     setState(() {
//       _messages.add({
//         'message': response,
//         'isBot': true,
//         'time': DateTime.now(),
//       });
//       _isLoading = false;
//     });
//     _scrollToBottom();
//   }

//   String _analyzeFace(Face face) {
//     String faceShape = 'oval'; // Placeholder for actual face analysis logic

//     // Implement simple face analysis based on the face's bounding box or landmarks
//     if (face.boundingBox.width / face.boundingBox.height > 1.1) {
//       faceShape = 'round';
//     } else if (face.boundingBox.width / face.boundingBox.height < 0.9) {
//       faceShape = 'oblong';
//     }

//     return 'Your face type appears to be $faceShape.';
//   }

// // String _analyzeFace(Face face) {
// //   String faceShape = 'unknown'; // Default to unknown

// //   // Implement face analysis based on the bounding box or landmarks
// //   double width = face.boundingBox.width;
// //   double height = face.boundingBox.height;
// //   double aspectRatio = width / height;

// //   // Determine face shape based on aspect ratio and additional criteria
// //   if (aspectRatio > 1.1) {
// //     // If width is significantly greater than height
// //     if (height < width * 0.9) {
// //       faceShape = 'rectangular'; // Oblong or rectangular
// //     } else {
// //       faceShape = 'round'; // Round
// //     }
// //   } else if (aspectRatio < 0.9) {
// //     // If height is significantly greater than width
// //     faceShape = 'oval'; // Oval
// //   } else {
// //     // Aspect ratio is close to 1, further criteria can be used to differentiate
// //     double foreheadWidth = /* calculate forehead width using landmarks */;
// //     double jawWidth = /* calculate jaw width using landmarks */;
// //     double cheekboneWidth = /* calculate cheekbone width using landmarks */;

// //     if (jawWidth > cheekboneWidth) {
// //       faceShape = 'square'; // Square shape has a strong jawline
// //     } else if (cheekboneWidth > jawWidth) {
// //       faceShape = 'diamond'; // Diamond shape has wider cheekbones
// //     } else if (foreheadWidth > jawWidth && foreheadWidth > cheekboneWidth) {
// //       faceShape = 'heart'; // Heart shape has a wider forehead and narrow chin
// //     } else {
// //       faceShape = 'oval'; // Default case if no specific conditions are met
// //     }
// //   }

// //   return 'Your face type appears to be $faceShape.';
// // }



//   void _showImageSourceDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Select Image Source"),
//           actions: [
//             Column(
//               children: [
//                 Row(
//                   children: [
//                     Icon(Icons.camera),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                         _pickImage(ImageSource.camera);
//                       },
//                       child: Text("Camera"),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Icon(Icons.photo_library),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                         _pickImage(ImageSource.gallery);
//                       },
//                       child: Text("Gallery"),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> _getResponse() async {
//     String query = _controller.text.trim();
//     if (query.isEmpty) return;

//     setState(() {
//       _messages.add({
//         'message': query,
//         'isBot': false,
//         'time': DateTime.now(),
//         'status': 'sent',
//       });
//       _isLoading = true;
//       _controller.clear();
//     });
//     _scrollToBottom();

//     try {
//       final gemini = Gemini.instance;

//       // Fetch response using the Gemini API
//       final value = await gemini.text(query);
//       String response = value?.output ?? 'Sorry, I could not process your request.';

//       // Update state with the response message
//       setState(() {
//         _messages.add({
//           'message': response,
//           'isBot': true,
//           'time': DateTime.now(),
//         });
//         _isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         _messages.add({
//           'message': 'Error fetching response: ${e.toString()}',
//           'isBot': true,
//           'time': DateTime.now(),
//         });
//         _isLoading = false;
//       });
//     }

//     _scrollToBottom();
//   }




//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Padding(
//           padding: const EdgeInsets.only(right: 11.0, left: 4),
//           child: Row(
//             children: [
//               Icon(Icons.arrow_back_ios, color: constant.primaryColor),
//               SizedBox(width: 6),
//               CircleAvatar(child: Icon(Icons.person)),
//               SizedBox(width: 10),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Personal Assistant',
//                     style: TextStyle(
//                         color: constant.primaryColor,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     'Online',
//                     style: TextStyle(
//                         color: constant.primaryColor,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         elevation: 5,
//         actions: [
//           Icon(Icons.more_vert_sharp, size: 30, color: constant.primaryColor),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               controller: _scrollController,
//               padding: const EdgeInsets.all(8.0),
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 final message = _messages[index];
//                 final isBot = message['isBot'] as bool;
//                 final timestamp = DateFormat('hh:mm a').format(message['time']);
//                 return Align(
//                   alignment:
//                       isBot ? Alignment.centerLeft : Alignment.centerRight,
//                   child: Column(
//                     crossAxisAlignment: isBot
//                         ? CrossAxisAlignment.start
//                         : CrossAxisAlignment.end,
//                     children: [
//                       if (message.containsKey('imagePath'))
//                         Align(
//                           alignment: isBot
//                               ? Alignment.centerLeft
//                               : Alignment.centerRight,
//                           child: Container(
//                             margin: const EdgeInsets.symmetric(
//                                 vertical: 10.0, horizontal: 10),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(12),
//                               child: Image.file(
//                                 File(message['imagePath']),
//                                 width: 150,
//                                 height: 150,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         )
//                       else
//                         Container(
//                           margin: const EdgeInsets.symmetric(
//                               vertical: 10.0, horizontal: 10),
//                           padding: const EdgeInsets.all(12.0),
//                           decoration: BoxDecoration(
//                             color: isBot
//                                 ? Color.fromARGB(255, 231, 229, 229)
//                                 : constant.primaryColor,
//                             borderRadius: BorderRadius.circular(15.0),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 message['message'] ?? '',
//                                 style: TextStyle(
//                                     color: isBot ? Colors.black : Colors.white),
//                               ),
//                               const SizedBox(height: 5),
//                               Text(
//                                 timestamp,
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: isBot
//                                       ? Color.fromARGB(255, 99, 96, 96)
//                                       : Color.fromARGB(255, 203, 199, 199),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       const SizedBox(height: 5),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//           if (_isLoading)
//             SpinKitThreeBounce(color: constant.primaryColor, size: 20.0),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
//             child: Row(
//               children: [
//                 IconButton(
//                   onPressed: _showImageSourceDialog,
//                   icon: Icon(Icons.add, color: constant.primaryColor),
//                 ),
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(25.0)),
//                       hintText: 'Type a message',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: _getResponse,
//                   icon: Icon(Icons.send, color: constant.primaryColor),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
