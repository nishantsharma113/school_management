import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/homework/model/home_work_model.dart';
import 'package:school_management/features/homework/provider/homework_controller.dart';
import 'package:school_management/widgets/common/custom_app_bar.dart';
import 'package:grouped_list/grouped_list.dart';

class HomeWorkScreen extends StatefulWidget {
  const HomeWorkScreen({super.key});

  @override
  State<HomeWorkScreen> createState() => _HomeWorkScreenState();
}

class _HomeWorkScreenState extends State<HomeWorkScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeworkProvider>(context, listen: false).getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Homework",
        showtitle: true,
      ),
      body: Consumer<HomeworkProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GroupedListView<HomeWorkModel, String>(
              elements: provider.homeworkList,
              groupBy: (element) => element.date,
              groupSeparatorBuilder: (String groupByValue) => Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                child: TextWidget(
                  groupByValue,
                  color: const Color(0xFF473F97),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              itemBuilder: (context, HomeWorkModel homework) {
                return InkWell(
                  onTap: () {
                     final index =
                                provider.homeworkList.indexOf(homework);
                            if (index != -1) {
                              provider.toggleCompletion(index);
                            }
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF1EC),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: 1.2,
                          child: Checkbox(
                            activeColor: Colors.deepPurple,
                            checkColor: Colors.white,
                            shape: CircleBorder(),
                            value: homework.status == Status.COMPLETED,
                            onChanged: (bool? newValue) {
                              // Get the index of the homework in the list
                              final index =
                                  provider.homeworkList.indexOf(homework);
                              if (index != -1) {
                                provider.toggleCompletion(index);
                              }
                            },
                            side: BorderSide(
                              color: homework.status == Status.COMPLETED
                                  ? Colors.deepPurple
                                  : Colors.grey,
                              width: 2,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                homework.title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                homework.subject +
                                    (homework.date == "Today" ||
                                            homework.date == "Yesterday"
                                        ? " / ${homework.date}"
                                        : ""),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              groupComparator: (String a, String b) {
                if (a == "Today") return -1;
                if (b == "Today") return 1;
                if (a == "Yesterday") return -1;
                if (b == "Yesterday") return 1;
                // For other dates, compare normally (newer dates first)
                return b.compareTo(a);
              },
              order: GroupedListOrder.ASC,
              useStickyGroupSeparators: false,
              floatingHeader: false,
              padding: EdgeInsets.zero,
            ),
          );
        },
      ),
    );
  }
}
