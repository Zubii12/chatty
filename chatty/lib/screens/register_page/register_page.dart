import 'package:chatty/shared/providers/providers.dart';
import 'package:chatty/shared/state/index.dart';
import 'package:chatty/shared/theme/theme.dart';
import 'package:chatty/shared/utils/extractors.dart';
import 'package:chatty/shared/utils/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegisterPage extends HookWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormGroup registerFormGroup = useMemoized(() => ChattyFormGroups.registerFormGroup);
    final AuthStore authStore = useProvider(authStorePOD);

    return Scaffold(
      body: SafeArea(
        child: ReactiveForm(
          formGroup: registerFormGroup,
          child: Padding(
            padding: const EdgeInsets.only(top: 88.0, left: 44.0, right: 48.0, bottom: 24.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      const Text(
                        'Enter Your Phone Number',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      const Text(
                        'Please confirm your country code and enter your phone number',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      ReactiveTextField<String>(
                        formControlName: 'phone',
                        decoration: InputDecoration(
                          hintText: 'Phone number',
                          hintStyle: const TextStyle(color: Palette.offWhite),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Palette.offWhite),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Palette.offWhite),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validationMessages: (_) => <String, String>{
                          ValidationMessage.required: 'Phone number is required.',
                          ValidationMessage.number: 'Phone number is required.',
                        },
                      ),
                    ],
                  ),
                ),
                ReactiveFormConsumer(builder: (_, FormGroup formGroup, __) {
                  return Container(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text(
                        'Continue',
                      ),
                      onPressed: () {
                        final String phone = Extractors.getRegisterData(
                          formGroup: registerFormGroup,
                        );

                        authStore.login(phone: phone);
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
