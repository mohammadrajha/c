// import 'package:flutter/material.dart';

// class MorePage extends StatelessWidget {
//   static const String routename = 'MorePage';
//   const MorePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  static const String routename = 'MorePage';
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        actions: [Icon(Icons.search, color: Colors.black)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'path_to_your_image'), // استبدل برابط الصورة الخاصة بك
            ),
            SizedBox(height: 10),
            Text('Ahmad Mohammad',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('0 Points', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 20),
            buildMenuItem(Icons.dashboard, 'My points'),
            buildMenuItem(Icons.notifications, 'Notifications'),
            buildMenuItem(Icons.language, 'Change language'),
            buildMenuItem(Icons.lock, 'Change password'),
            buildMenuItem(Icons.mail, 'Contact us'),
            buildMenuItem(Icons.list, 'Terms & conditions'),
            buildMenuItem(Icons.privacy_tip, 'Privacy & Policy'),
            buildMenuItem(Icons.logout, 'Logout'),
          ],
        ),
      ),
    );
  }

  ListTile buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 14),
    );
  }
}
