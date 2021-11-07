import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

void setWebPageTitle(String title) {
  SystemChrome.setApplicationSwitcherDescription(
    ApplicationSwitcherDescription(label: title),
  );
}

T? fieldValue<T>({required FormGroup formGroup, String? controlName, Object? enumEntry}) {
  try {
    return controlName != null
        ? formGroup.controls[controlName]!.value as T
        : formGroup.controls[describeEnum(enumEntry!)]!.value as T;
  } catch (_) {
    return null;
  }
}
