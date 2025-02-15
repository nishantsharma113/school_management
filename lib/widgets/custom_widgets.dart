import 'package:school_management/core/library/library.dart';

textShimmer(
    {required BuildContext context,
    double? width,
    double? height,
    double? radius}) {
  return Container(
    width: width ?? context.screenWidth,
    height: height ?? 24,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(radius ?? 4),
    ),
  );
}

Widget boxShimmer(
    {required BuildContext context,
    double? width,
    double? height,
    double? radius}) {
  return Container(
    width: width ?? context.screenWidth,
    height: height ?? 200,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(radius ?? 4),
    ),
  );
}
