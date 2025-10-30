import 'dart:io';

import 'package:equatable/equatable.dart';

class ImagenEntity extends Equatable {
  const ImagenEntity({required this.archivo});
  final File archivo;
  @override
  List<Object?> get props => [archivo];
}
