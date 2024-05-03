// import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/core/common/widgets/loader.dart';
import 'package:lost_found/core/common/widgets/text_title_widget.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/core/utils/show_snackbar.dart';
import 'package:lost_found/features/components/backend/presentation/bloc/backend_information_bloc.dart';
// import 'package:lost_found/features/main/widgets/get_found_time_difference.dart';
// import 'package:lost_found/features/main/widgets/get_lost_time_difference.dart';
import 'package:lost_found/features/main/widgets/lost_found_personal_item.dart';
// import 'package:lost_found/features/main/widgets/recommended_card.dart';

class RecommendationPage extends StatefulWidget {
  final String id;
  final String imageUrl;
  final String title;
  final String description;
  final String category;

  const RecommendationPage({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.category,
  });

  static MaterialPageRoute route(
    String id,
    String imageUrl,
    String title,
    String description,
    String category,
  ) {
    return MaterialPageRoute(
      builder: (context) => RecommendationPage(
        id: id,
        imageUrl: imageUrl,
        title: title,
        description: description,
        category: category,
      ),
    );
  }

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  @override
  void initState() {
    super.initState();
    context.read<BackendInformationBloc>().add(BackendItemInformationBloc());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: AppPallete.greyShade300,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.fromLTRB(10, 5, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
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
          const SizedBox(height: 15),

          LostFoundPersonalItem(
            imageUrl: widget.imageUrl,
            title: widget.title,
            description: widget.description,
            category: widget.category,
          ),

          const SizedBox(height: 10),

          // Horizontal line

          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppPallete.greyShade300),
            ),
          ),

          Container(
            padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
            width: double.infinity,
            child: buildHeading(
              "Best match for your item",
              color: AppPallete.blackColor,
              fontSize: 24,
              bold: false,
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
              // final actualItemLabel = getItemLabel(widget.imageUrl);
              // print("Acutal item ->  $actualItemLabel");

              // ----------------------------------------------
              if (state is BackendInformationLoading) {
                return const Loader();
              }
              if (state is BackendInformationSuccess) {



                // List<Map<String, dynamic>> lostItems = [];
                // for (var itemList in state.item) {
                //   lostItems.add({
                //     'id': itemList.id,
                //     'title': itemList.title,
                //     'description': itemList.description,
                //   });
                // }

                // List<String> recommendations = generateRecommendations(
                //     widget.id, widget.title, widget.description, lostItems);

                // print(recommendations);

                // for (var itemList in state.item) {
                //   if (itemList.id != widget.id &&
                //       searchConditions(widget.description, itemList.description,
                //           widget.title, itemList.title)) {
                //     Map<String, int> timeDiff = getLostTimeDifference(
                //         itemList.lostDate,
                //         itemList.lostTime,
                //         itemList.updatedAt);
                //     String timeText = "";

                //     Map<String, int> foundTimeDiff =
                //         getFoundTimeDifference(itemList.updatedAt);
                //     String foundTimeText = foundTimeDiff.keys.first;

                //     if (itemList.status == "Lost") {
                //       timeText = timeDiff.keys.first;
                //     } else {
                //       foundTimeText = foundTimeDiff.keys.first;
                //     }

                //     if (itemList.status != "Claimed") {
                //       return RecommendedCards(
                //         imageUrl: itemList.imageUrl,
                //         title: itemList.title,
                //         description: itemList.description,
                //         category: itemList.category,
                //         postedBy: itemList.posterName!,
                //         timeText: itemList.status == "Lost"
                //             ? timeText
                //             : foundTimeText,
                //       );
                //     } else {
                //       return const SizedBox();
                //     }
                //   }
                // }
              }
              return const SizedBox();
            },
          ),

          // // Recommended Cards
          // RecommendedCards(
          //   imageUrl: imageUrl,
          //   title: title,
          //   description: description,
          //   category: category,
          //   postedBy: "Amit",
          //   timeText: "3 hrs ago",
          // ),
        ],
      ),
    );
  }
}

Future getItemLabel(String imageUrl) async {
  String apiUrl = "http://172.70.102.165:8080/predict";

  print("Ok o");

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      body: {'imageUrl': imageUrl},
    );

    print("Response status code: ${response.statusCode}");
    print("Response body: ${response.body}");
  } catch (e) {
    print("Error: $e");
  }
  print("Ok okkkkkk");
}

/*

// List<double> tfidf(String document, List<String> corpus) {
//   List<String> words = document.split(' ');
//   Map<String, double> tfidf = {};

//   for (String word in words) {
//     tfidf[word] = tf(word, words) * idf(word, corpus);
//   }

//   return tfidf.values.toList();
// }

// double tf(String term, List<String> document) {
//   double count = 0;
//   for (String word in document) {
//     if (word == term) {
//       count++;
//     }
//   }
//   return count / document.length;
// }

// double idf(String term, List<String> corpus) {
//   double count = 0;
//   for (String document in corpus) {
//     if (document.contains(term)) {
//       count++;
//     }
//   }
//   return log(corpus.length / count);
// }

// double cosineSimilarity(List<double> vec1, List<double> vec2) {
//   assert(vec1.length == vec2.length);
//   double dotProduct = 0.0;
//   double normVec1 = 0.0;
//   double normVec2 = 0.0;

//   for (int i = 0; i < vec1.length; i++) {
//     dotProduct += vec1[i] * vec2[i];
//     normVec1 += vec1[i] * vec1[i];
//     normVec2 += vec2[i] * vec2[i];
//   }

//   return dotProduct / (sqrt(normVec1) * sqrt(normVec2));
// }

// List<String> generateRecommendations(String id, String queryTitle, String queryDescription, List<Map<String, dynamic>> lostItems) {
//   List<String> recommendations = [];

//   for (var item in lostItems) {
//     // Preprocess title and description
//     String title = item["title"].toLowerCase();
//     String description = item["description"].toLowerCase();

//     // Calculate similarity scores
//     double titleSimilarity = cosineSimilarity(
//         tfidf(title), tfidf(queryTitle.toLowerCase()));
//     double descriptionSimilarity = cosineSimilarity(
//         tfidf(description), tfidf(queryDescription.toLowerCase()));

//     // Calculate overall similarity score (weighted average of title and description similarities)
//     double overallSimilarity =
//         0.5 * titleSimilarity + 0.5 * descriptionSimilarity;

//     // Add item to recommendations if similarity score exceeds threshold
//     if (overallSimilarity > 0.5) {
//       recommendations.add(item["title"]);
//     }
//   }

//   return recommendations;
// }

List<double> tfidf(String document, List<String> corpus, List<String> terms) {
  List<String> words = document.split(' ');
  List<double> tfidfVector = List.filled(terms.length, 0.0);

  for (int i = 0; i < terms.length; i++) {
    String term = terms[i];
    if (words.contains(term)) {
      tfidfVector[i] = tf(term, words) * idf(term, corpus);
    }
  }

  return tfidfVector;
}

double tf(String term, List<String> document) {
  double count = 0;
  for (String word in document) {
    if (word == term) {
      count++;
    }
  }
  return count / document.length;
}

double idf(String term, List<String> corpus) {
  double count = 0;
  for (String document in corpus) {
    if (document.contains(term)) {
      count++;
    }
  }
  return log(corpus.length / count);
}

double cosineSimilarity(List<double> vec1, List<double> vec2) {
  assert(vec1.length == vec2.length);
  double dotProduct = 0.0;
  double normVec1 = 0.0;
  double normVec2 = 0.0;

  for (int i = 0; i < vec1.length; i++) {
    dotProduct += vec1[i] * vec2[i];
    normVec1 += vec1[i] * vec1[i];
    normVec2 += vec2[i] * vec2[i];
  }

  return dotProduct / (sqrt(normVec1) * sqrt(normVec2));
}

List<String> generateRecommendations(String id, String queryTitle,
    String queryDescription, List<Map<String, dynamic>> lostItems) {
  List<String> recommendations = [];
  List<String> corpus = [
    queryTitle.toLowerCase(),
    queryDescription.toLowerCase()
  ];
  List<String> terms = corpus.expand((doc) => doc.split(' ')).toSet().toList();

  for (var item in lostItems) {
    // Preprocess title and description
    String title = item["title"].toLowerCase();
    String description = item["description"].toLowerCase();

    // Calculate similarity scores
    double titleSimilarity = cosineSimilarity(tfidf(title, corpus, terms),
        tfidf(queryTitle.toLowerCase(), corpus, terms));
    double descriptionSimilarity = cosineSimilarity(
        tfidf(description, corpus, terms),
        tfidf(queryDescription.toLowerCase(), corpus, terms));

    // Calculate overall similarity score (weighted average of title and description similarities)
    double overallSimilarity =
        0.5 * titleSimilarity + 0.5 * descriptionSimilarity;

    // Add item to recommendations if similarity score exceeds threshold
    if (overallSimilarity > 0.3) {
      recommendations.add(item["id"]);
    }
  }

  return recommendations;
}

// --------------------------------------------------------------
bool searchConditions(String actualDescription, String recomendedDescription,
    String actualTitle, String recomendedTitle) {
  bool lowercase = false;
  bool uppercase = false;

  if (actualDescription.toLowerCase().compareTo(recomendedDescription) > 0 ||
      actualTitle.toLowerCase().compareTo(recomendedTitle) > 0) {
    lowercase = true;
  }

  if (actualDescription.toLowerCase().compareTo(recomendedTitle) > 0 ||
      actualTitle.toLowerCase().compareTo(recomendedDescription) > 0) {
    lowercase = true;
  }

  if (actualDescription.toUpperCase().compareTo(recomendedDescription) > 0 ||
      actualTitle.toUpperCase().compareTo(recomendedTitle) > 0) {
    uppercase = true;
  }

  if (actualDescription.toUpperCase().compareTo(recomendedTitle) > 0 ||
      actualTitle.toUpperCase().compareTo(recomendedDescription) > 0) {
    uppercase = true;
  }

  return lowercase || uppercase;
}


// -----------------------------------------------------

// -----------------------------------------------------------

*/