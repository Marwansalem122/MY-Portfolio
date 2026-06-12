import 'package:my_portfolio/core/constants/assets_manager.dart';
import 'package:my_portfolio/core/constants/strings_manager.dart';

class ProjectUtils {
  final String image;
  final String title;
  final String subTitle;
  final String androidLink;
  final String iosLink;
  final String webLink;
  ProjectUtils({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.androidLink,
    required this.iosLink,
    required this.webLink,
  });
}

//Hobby Project Utils
 List<ProjectUtils> hobbyProjectUtils = [
  ProjectUtils(
    image: AssetsManager.splashviewCafitImage,
    title: StringsManager.cafit,
    subTitle: StringsManager.cafitSubTitle,
    androidLink: StringsManager.fitnessAndroid,
    iosLink: StringsManager.fitnessIos,
    webLink: StringsManager.fitnessWeb,
  ),
  ProjectUtils(
    image: AssetsManager.splashviewMovieAppImage,
    title: StringsManager.movieApp,
    subTitle: StringsManager.movieAppSubTitle,
    androidLink: StringsManager.movieAndroid,
    iosLink: StringsManager.movieIos,
    webLink: StringsManager.movieWeb,
  ),
  ProjectUtils(
    image: AssetsManager.splashviewSpotifyImage,
    title: StringsManager.spotify,
    subTitle: StringsManager.spotifySubTitle,
    androidLink: StringsManager.spotifyAndroid,
    iosLink: StringsManager.spotifyIos,
    webLink: StringsManager.spotifyWeb,
  ),
  ProjectUtils(
    image: AssetsManager.splashviewWhatsAppImage,
    title: StringsManager.whatsApp,
    subTitle: StringsManager.whatsAppSubTitle,
    androidLink: StringsManager.whatsAPPAndroid,
    iosLink: StringsManager.whatsAPPIos,
    webLink: StringsManager.whatsAPPWeb,
  ),
  ProjectUtils(
    image: AssetsManager.amazonAppImage,
    title: StringsManager.amazonApp,
    subTitle: StringsManager.amazonAppSubTitle,
    androidLink: StringsManager.amazonAppAndroid,
    iosLink: StringsManager.amazonAppIos,
    webLink: StringsManager.amazonAppWeb,
  ),
];
