import '../models/contact_info_model.dart';

abstract class ContactRepository {
  ContactInfoModel getContactInfo();
}
