

import 'package:school_management/core/library/library.dart';
import 'package:school_management/widgets/custom_widgets.dart';


class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textShimmer(context: context),
                
                10.heightBox,
                textShimmer(context: context),
                
                5.heightBox,
                textShimmer(context: context),
                
                5.heightBox,
                textShimmer(context: context),
              ],
            ),
            20.heightBox,
            textShimmer(context: context),
            20.heightBox,
            Column(children: List.generate(2, (int i){
              return boxShimmer(context: context).pOnly(bottom: 10);
            }),)
          ],
        ).p16()
      
      
       
    );
  }

  
}