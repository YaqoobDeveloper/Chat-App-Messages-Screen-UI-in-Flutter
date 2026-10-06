import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'screens/chat_screen.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat with friends',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const ChatScreen(),
    );
  }
}
