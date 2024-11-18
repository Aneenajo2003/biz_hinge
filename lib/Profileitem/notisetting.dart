import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/app_colors.dart'; // Import Google Fonts

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce Notification Settings',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotificationSettingsScreen(),
    );
  }
}

class NotificationSettingsScreen extends StatefulWidget {
  @override
  _NotificationSettingsScreenState createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool isMuted = false;
  bool orderConfirmationAllowed = false;
  bool shippingUpdatesAllowed = false;
  bool deliveryNotificationsAllowed = false;
  bool salesDiscountsAllowed = false;
  bool newArrivalsAllowed = false;
  bool recommendationsAllowed = false;
  bool securityAlertsAllowed = false;
  bool feedbackRequestsAllowed = false;
  String? selectedRingtone; // Store selected ringtone name

  // List of predefined constant ringtones
  final List<String> ringtones = [
    'Default Ringtone',
    'Classic Melody',
    'Chime Sound',
    'Buzzer Alert',
    'Ding Notification'
  ];

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  // Load settings from shared_preferences
  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isMuted = prefs.getBool('isMuted') ?? false;
      orderConfirmationAllowed =
          prefs.getBool('orderConfirmationAllowed') ?? false;
      shippingUpdatesAllowed = prefs.getBool('shippingUpdatesAllowed') ?? false;
      deliveryNotificationsAllowed =
          prefs.getBool('deliveryNotificationsAllowed') ?? false;
      salesDiscountsAllowed = prefs.getBool('salesDiscountsAllowed') ?? false;
      newArrivalsAllowed = prefs.getBool('newArrivalsAllowed') ?? false;
      recommendationsAllowed = prefs.getBool('recommendationsAllowed') ?? false;
      securityAlertsAllowed = prefs.getBool('securityAlertsAllowed') ?? false;
      feedbackRequestsAllowed =
          prefs.getBool('feedbackRequestsAllowed') ?? false;
      selectedRingtone =
          prefs.getString('selectedRingtone') ?? 'Default Ringtone';
    });
  }

  // Save settings to shared_preferences
  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isMuted', isMuted);
    await prefs.setBool('orderConfirmationAllowed', orderConfirmationAllowed);
    await prefs.setBool('shippingUpdatesAllowed', shippingUpdatesAllowed);
    await prefs.setBool(
        'deliveryNotificationsAllowed', deliveryNotificationsAllowed);
    await prefs.setBool('salesDiscountsAllowed', salesDiscountsAllowed);
    await prefs.setBool('newArrivalsAllowed', newArrivalsAllowed);
    await prefs.setBool('recommendationsAllowed', recommendationsAllowed);
    await prefs.setBool('securityAlertsAllowed', securityAlertsAllowed);
    await prefs.setBool('feedbackRequestsAllowed', feedbackRequestsAllowed);
    await prefs.setString(
        'selectedRingtone', selectedRingtone ?? 'Default Ringtone');
  }

  // Automatically save the settings when a switch changes
  void _onToggleChanged(bool value, String settingKey) {
    setState(() {
      switch (settingKey) {
        case 'isMuted':
          isMuted = value;
          if (isMuted) {
            // Stop playing the ringtone if muted
            FlutterRingtonePlayer().stop();
          }
          break;
        case 'orderConfirmationAllowed':
          orderConfirmationAllowed = value;
          break;
        case 'shippingUpdatesAllowed':
          shippingUpdatesAllowed = value;
          break;
        case 'deliveryNotificationsAllowed':
          deliveryNotificationsAllowed = value;
          break;
        case 'salesDiscountsAllowed':
          salesDiscountsAllowed = value;
          break;
        case 'newArrivalsAllowed':
          newArrivalsAllowed = value;
          break;
        case 'recommendationsAllowed':
          recommendationsAllowed = value;
          break;
        case 'securityAlertsAllowed':
          securityAlertsAllowed = value;
          break;
        case 'feedbackRequestsAllowed':
          feedbackRequestsAllowed = value;
          break;
      }
    });
    _saveSettings(); // Save automatically after each change
  }

  // Show ringtone picker dialog
  void _showRingtonePicker() async {
    if (isMuted) return; // Don't show picker if muted

    final selected = await showDialog<String>(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text('Select a Ringtone', style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: maintheme1)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: ringtones.map((ringtone) {
                return ListTile(
                  title: Text(ringtone, style: GoogleFonts.poppins(fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
                  onTap: () {
                    Navigator.pop(context, ringtone);
                  },
                );
              }).toList(),
            ),
          ),
    );

    if (selected != null) {
      setState(() {
        selectedRingtone = selected;
      });
      // Stop any currently playing ringtone
      FlutterRingtonePlayer().stop();

      // Play the selected ringtone sound immediately
      FlutterRingtonePlayer().playRingtone();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Notification Settings', style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600, color: Colors.black)),
      ),
      body: ListView(
        children: [
          _buildMuteToggle(),
          _buildSectionHeader('Order Notifications'),
          _buildToggle(
            'Order Confirmation',
            orderConfirmationAllowed,
                (val) {
              _onToggleChanged(val, 'orderConfirmationAllowed');
            },
          ),
          _buildToggle(
            'Shipping Updates',
            shippingUpdatesAllowed,
                (val) {
              _onToggleChanged(val, 'shippingUpdatesAllowed');
            },
          ),
          _buildToggle(
            'Delivery Notifications',
            deliveryNotificationsAllowed,
                (val) {
              _onToggleChanged(val, 'deliveryNotificationsAllowed');
            },
          ),
          Divider(),
          _buildSectionHeader('Promotions'),
          _buildToggle(
            'Sales & Discounts',
            salesDiscountsAllowed,
                (val) {
              _onToggleChanged(val, 'salesDiscountsAllowed');
            },
          ),
          _buildToggle(
            'New Arrivals',
            newArrivalsAllowed,
                (val) {
              _onToggleChanged(val, 'newArrivalsAllowed');
            },
          ),
          Divider(),
          _buildSectionHeader('Personalized Recommendations'),
          _buildToggle(
            'Recommendations',
            recommendationsAllowed,
                (val) {
              _onToggleChanged(val, 'recommendationsAllowed');
            },
          ),
          Divider(),
          _buildSectionHeader('Account Alerts'),
          _buildToggle(
            'Security Alerts',
            securityAlertsAllowed,
                (val) {
              _onToggleChanged(val, 'securityAlertsAllowed');
            },
          ),
          Divider(),
          _buildSectionHeader('Feedback Requests'),
          _buildToggle(
            'Request for Feedback',
            feedbackRequestsAllowed,
                (val) {
              _onToggleChanged(val, 'feedbackRequestsAllowed');
            },
          ),
          SizedBox(height: 20),
          _buildRingtoneSettings(),
        ],
      ),
    );
  }

  Widget _buildMuteToggle() {
    return SwitchListTile(
      title: Text(
        'Mute Notifications',
        style: GoogleFonts.poppins(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
      ),
      value: isMuted,

      activeColor: Darktheme1,
      // Green color for active (on) state
      inactiveTrackColor: Colors.transparent,
      onChanged: (val) {
        _onToggleChanged(val, 'isMuted');
      },
      secondary: Icon(isMuted ? Icons.notifications_off : Icons.notifications,
          color: Darktheme1),
    );
  }

  Widget _buildRingtoneSettings() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        title: Text(
          'Set Ringtone',
          style: GoogleFonts.poppins(fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        subtitle: Text(
          selectedRingtone != null
              ? "Selected ringtone: $selectedRingtone"
              : "No ringtone selected",
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        onTap: _showRingtonePicker,
        trailing: Icon(Icons.music_note,color: Darktheme1,),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black,
          ),
        ));
  }

  Widget _buildToggle(String title,
      bool currentValue,
      Function(bool) onChanged,) {
    return SwitchListTile(
      title: Text(
        title,
        style: GoogleFonts.poppins(fontSize: 16,
            fontWeight: FontWeight.w500,
            color: !isMuted ? Colors.black : Colors.grey),
      ),
      value: currentValue,
      onChanged: !isMuted ? onChanged : null,
      activeColor: Darktheme1,
      // Green color for active (on) state
      inactiveTrackColor: Colors.transparent,
      // Grey color for inactive (off) state
      secondary: Icon(
        Icons.notifications,
        color: !isMuted ?Darktheme1: Colors.grey,
      ),
    );
  }
}
