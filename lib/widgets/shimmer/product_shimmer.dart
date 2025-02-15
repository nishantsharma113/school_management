

import 'package:school_management/core/library/library.dart';
import 'package:school_management/widgets/custom_widgets.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(children: List.generate(10, (int i){
              return boxShimmer(context: context,height: 50).pOnly(bottom: 10);
            }),).p16()
      
      
       
    );
  }

  
}