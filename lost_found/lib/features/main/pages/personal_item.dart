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
import 'package:lost_found/features/main/pages/recommendation_page.dart';
import 'package:lost_found/features/main/widgets/cards.dart';
import 'package:lost_found/features/main/widgets/get_found_time_difference.dart';
import 'package:lost_found/features/main/widgets/get_lost_time_difference.dart';

class PersonalItems extends StatefulWidget {
  const PersonalItems({super.key});

  @override
  State<PersonalItems> createState() => _PersonalItemsState();
}

class _PersonalItemsState extends State<PersonalItems> {
  int myItems = 0;

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
                myItems = state.item
                    .where((item) => item.userId == currentUserId)
                    .length;

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.item.length,
                  itemBuilder: (context, index) {
                    final itemList = state.item[index];

                    if (itemList.userId == currentUserId) {
                      String timeText = getLostTimeDifference(itemList.lostDate,
                          itemList.lostTime, itemList.updatedAt).keys.first;
                      String foundTimeText =
                          getFoundTimeDifference(itemList.updatedAt).keys.first;

                      if (itemList.status == "Lost") {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              RecommendationPage.route(
                                itemList.imageUrl,
                                itemList.title,
                                itemList.description,
                                itemList.category,
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
                              RecommendationPage.route(
                                itemList.imageUrl,
                                itemList.title,
                                itemList.description,
                                itemList.category,
                              ),
                            );
                          },
                          child: Cards(
                            title: itemList.title,
                            description: itemList.description,
                            user: itemList.posterName!,
                            time: foundTimeText,
                            imageUrl: itemList.imageUrl,
                            status: itemList.status,
                            color: (itemList.claimed == false)
                                ? AppPallete.foundColor
                                : AppPallete.claimedColor,
                            fontSize: (itemList.claimed == true) ? 13.0 : 16.0,
                          ),
                        );
                      }
                    } else {
                      return const SizedBox();
                    }
                  },
                );
              }
              return (myItems == 0)
                  ? const NoReportedItems()
                  : const SizedBox();
            },
          ),
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
