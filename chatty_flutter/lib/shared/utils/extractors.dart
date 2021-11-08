import 'package:chatty/shared/utils/helpers.dart';
import 'package:reactive_forms/reactive_forms.dart';

// ignore: avoid_classes_with_only_static_members
abstract class Extractors {
  static String getRegisterData({required FormGroup formGroup}) {
    return fieldValue<String>(formGroup: formGroup, controlName: 'phone')!;
  }

  static Map<String, dynamic> getCompleteProfileData({required FormGroup formGroup}) {
    return <String, dynamic>{
      'name': fieldValue<String>(formGroup: formGroup, controlName: 'name')!,
      'photo': fieldValue<String>(formGroup: formGroup, controlName: 'photo'),
    };
  }
}
