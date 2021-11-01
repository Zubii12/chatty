import 'package:flutter/services.dart';

void setWebPageTitle(String title) => SystemChrome.setApplicationSwitcherDescription(
      ApplicationSwitcherDescription(label: title),
    );
