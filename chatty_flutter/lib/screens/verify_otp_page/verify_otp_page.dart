import 'package:chatty/models/index.dart';
import 'package:chatty/shared/providers/providers.dart';
import 'package:chatty/shared/state/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobx/mobx.dart';

const int _kSmsCodeLength = 4;

class VerifyOTPPage extends HookWidget {
  const VerifyOTPPage({Key? key, required this.phone}) : super(key: key);

  final String phone;

  @override
  Widget build(BuildContext context) {
    final AuthStore authStore = useProvider(authStorePOD);
    final ValueNotifier<String> _code = useState<String>('');
    String? requestId;

    when((_) => authStore.sendOTPState is Fulfilled<String>, () {
      requestId = (authStore.sendOTPState as Fulfilled<String>).data;
    });

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const Text(
                'Enter code',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24.0),
              Text(
                'We have sent you an SMS with the code to $phone',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(height: 40.0),
              Container(
                constraints: const BoxConstraints.expand(height: 100.0),
                child: Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.0,
                      child: TextField(
                        autofocus: true,
                        autofillHints: const <String>[AutofillHints.oneTimeCode],
                        keyboardType: TextInputType.number,
                        onChanged: (String code) {
                          _code.value = code;
                          if (code.length == _kSmsCodeLength && requestId != null) {
                            authStore.verifyOTP(
                              phone: phone,
                              code: _code.value,
                              requestId: requestId!,
                            );
                          }
                        },
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).previousFocus();
                      },
                      child: FormField<String>(
                        initialValue: _code.value,
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                              filled: false,
                              contentPadding: EdgeInsets.zero,
                              errorText: state.errorText,
                              border: InputBorder.none,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List<Widget>.generate(
                                _kSmsCodeLength,
                                (int index) {
                                  final bool isCurrent = index == _code.value.length;

                                  String digit;
                                  if (_code.value.length - 1 < index) {
                                    digit = '';
                                  } else {
                                    digit = _code.value[index];
                                  }

                                  return Container(
                                    width: 50.0,
                                    height: 72.0,
                                    margin: EdgeInsetsDirectional.only(
                                      end: index == _kSmsCodeLength - 1 ? 0 : 8.0,
                                    ),
                                    child: InputDecorator(
                                      isEmpty: digit.isEmpty,
                                      expands: false,
                                      isFocused: isCurrent,
                                      decoration: const InputDecoration().applyDefaults(
                                        Theme.of(context).inputDecorationTheme,
                                      ),
                                      child: Text(
                                        digit,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 30.0,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                        validator: (String? code) {
                          if (code?.length != _kSmsCodeLength) {
                            return 'The code is 4 digits long.';
                          }

                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
