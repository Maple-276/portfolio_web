import '../models/contact_info_model.dart';

abstract class ContactRepository {
  ContactInfoModel getContactInfo();
  Future<void> sendEmail(String name, String email, String message);
}
