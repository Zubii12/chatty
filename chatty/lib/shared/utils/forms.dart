import 'package:reactive_forms/reactive_forms.dart';

// ignore: avoid_classes_with_only_static_members
abstract class ChattyFormGroups {
  static final FormGroup registerFormGroup = FormGroup(
    <String, FormControl<String>>{
      'phone': FormControl<String>(validators: <ValidatorFunction>[
        Validators.required,
        Validators.number,
      ]),
    },
  );
}
