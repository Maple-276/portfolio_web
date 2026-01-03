import '../../domain/models/contact_info_model.dart';
import '../../domain/repositories/contact_repository.dart';

class ContactRepositoryImpl implements ContactRepository {
  @override
  ContactInfoModel getContactInfo() {
    return const ContactInfoModel(
      email: 'alexander@example.com',
      phone: '+1 (555) 123-4567',
      linkedinUrl: 'https://linkedin.com/in/alexander-p',
      githubUrl: 'https://github.com/alexander-p',
      location: 'New York, USA (Remote Available)',
    );
  }
}
