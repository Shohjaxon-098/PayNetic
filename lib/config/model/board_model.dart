class BoardModel {
  final String img;
  final String motto;
  final int idx;

  BoardModel(this.img, this.motto, this.idx);
}

final List<BoardModel> boards = [
  BoardModel("assets/images/onboard1.json", "Paynetic bilan moliya nazoratda", 0),
  BoardModel("assets/images/onboard2.json", "Bir necha bosish — butun dunyo siz bilan", 1),
  BoardModel("assets/images/onboard3.json", "Xavfsizlik — bizning eng ustuvor vazifamiz", 2),
];