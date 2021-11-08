library state;

import 'dart:developer';

import 'package:chatty/models/index.dart';
import 'package:chatty/services/auth_service.dart';
import 'package:chatty/services/content_service.dart';
import 'package:chatty/shared/exceptions/incomplete_profile.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.dart';
part 'user_store.dart';

part 'index.g.dart';
// part 'index.freezed.dart';
