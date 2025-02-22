import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/homework/provider/homework_controller.dart';
import 'package:school_management/widgets/common/custom_app_bar.dart';

class HomeWorkScreen extends StatelessWidget {
  const HomeWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "Homework",
          showtitle: true,
        ),
       
        body: SizedBox(
          width: context.screenWidth,
          height: context.screenHeight,
          child:   Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<HomeworkProvider>(
          builder: (context, provider, child) {
            return ListView.builder(
              itemCount: provider.homeworkList.length,
              itemBuilder: (context, index) {
                var homework = provider.homeworkList[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 12),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.pink[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(activeColor: primaryColor,
                          shape: CircleBorder(),
                          value: homework.isCompleted,
                          onChanged: (bool? newValue) {
                            provider.toggleCompletion(index);
                          },
                           side: BorderSide(
                            color: homework.isCompleted ? Colors.deepPurple : Colors.grey,
                            width: 2,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            homework.title,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${homework.subject} ${homework.date.isNotEmpty ? ' / ${homework.date}' : ''}",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
        ));
  }



}
