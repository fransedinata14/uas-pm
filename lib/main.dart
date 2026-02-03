import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat UI Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFFFF0F5),
      ),
      home: const ChatListScreen(),
    );
  }
}

// --- DATA MODEL ---
class ChatData {
  final String name;
  final String message;
  final String date;
  final String imagePath;

  ChatData({
    required this.name,
    required this.message,
    required this.date,
    required this.imagePath,
  });
}

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChatData> chatList = [
      ChatData(
        name: "Frans Edinata Sembiring",
        message: "243303611309",
        date: "Januari",
        imagePath: "images/frans.png",
      ),
      ChatData(
        name: "Bibik Cantek ku",
        message: "Dimana Nak ku",
        date: "Februari",
        imagePath: "images/pajak.png",
      ),
      ChatData(
        name: "Mama Tua",
        message: "Kerumah Sini Nakku",
        date: "Maret",
        imagePath: "images/supir.png",
      ),
      ChatData(
        name: "Tukang Kusuk",
        message: "Banyak Pasien Bang",
        date: "April",
        imagePath: "images/kusuk.png",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Aplikasi Chat",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            itemCount: chatList.length,
            
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            
            itemBuilder: (context, index) {
              return ChatCard(data: chatList[index]);
            },
          ),
        ),
      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  final ChatData data;

  const ChatCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailScreen(name: data.name),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.lightBlue[100],
          border: Border.all(color: Colors.redAccent, width: 2),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
            topRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(data.imagePath),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.check, size: 16, color: Colors.black54),
                      const SizedBox(width: 4),
                      Text(
                        data.message,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              data.date,
              style: TextStyle(
                color: Colors.blue[600],
                fontStyle: FontStyle.italic,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}