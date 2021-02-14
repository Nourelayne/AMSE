import 'package:music_app/screens/bibliotheque.dart';

const profile_picture = "assets/images/Profile_Picture.jpg";
const facebook_icon = "assets/icons/facebook_icon.png";
const instagram_icon = "assets/icons/instagram-circle-logo.png";
const background = "assets/images/scard.png";
const art1 = "assets/images/Vampire_Weekend.png";
const art2 = "assets/images/Sia&DavidGuetta.jpg";
const art3 = "assets/images/Lenny_Kravitz.jpg";
const art4 = "assets/images/Coldplay.jpg";
const art5 = "assets/images/Syn_Cole.jpg";
const art6 = "assets/images/Pixies.jpg";

final songs = [
  SongCard(
      sr: 1,
      img: art1,
      title: "This Life",
      artist: "Vampire Weekend",
      time: '5:23',
      saved: false),
  SongCard(
      sr: 2,
      img: art2,
      title: "Floating Through Space",
      artist: "Sia and David Guetta",
      time: '2:57',
      saved: false),
  SongCard(
      sr: 3,
      img: art3,
      title: "Fly Away",
      artist: "Lenny Kravitz",
      time: '3:44',
      saved: false),
  SongCard(
      sr: 4,
      img: art4,
      title: "Speed Of Sound",
      artist: "Coldplay",
      time: '4:27',
      saved: false),
  SongCard(
      sr: 5,
      img: art5,
      title: "Miami 82",
      artist: "Syn Cole (Kygo Remix)",
      time: '5:43',
      saved: false),
  SongCard(
      sr: 6,
      img: art6,
      title: "Where Is My Mind",
      artist: "Pixies",
      time: '3:36',
      saved: false),
];

final saved = Set<SongCard>();
