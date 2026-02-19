class QuranRoutesConst {
  const QuranRoutesConst();

  String get detailBase => "/quran/detail";

  String detail(String surahId) => "/quran/detail/$surahId";

  String get detailPattern => "$detailBase/:id";

}