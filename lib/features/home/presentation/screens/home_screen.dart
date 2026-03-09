import 'package:flutter/material.dart';
import 'package:tasky_app/core/service/navigator.dart';
import 'package:tasky_app/core/theme/app_colors.dart';
import 'package:tasky_app/core/theme/app_text_style.dart';
import 'package:tasky_app/features/home/presentation/screens/add_task_screen.dart';
import 'package:tasky_app/features/home/presentation/widgets/item_of_categories.dart';
import 'package:tasky_app/features/home/presentation/widgets/list_view_tasks.dart';
import 'package:tasky_app/features/home/presentation/widgets/widget_priority.dart';
import 'package:tasky_app/features/home/presentation/widgets/widget_status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List categories = ["All", "Inpogress", "Waiting", "Finished"];

  int isSelectIndex = 0;
  WidgetStatus widgetStatus = WidgetStatus();
  final CustomNavigator customNavigator = CustomNavigator();
  WidgetPriority widgetPriority = WidgetPriority();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.splashBlue,
        onPressed: () {
          customNavigator.push(context, AddTaskScreen());
        },
        child: Icon(Icons.add, color: AppColors.kWhite),
      ),
      appBar: AppBar(
        title: Text("Logo"),
        backgroundColor: AppColors.kWhite,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.person_pin_rounded)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout, color: AppColors.splashBlue),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "My Tasks",
                  style: AppTextStyle.headlineMedium.copyWith(
                    color: AppColors.kOffWhiteLigth,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(top: 4),

              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                      onTap: () {
                        isSelectIndex = index;
                        setState(() {});
                      },
                      child: ItemOfCategories(
                        categories: categories,

                        isSelectIndex: isSelectIndex,
                        currentindex: index,
                      ),
                    ),
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 7);
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListViewTasks(
                  widgetStatus: widgetStatus,
                  widgetPriority: widgetPriority,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
