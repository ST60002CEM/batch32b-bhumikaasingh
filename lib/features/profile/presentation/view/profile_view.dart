import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blueAccent,
      ),
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
                    'assets/images/profile_picture.png'), // Replace with your profile image asset
              ),
              const SizedBox(height: 16),

              // User Name
              const Text(
                'Bhumika Singh',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Email
              const Text(
                'bhumi@example.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),

              // Divider
              Divider(color: Colors.grey[300]),

              // Info Section
              const SizedBox(height: 16),
              _buildInfoRow(Icons.phone, 'Phone', '+1 123 456 7890'),
              const SizedBox(height: 16),
              _buildInfoRow(Icons.location_on, 'Location', 'San Francisco, CA'),
              const SizedBox(height: 16),
              _buildInfoRow(Icons.calendar_today, 'Joined', 'January 2020'),
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
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),

              // Logout Button
              OutlinedButton(
                onPressed: () {
                  // Handle logout
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: BorderSide(color: Colors.redAccent),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(fontSize: 16, color: Colors.redAccent),
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
        Icon(icon, color: Colors.blueAccent),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
