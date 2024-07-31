import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';


class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AutoFore'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildChatBubble(context, 'You\'re welcome! See you.', true),
                  _buildChatBubble(context, 'Hi', false),
                  _buildChatBubble(context,
                      'What\'s the best way to sell my product?', false),
                  _buildChatBubble(
                      context,
                      'The best way to sell a product is to first identify your target customer and then create a compelling message that resonates with them. You should also consider utilizing digital marketing channels such as email, social media, and search engine optimization to reach your target audience.',
                      true),
                  _buildChatBubble(context, 'Thank you!', false),
                ],
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Type here',
                suffixIcon: Icon(Icons.send),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildChatBubble(BuildContext context, String text, bool isSentByMe) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: isSentByMe
              ? Colors.grey[200]
              : Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(text,
            style: TextStyle(color: isSentByMe ? Colors.black : Colors.white)),
      ),
    );
  }
}
