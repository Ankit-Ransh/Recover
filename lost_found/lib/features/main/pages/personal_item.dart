import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:lost_found/core/common/widgets/loader.dart';
import 'package:lost_found/core/common/widgets/text_description_widget.dart';
import 'package:lost_found/core/common/widgets/text_title_widget.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/core/utils/show_snackbar.dart';
import 'package:lost_found/features/components/backend/presentation/bloc/backend_information_bloc.dart';
import 'package:lost_found/features/main/pages/index_page.dart';
import 'package:lost_found/features/main/widgets/cards.dart';

class PersonalItems extends StatefulWidget {
  const PersonalItems({super.key});

  @override
  State<PersonalItems> createState() => _PersonalItemsState();
}

class _PersonalItemsState extends State<PersonalItems> {
  @override
  void initState() {
    super.initState();
    // context.read<BackendInformationBloc>().add(BackendLostInformationBloc());
    // context.read<BackendInformationBloc>().add(BackendFoundInformationBloc());
    context.read<BackendInformationBloc>().add(BackendItemInformationBloc());
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId =
        (context.read<AppUserCubit>().state as AppUserLoggedIn).user.id;

    int myItems = 0;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: AppPallete.lightGrey,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.fromLTRB(10, 5, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, IndexPage.route());
                    },
                    child: const Icon(
                      CupertinoIcons.back,
                      size: 35,
                    ),
                  ),
                  const SizedBox(width: 20),
                  buildHeading(
                    "Items reported",
                    color: AppPallete.blackColor,
                    fontSize: 20,
                    bold: false,
                  ),
                ],
              ),
            ),
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

                    if (itemList.userId == currentUserId) {
                      myItems = myItems + 1;
                      if (itemList.status == "Lost") {
                        return GestureDetector(
                          onTap: () {},
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
                          onTap: () {},
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
                    }
                  },
                );
              }
              return const SizedBox();
            },
          ),

          (myItems != 0) ? const SizedBox() : const NoReportedItems(),
        ],
      ),
    );
  }
}

class NoReportedItems extends StatelessWidget {
  const NoReportedItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        buildDescription(
          "Don't worry you have no lost items",
          fontSize: 18,
        )
      ],
    );
  }
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
