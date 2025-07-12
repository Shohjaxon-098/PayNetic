


import 'package:paynetic/features/onboarding/export.dart';

class BoardWidget extends StatelessWidget {
  final BoardModel boardModel;
  final bool lastIdx;
  const BoardWidget({Key? key, required this.boardModel, required this.lastIdx})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: w,
      height: w,
      child: Column(
        children: <Widget>[
          Spacer(),
          SizedBox(
            width: 250,
            height: 100,
            child: Lottie.asset(
              fit: BoxFit.cover,
              boardModel.img,
              repeat: true,
            ),
          ),
          SizedBox(height: 150),
          Text(
            boardModel.motto,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: lastIdx ? Colors.black : Colors.white,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}


