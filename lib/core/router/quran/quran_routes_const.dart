class QuranRoutesConst {
  const QuranRoutesConst();

  String get detailBase => "/quran/detail";
  String get calcBase => "/quran/calc";

  String detail(int surahId) => "/quran/detail/$surahId";
  String calc() => "/quran/calc";

  String get detailPattern => "$detailBase/:id";
  String get calcPattern => calcBase;

}