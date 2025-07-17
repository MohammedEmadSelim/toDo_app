// ignore_for_file: unnecessary_this

import 'package:to_do_app/core/responsive/responsice_calculation.dart';

extension ResponsiveExtention on num {
  double get h => ResponsiveCalculation.calculateHeight(this.toDouble());

  double get w => ResponsiveCalculation.calculateWidth(this.toDouble());
}
