import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AUTOFORE'),
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Action for menu button
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Type your question here',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Action for send button
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Hello, Agatha!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "We're ready to serve you with enthusiasm and a genuine desire to make your day great.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Offers of the Day!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                      'assets/corolla.jpg'), 
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Popular Topics',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildPopularTopicItem(
                      'Where is the auto repair shop in Uganda?',
                      Icons.location_on,
                      'https://example.com/auto-repair'),
                  _buildPopularTopicItem(
                      'Mercedes ML or Toyota Land cruiser?',
                      Icons.directions_car,
                      'https://example.com/mercedes-vs-toyota'),
                  _buildPopularTopicItem('Best car bonds in Uganda and why?',
                      Icons.attach_money, 'https://example.com/car-bonds'),
                  _buildPopularTopicItem(
                      'Where is the auto repair shop',
                      Icons.location_on,
                      'https://example.com/auto-repair-shop'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_support),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _buildPopularTopicItem(String title, IconData icon, String urlString) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(icon, color: Colors.white),
        backgroundColor: Colors.red,
      ),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        _launchURL(urlString);
      },
    );
  }

  void _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $urlString';
    }
  }
}
