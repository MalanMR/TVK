import 'package:bloc_code/Feature/RegScreen/presentation/widget/eventcard.dart';
import 'package:bloc_code/core/constant/app_colors.dart';
import 'package:bloc_code/core/constant/string.dart';
import 'package:flutter/material.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({super.key});

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            stringArray().eventCategories.isEmpty
                ? const Center(child: Text("No events found"))
                : LayoutBuilder(
              builder: (context, constraints) {
                double screenWidth = constraints.maxWidth;
                int crossAxisCount;
                double childAspectRatio;
                // Adapt columns based on screen width
                if (screenWidth < 360) {
                  crossAxisCount = 3;
                  childAspectRatio = 1;
                } else if (screenWidth < 600) {
                  crossAxisCount = 3;
                  childAspectRatio = 0.80;
                } else {
                  crossAxisCount = 4;
                  childAspectRatio = 0.70;
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: stringArray().eventCategories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 16,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemBuilder: (context, index) {
                      final event = stringArray().eventCategories[index];
                      return GestureDetector(
                        // onTap: () {
                        //   if ([ 'Workshop',
                        //     'Presentations',
                        //     'Symposium',
                        //     'Literary Events',
                        //     'Quiz',
                        //     'Online Events', ].contains(event["title"])) {
                        //     Navigator.push(
                        //       context, MaterialPageRoute(
                        //       builder: (_) => WorkshopListScreen( tittle: event["title"]!, ), ), );
                        //   } else if (event["title"] == 'Inventio') {
                        //     Navigator.push(
                        //       context, MaterialPageRoute(
                        //       builder: (_) => WorkshopDetailScreen(
                        //           workshopTitle: 'Inventio', workshopId : "5" ), ), );
                        //   } else if (event["title"] == 'CSI') {
                        //     Navigator.push(
                        //       context, MaterialPageRoute(
                        //       builder: (_) => WorkshopDetailScreen(
                        //           workshopTitle: 'CSI',
                        //           workshopId : "55" ), ), );
                        //   } else if (event["title"] == 'Food & Accommodation') {
                        //     Navigator.push(
                        //       context, MaterialPageRoute(
                        //       builder: (_) => FoodAccommodationScreen( ), ), );
                        //   } else if (event["title"] == 'Event Schedule') {
                        //     Navigator.push(
                        //       context, MaterialPageRoute(
                        //       builder: (_) => EventScheduleScreen( ), ), );
                        //   }else if(event["title"]=='Resource'){
                        //     Navigator.push(
                        //       context, MaterialPageRoute(
                        //       builder: (_) => ResourceScreen( ), ), );
                        //   }
                        // },
                        child: EventCard(
                          title: event["title"]!,
                          imagePath: event["image"]!,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
