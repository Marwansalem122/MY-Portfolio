import 'package:my_portfolio/core/constants/assets_manager.dart';
import 'package:my_portfolio/core/constants/strings_manager.dart';

class ProjectUtils {
  final String image;
  final String title;
  final String subTitle;
  final String androidLink;
  final String iosLink;
  final String webLink;
  final String githubLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subTitle,
    this.androidLink = '',
    this.iosLink = '',
    this.webLink = '',
    this.githubLink = '',
  });
}

//Hobby Project Utils
List<ProjectUtils> hobbyProjectUtils = [
  ProjectUtils(
    image: AssetsManager.travellerAppImage,
    title: StringsManager.safariaTraveller,
    subTitle: StringsManager.safariaTravellerSubTitle,
    androidLink: StringsManager.safariaTravellerAndroid,
    iosLink: StringsManager.safariaTravellerIos,
    webLink: StringsManager.safariaTravellerWeb,
  ),
  ProjectUtils(
    image: AssetsManager.agencyAppImage,
    title: StringsManager.safariaAgencyApp,
    subTitle: StringsManager.safariaAgencyAppSubTitle,
    androidLink: StringsManager.safariaAgencyAppAndroid,
    iosLink: StringsManager.safariaAgencyAppIos,
    webLink: StringsManager.safariaAgencyAppWeb,
  ),
  ProjectUtils(
    image: AssetsManager.telehealthAppImage,
    title: StringsManager.telehealth,
    subTitle: StringsManager.telehealthSubTitle,
    androidLink: StringsManager.telehealthAndroid,
    iosLink: StringsManager.telehealthIos,
    webLink: StringsManager.telehealthWeb,
  ),
  ProjectUtils(
    image: AssetsManager.splashviewCafitImage,
    title: StringsManager.cafit,
    subTitle: StringsManager.cafitSubTitle,
    githubLink: StringsManager.fitnessAndroid,
  ),
  ProjectUtils(
    image: AssetsManager.splashviewMovieAppImage,
    title: StringsManager.movieApp,
    subTitle: StringsManager.movieAppSubTitle,
    githubLink: StringsManager.movieAndroid,
  ),
  ProjectUtils(
    image: AssetsManager.splashviewSpotifyImage,
    title: StringsManager.spotify,
    subTitle: StringsManager.spotifySubTitle,
    githubLink: StringsManager.spotifyAndroid,
  ),
  ProjectUtils(
    image: AssetsManager.splashviewWhatsAppImage,
    title: StringsManager.whatsApp,
    subTitle: StringsManager.whatsAppSubTitle,
    githubLink: StringsManager.whatsAPPAndroid,
  ),
  ProjectUtils(
    image: AssetsManager.amazonAppImage,
    title: StringsManager.amazonApp,
    subTitle: StringsManager.amazonAppSubTitle,
    githubLink: StringsManager.amazonAppAndroid,
  ),
];
