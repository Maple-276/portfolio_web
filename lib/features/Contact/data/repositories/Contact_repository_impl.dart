import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../domain/models/contact_info_model.dart';
import '../../domain/repositories/contact_repository.dart';

class ContactRepositoryImpl implements ContactRepository {
  @override
  ContactInfoModel getContactInfo() {
    return const ContactInfoModel(
      email: 'portillot27@gmail.com',
      phone: '+57 333 430 8982',
      linkedinUrl:
          'https://www.linkedin.com/in/alexander-portillo-tejada-09936430b/',
      githubUrl: 'https://github.com/Maple-276',
      whatsappUrl: 'https://wa.me/573334308982',
      location: 'Colombia',
    );
  }

  @override
  Future<void> sendEmail(String name, String email, String message) async {
    // -----------------------------------------------------------------------
    // Keys provided by user
    // -----------------------------------------------------------------------
    const String serviceId = 'service_1gyr2dl';
    const String templateId = 'template_xdqjbxr';
    const String userId = '8Ke4mc9pwnqYseaPI'; // Public Key

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    try {
      final response = await http.post(
        url,
        headers: {
          'origin': 'http://localhost', // Required by EmailJS API
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'user_message': message,
          },
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to send email: ${response.body}');
      }
    } catch (e) {
      // Re-throw to handle in UI
      throw Exception('Failed to send email: $e');
    }
  }
}
