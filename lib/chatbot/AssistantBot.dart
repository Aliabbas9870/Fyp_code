import 'dart:io'; // To check platform

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart'; // For Emoji Picker
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fypapp/chatbot/assistent_logic.dart';
import 'package:fypapp/widgets/constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart'; // For timestamp

class AssistantBot extends StatefulWidget {
  final String message;
  const AssistantBot({required this.message});

  @override
  _AssistantBotState createState() => _AssistantBotState();
}

class _AssistantBotState extends State<AssistantBot> {
void _pickImage(ImageSource source) async {
  final pickedFile = await ImagePicker().pickImage(source: source);

  if (pickedFile != null) {
    setState(() {
      _messages.add({
        'message': 'Image selected',
        'isBot': false,
        'imagePath': pickedFile.path,
        'time': DateTime.now(),
      });
      _isLoading = true; // Start loading indicator for bot response
    });
    _scrollToBottom();

    await Future.delayed(const Duration(seconds: 2)); 

  
    setState(() {
      String response = _assistant.getResponse('image'); 
      _messages.add({
        'message': response,
        'isBot': true,
        'time': DateTime.now(),
      });
      _isLoading = false; 
    });

    _scrollToBottom();
  }
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
                  // mainAxisAlignment: MainAxisAlignment.center,
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
                  // mainAxisAlignment: MainAxisAlignment.center,s
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

  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController =
      ScrollController(); // Scroll Controller
  final List<Map<String, dynamic>> _messages = [];
  bool _isLoading = false;
  final Assistant _assistant = Assistant();
  bool _isEmojiPickerVisible =
      false; // Controls the visibility of the emoji picker

  final List<Map<String, dynamic>> _initialMessages = [
    {
      'message': 'Hello! How can I assist you?',
      'isBot': true,
      'time': DateTime.now()
    },
    {
      'message': 'What do you need help with?',
      'isBot': true,
      'time': DateTime.now()
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
    // Add initial messages when the chat opens
    _messages.addAll(_initialMessages);
  }

  void _scrollToBottom() {
    // Ensure the list scrolls to the bottom when a new message is added
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void _getResponse() async {
    String query = _controller.text.trim();

    if (query.isEmpty) return;

    // Add user message to the chat
    setState(() {
      _messages.add({
        'message': query,
        'isBot': false,
        'time': DateTime.now(),
        'status': 'sent',
      });
      _isLoading = true;
      _controller.clear(); // Clear the input field after sending the message
    });

    _scrollToBottom();

    await Future.delayed(const Duration(seconds: 2));

    // Get response from Assistant and stop loading
    setState(() {
      String response = _assistant.getResponse(query);
      _messages.add({
        'message': response,
        'isBot': true,
        'time': DateTime.now(), // Capture bot response time
      });
      _isLoading = false;
    });

    _scrollToBottom();
  }

  final Constant constant = Constant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(right: 11.0, left: 4),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: constant.primaryColor,
              ),
              SizedBox(width: 6),
              CircleAvatar(
                child: Icon(Icons.person),
              ),
              SizedBox(width: 10),
              SizedBox(width: 5),
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
          Icon(
            Icons.more_vert_sharp,
            size: 30,
            color: constant.primaryColor,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController, // Attach ScrollController
              padding: const EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isBot = message['isBot'] as bool;
                final timestamp = DateFormat('hh:mm a').format(message['time']);
                final status = message['status'] ?? '';
                return Align(
                  alignment:
                      isBot ? Alignment.centerLeft : Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: isBot
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      if (message.containsKey('imagePath'))
                        Align(
                          alignment: isBot
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.file(
                                File(message['imagePath']),
                                width: 150, 
                                height: 150, 
                                fit: BoxFit
                                    .cover, 
                              ),
                            ),
                          ),
                        )
                      else
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: isBot
                                ? constant.primaryColor
                                : constant.bgMessage,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message['message'],
                                style: TextStyle(
                                    fontSize: 16,
                                    color:
                                        isBot ? constant.whiteC : Colors.black),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    timestamp,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: isBot
                                            ? constant.whiteC
                                            : Colors.black),
                                  ),
                                  if (!isBot) const SizedBox(width: 8),
                                  if (!isBot)
                                    Icon(
                                      status == 'sent'
                                          ? Icons.check
                                          : Icons.done_all,
                                      size: 16,
                                      color: status == 'sent'
                                          ? Colors.grey
                                          : Colors.blue,
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          if (_isLoading)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF156778), // Background color 156778
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: SpinKitThreeBounce(
                      color: Colors.yellow, // Typing indicator in yellow
                      size: 24.0,
                    ),
                  ),
                ),
              ],
            ),
          if (_isEmojiPickerVisible)
            SizedBox(
              height: 250,
              child: EmojiPicker(
                onEmojiSelected: (category, emoji) {
                  setState(() {
                    _controller.text += emoji.emoji;
                    _controller.selection = TextSelection.fromPosition(
                      TextPosition(offset: _controller.text.length),
                    );
                    _isEmojiPickerVisible =
                        false; // Close emoji picker after selection
                  });
                },
                config: Config(
                  columns: 7,
                  emojiSizeMax: 32 * (Platform.isAndroid ? 1.30 : 1.0),
                  verticalSpacing: 0,
                  horizontalSpacing: 0,
                  gridPadding: EdgeInsets.zero,
                  bgColor: const Color(0xFFF2F2F2),
                  indicatorColor: Colors.blue,
                  iconColor: Colors.grey,
                  iconColorSelected: Colors.blue,
                  backspaceColor: Colors.blue,
                  enableSkinTones: true,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: _showImageSourceDialog,
                    child:
                        Image.asset("assets/images/uploadIcon.png", width: 38),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Type message here',
                      hintText: "Type a message",
                      fillColor: Colors.grey,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isEmojiPickerVisible = !_isEmojiPickerVisible;
                          });
                        },
                        child: Icon(
                          Icons.emoji_emotions, // Emoji icon
                          color: Colors.grey,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                      color: constant.primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: InkWell(
                    onTap: _getResponse,
                    child: Image.asset("assets/images/sendM.png"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
