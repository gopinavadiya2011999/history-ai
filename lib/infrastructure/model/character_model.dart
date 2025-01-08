import 'package:history_ai/infrastructure/constant/image_constant.dart';

class CharacterModel {
  String characterImage;
  bool selectedCharacter;

  CharacterModel({required this.characterImage, this.selectedCharacter = false});
}

class CharImageModel {
  final String name;
  final String photo;
  final String id;
   bool selectedCharacter;

  CharImageModel({this.selectedCharacter=false,required this.name, required this.photo, required this.id});
}
List<CharImageModel> charData =[
  CharImageModel(name: 'Active Men', photo: ImageConstant.activeMen, id: 'activeMen'),
  CharImageModel(name: 'Ballerina', photo: ImageConstant.ballerina, id: 'ballerina'),
  CharImageModel(name: 'Baseball Player', photo: ImageConstant.baseballPlayer, id: 'baseballPlayer'),
  CharImageModel(name: 'Bearded Men', photo: ImageConstant.beardedMen, id: 'beardedMen'),
  CharImageModel(name: 'Biologist', photo: ImageConstant.biologist, id: 'biologist'),
  CharImageModel(name: 'Cheerful Men', photo: ImageConstant.cheerfulMen, id: 'cheerfulMen'),
  CharImageModel(name: 'Cute Girl', photo: ImageConstant.cuteGirl, id: 'cuteGirl'),
  CharImageModel(name: 'Entrepreneur Girl', photo: ImageConstant.entrepreneurGirl, id: 'entrepreneurGirl'),
  CharImageModel(name: 'Entrepreneur Men', photo: ImageConstant.entrepreneurMen, id: 'entrepreneurMen'),
  CharImageModel(name: 'Free Men', photo: ImageConstant.freeMan, id: 'freeMan'),
  CharImageModel(name: 'Fun Boy', photo: ImageConstant.funBoy, id: 'funBoy'),
  CharImageModel(name: 'Girl With Head Band', photo: ImageConstant.girlWithHeadBand, id: 'girlWithHeadBand'),
  CharImageModel(name: 'Girl With Red Cloth', photo: ImageConstant.girlWithRedCloth, id: 'girlWithRedCloth'),
  CharImageModel(name: 'Handsome Boy', photo: ImageConstant.handsomeBoy, id: 'handsomeBoy'),
  CharImageModel(name: 'Happy Men', photo: ImageConstant.happyMen, id: 'happyMen'),
  CharImageModel(name: 'Happy Women', photo: ImageConstant.happyWomen, id: 'happyWomen'),
  CharImageModel(name: 'Innocent Men', photo: ImageConstant.innocentMen, id: 'innocentMen'),
  CharImageModel(name: 'Long Hair Men', photo: ImageConstant.longHairMen, id: 'longHairMen'),
  CharImageModel(name: 'Men With Beanie', photo: ImageConstant.menWithBeanie, id: 'menWithBeanie'),
  CharImageModel(name: 'Men With Red Cloth', photo: ImageConstant.menWithRedCloth, id: 'menWithRedCloth'),
  CharImageModel(name: 'Neat Men', photo: ImageConstant.neatMen, id: 'neatMen'),
  CharImageModel(name: 'Pinky Girl', photo: ImageConstant.pinkyGirl, id: 'pinkyGirl'),
  CharImageModel(name: 'Short Hair Girl', photo: ImageConstant.shortHairGirl, id: 'shortHairGirl'),
  CharImageModel(name: 'Smiley Boy', photo: ImageConstant.smileyBoy, id: 'smileyBoy'),
  CharImageModel(name: 'Smiley Girl', photo: ImageConstant.smileyGirl, id: 'smileyGirl'),
  CharImageModel(name: 'Tennis Player', photo: ImageConstant.tennisPlayer, id: 'tennisPlayer'),
  CharImageModel(name: 'Trendy Boy', photo: ImageConstant.trendyBoy, id: 'trendyBoy'),
  CharImageModel(name: 'Woman Employee', photo: ImageConstant.womanEmployee, id: 'womanEmployee'),
  CharImageModel(name: 'Zoo Keeper', photo: ImageConstant.zooKeeper, id: 'zooKeeper'),
];