import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/core/common/widgets/loader.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/core/utils/show_snackbar.dart';
import 'package:lost_found/features/components/backend/presentation/bloc/backend_information_bloc.dart';
import 'package:lost_found/features/components/found/presentation/pages/found_item_details_page.dart';
import 'package:lost_found/features/components/lost/presentation/pages/lost_item_details_page.dart';
import 'package:lost_found/features/main/widgets/cards.dart';
import 'package:lost_found/core/common/widgets/text_title_widget.dart';

class BrowseItem extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const BrowseItem());
  const BrowseItem({super.key});

  @override
  State<BrowseItem> createState() => _BrowseItemState();
}

class _BrowseItemState extends State<BrowseItem> {
  @override
  void initState() {
    super.initState();
    // context.read<BackendInformationBloc>().add(BackendLostInformationBloc());
    // context.read<BackendInformationBloc>().add(BackendFoundInformationBloc());
    context.read<BackendInformationBloc>().add(BackendItemInformationBloc());
  }

  Map<String, dynamic> getTimeDifference(DateTime pastTime) {
    // Get the current time
    DateTime currentTime = DateTime.now();
    print("Past Time $pastTime");
    print("Current time $currentTime");

    // Calculate the difference
    Duration difference = currentTime.difference(pastTime);

    // Check if the result should be in minutes or hours
    if (difference.inMinutes.abs() < 60) {
      return {
        'time': difference.inMinutes.abs(),
        'inMinutes': true, // Indicates the time is in minutes
      };
    } else {
      return {
        'time': difference.inHours.abs(),
        'inMinutes': false, // Indicates the time is in hours
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: AppPallete.lightGrey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  buildHeading("Browse reported items",
                      color: AppPallete.blackColor),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppPallete.greyColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        hintText: 'Search',
                        suffixIcon: Icon(
                          Icons.search,
                          color: AppPallete.lightPurple,
                          size: 30,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),

          const Cards(
            title: "Notebook and Pen",
            description:
                "Left my notebook & Pen In meeting room no 5. It has important client Meeting notes",
            user: "Deepika",
            time: "3 hrs ago",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfF2YcEpt1vTuV0UF4jSdhV-sVrvp3lo1y9kPsSTtCxw&s",
            status: "Claimed",
            color: AppPallete.claimedColor,
            textColor: AppPallete.blackColor,
            fontSize: 13.0,
          ),

          // Items Collection
          BlocConsumer<BackendInformationBloc, BackendInformationState>(
            listener: (context, state) {
              if (state is BackendInformationFailure) {
                showSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              if (state is BackendInformationLoading) {
                return const Loader();
              }
              if (state is BackendInformationSuccess) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.item.length,
                  itemBuilder: (context, index) {
                    final itemList = state.item[index];

                    Map<String, dynamic> timeData =
                        getTimeDifference(itemList.updatedAt);
                    int timeAgo = timeData['time'];
                    bool inMinutes = timeData['inMinutes'];

                    String timeText =
                        inMinutes ? '$timeAgo min ago' : '$timeAgo hrs ago';

                    if (itemList.status == "Lost") {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            LostItemDetailsPage.route(
                              itemList.posterName!,
                              timeText,
                              itemList.imageUrl,
                              itemList.title,
                              itemList.category,
                              itemList.description,
                              itemList.location,
                              itemList.lostDate!,
                              itemList.lostTime!,
                            ),
                          );
                        },
                        child: Cards(
                          title: itemList.title,
                          description: itemList.description,
                          user: itemList.posterName!,
                          time: timeText,
                          imageUrl: itemList.imageUrl,
                          status: itemList.status,
                          color: (itemList.claimed == false)
                              ? AppPallete.lostColor
                              : AppPallete.claimedColor,
                          fontSize: (itemList.claimed == true) ? 13.0 : 16.0,
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            FoundItemDetailsPage.route(
                              itemList.posterName!,
                              timeText,
                              itemList.imageUrl,
                              itemList.title,
                              itemList.category,
                              itemList.description,
                              itemList.location,
                              itemList.updatedAt,
                              itemList.collectionCenter!,
                            ),
                          );
                        },
                        child: Cards(
                          title: itemList.title,
                          description: itemList.description,
                          user: itemList.posterName!,
                          time: timeText,
                          imageUrl: itemList.imageUrl,
                          status: itemList.status,
                          color: (itemList.claimed == false)
                              ? AppPallete.foundColor
                              : AppPallete.claimedColor,
                          fontSize: (itemList.claimed == true) ? 13.0 : 16.0,
                        ),
                      );
                    }
                  },
                );
              }

              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
