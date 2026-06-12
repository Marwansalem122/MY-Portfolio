import 'dart:convert';

import 'package:http/http.dart' as http;

class Services {
  static void sendEmail(
      String name, String email, String subject, String message) async {
    try {
      Uri endPoint = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
      var response = await http.post(endPoint,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'service_id': 'service_vnhbndh',
            "template_id": "template_wtiaf6g",
            "user_id": "ImREtayaf1Wga4ai5",
            "template_params": {
              "user_name": name,
              "user_email": email,
              "user_subject": subject,
              "user_message": message,
            }
          }));
      if (response.statusCode == 200) {
        print('Email sent successfully');
      }
    } catch (e) {
      print('Error sending email: $e');
    }
  }
}
