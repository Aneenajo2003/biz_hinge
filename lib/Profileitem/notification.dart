import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsPage extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    // {
    //   'category': 'Messages',
    //   'notifications': [
    //     {
    //       'title': 'New Message from Support',
    //       'description': 'We\'ve received your request and will get back to you shortly.',
    //       'time': '5 mins ago',
    //       'icon': Icons.message,
    //     },
    //   ]
    // },
    //
    // {
    //   'category': 'Updates',
    //   'notifications': [
    //     {
    //       'title': 'App Update Available',
    //       'description': 'A new update is available for the app. Download now for the latest features.',
    //       'time': 'Yesterday',
    //       'icon': Icons.system_update,
    //     },
    //     {
    //       'title': 'System Maintenance Scheduled',
    //       'description': 'Maintenance scheduled for this Saturday. App may be temporarily unavailable.',
    //       'time': '2 days ago',
    //       'icon': Icons.build,
    //     },
  //
  //     ]
  //   },
  // ];
  {
  'category': 'Orders',
  'notifications': [
  {
  'title': 'Order Shipped!',
  'description': 'Your order #12345 has been shipped and is on its way.',
  'time': 'Just now',
  'icon': Icons.local_shipping,
  'color': Color(0xff4CAF50),
  },
  {
  'title': 'Order Delivered',
  'description': 'Your order #12344 has been delivered successfully.',
  'time': 'Yesterday',
  'icon': Icons.check_circle,
  'color': Color(0xff4CAF50),
  },
  ]
},

{
'category': 'Promotions',
'notifications': [
{
'title': '20% Off on Heart Medications!',
'description': 'Exclusive offer for you! Use code HEART20 at checkout.',
'time': 'Today',
'icon': Icons.local_offer,
'color': Color(0xffE91E63),
},
{
'title': 'Buy One Get One Free on Vitamins',
'description': 'Limited time offer on selected vitamins and supplements.',
'time': '2 days ago',
'icon': Icons.star,
'color': Color(0xff673AB7),
},
]
},];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff6EBC31),
        elevation: 2,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final category = notifications[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  category['category'],
                  style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87),
                ),
              ),
              ...category['notifications'].map<Widget>((notification) {
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xff6EBC31).withOpacity(0.9),
                          child: Icon(notification['icon'], color: Colors.white),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notification['title']!,
                                style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 4),
                              Text(
                                notification['description']!,
                                style: GoogleFonts.poppins(fontSize: 15, color: Colors.black54),
                              ),
                              SizedBox(height: 8),
                              Text(
                                notification['time']!,
                                style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          );
        },
      ),
    );
  }
}
