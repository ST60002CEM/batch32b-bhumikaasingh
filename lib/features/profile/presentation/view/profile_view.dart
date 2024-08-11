import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Profile'),
      //   backgroundColor: Colors.green,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/images/Profile.jpeg'), // Replace with your profile image asset
              ),
              const SizedBox(height: 10),
              const Text(
                'Bhumika Singh',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 1),
              const Text(
                'bhumi@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),

              // Divider
              Divider(color: Colors.black),

              // Info Section
              const SizedBox(height: 14),
              _buildInfoRow(Icons.phone, 'Phone', '+977-9835445327'),
              const SizedBox(height: 16),
              _buildInfoRow(Icons.location_on, 'Location', 'Kathmandu'),
              const SizedBox(height: 16),
              _buildInfoRow(Icons.reviews, 'My Reviews', 'January 2020'),
              const SizedBox(height: 16),
              _buildInfoRow(Icons.dark_mode, 'Dark Mode', 'System'),
              const SizedBox(height: 32),

              // Edit Profile Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to edit profile page
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.blueAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 4),

              // Logout Button
              OutlinedButton(
                onPressed: () {
                  // Handle logout
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: BorderSide(color: Colors.black),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 36, vertical: 9),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.black),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
