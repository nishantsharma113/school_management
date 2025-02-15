

import 'package:school_management/core/library/library.dart';
import 'package:school_management/widgets/custom_widgets.dart';

class ImageShimmer extends StatelessWidget {
  final double? width;
  final double? height;
  const ImageShimmer({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: boxShimmer(context: context,width: width,height: height)
      
      
       
    );
  }

  
}