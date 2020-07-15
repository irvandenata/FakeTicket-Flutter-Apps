import 'dart:io';

import 'package:bwa_flutix/bloc/blocs.dart';
import 'package:bwa_flutix/models/models.dart';
import 'package:bwa_flutix/services/services.dart';
import 'package:bwa_flutix/shared/shared.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_page.dart';
part 'main_page.dart';
part 'movie_page.dart';
part 'sign_page.dart';
part 'wrapper.dart';
part 'splash_page.dart';

Future<File> getImage() async {
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  return image;
}