class QuranRoutesConst {
  const QuranRoutesConst();

  String get detailBase => "/quran/detail";

  String detail(int surahId) => "/quran/detail/$surahId";

  String get detailPattern => "$detailBase/:id";

}