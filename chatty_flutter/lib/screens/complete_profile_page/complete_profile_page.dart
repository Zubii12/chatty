import 'package:chatty/shared/providers/providers.dart';
import 'package:chatty/shared/state/index.dart';
import 'package:chatty/shared/theme/theme.dart';
import 'package:chatty/shared/utils/extractors.dart';
import 'package:chatty/shared/utils/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CompleteProfilePage extends HookWidget {
  const CompleteProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormGroup completeProfileFormGroup = useMemoized(
      () => ChattyFormGroups.completeProfileFormGroup,
    );

    final UserStore userStore = useProvider(userStorePOD);

    return Scaffold(
      body: SafeArea(
        child: ReactiveForm(
          formGroup: completeProfileFormGroup,
          child: Padding(
            padding: const EdgeInsets.only(top: 88.0, left: 44.0, right: 48.0, bottom: 24.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          // todo add photo
                        },
                        child: Container(
                          height: 112.0,
                          width: 112.0,
                          decoration: const BoxDecoration(
                            color: Palette.darkBlack,
                            shape: BoxShape.circle,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: const <Widget>[
                              Icon(
                                Icons.person_outline_outlined,
                                size: 60.0,
                                color: Palette.offWhite,
                              ),
                              Positioned.fill(
                                top: 48.0,
                                left: 48.0,
                                child: Icon(Icons.add_circle_sharp, color: Palette.offWhite),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      ReactiveTextField<String>(
                        formControlName: 'name',
                        decoration: InputDecoration(
                          hintText: 'Name',
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
                        validationMessages: (_) => <String, String>{
                          ValidationMessage.required: 'Name is required.',
                        },
                      )
                    ],
                  ),
                ),
                ReactiveFormConsumer(
                  builder: (_, FormGroup formGroup, __) {
                    return Container(
                      height: 48,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Text(
                          'Continue',
                        ),
                        onPressed: formGroup.valid
                            ? () {
                                final Map<String, dynamic> completeProfileData =
                                    Extractors.getCompleteProfileData(
                                  formGroup: completeProfileFormGroup,
                                );

                                final String name = completeProfileData['name'];
                                final String? photo = completeProfileData['photo'];

                                userStore.updateUserData(name: name, photo: photo);
                              }
                            : null,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
