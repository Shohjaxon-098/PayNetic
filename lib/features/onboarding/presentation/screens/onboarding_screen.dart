import 'package:paynetic/features/onboarding/export_onboard.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late final AnimationController _ctrlRight = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 720),
  );
  late final AnimationController _ctrlLeft = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 720),
  );

  late Animation<double> animRight;
  late Animation<double> animLeft;
  late Animation<double> animMiddle;

  final double radius = 100000.0;
  int counter = 0;
  int swipe = 0;
  int after = 0;
  bool leftWorking = true;

  final Color blue = const Color(0xff0044CF);
  final Color lightPink = const Color(0xffFDBFDC);

  late Color bgColor;
  late Color rightCircle;
  late Color leftCircle;
  late Color middleCircle;

  @override
  void initState() {
    super.initState();
    bgColor = blue;
    rightCircle = lightPink;
    leftCircle = blue;
    middleCircle = Colors.white;
  }

  @override
  void dispose() {
    _ctrlRight.dispose();
    _ctrlLeft.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (counter == 2) {
      context.go('/home');
      return;
    }

    if (!mounted) return;
    setState(() {
      _ctrlRight.forward();
      swipe = (swipe + 1) % 3;
    });

    Future.delayed(Duration.zero, () {
      if (mounted) _ctrlLeft.forward();
    });

    Future.delayed(const Duration(milliseconds: 420), () {
      if (!mounted) return;
      setState(() {
        bgColor = [lightPink, Colors.white, blue][counter];
      });
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      setState(() => after = 1);
    });

    Future.delayed(const Duration(milliseconds: 1440), () {
      if (!mounted) return;
      setState(() {
        final lefts = [lightPink, Colors.white, blue];
        final middles = [blue, lightPink, Colors.white];
        final rights = [Colors.white, blue, lightPink];

        leftCircle = lefts[counter];
        middleCircle = middles[counter];
        rightCircle = rights[counter];

        leftWorking = false;
        after = 0;
        _ctrlRight.reset();
        _ctrlLeft.reset();
      });
    }).whenComplete(() {
      Future.delayed(const Duration(milliseconds: 720), () {
        if (!mounted) return;
        setState(() {
          leftWorking = true;
          counter = (counter + 1) % 3;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    animRight = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _ctrlRight, curve: Curves.easeInQuart));
    animLeft = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _ctrlLeft, curve: Curves.easeOutQuart));
    animMiddle = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _ctrlRight, curve: Curves.linear));

    return Scaffold(
      body: Container(
        width: w,
        height: h,
        color: bgColor,
        child: Stack(
          children: <Widget>[
            _buildRightLayout(w, h),
            _buildLeftLayout(w, h),
            _buildMiddleButton(h, w),
            _buildOnboardingContent(h, w),
          ],
        ),
      ),
    );
  }

  Widget _buildRightLayout(double w, double h) => Positioned(
    top: 0,
    right: 0,
    child: AnimatedContainer(
      duration: Duration(milliseconds: leftWorking ? 720 : 0),
      width: w / 2 + 40 - (after == 1 ? 80 : 0),
      height: h,
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: animRight,
            builder: (_, __) => Positioned(
              top: h - (radius * animRight.value) / 2 - 120,
              left: 0,
              child: Container(
                width: 80 + (radius * animRight.value),
                height: 80 + (radius * animRight.value),
                decoration: BoxDecoration(
                  color: rightCircle,
                  borderRadius: BorderRadius.circular(
                    (40 +
                        (radius * animRight.value) / 2 * (1 - animRight.value)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _buildLeftLayout(double w, double h) => Positioned(
    top: 0,
    left: 0,
    child: AnimatedContainer(
      duration: Duration(milliseconds: leftWorking ? 720 : 0),
      width: w / 2 - 40 + (after == 1 ? 80 : 0),
      height: h,
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: animLeft,
            builder: (_, __) => Positioned(
              top: h - (radius * animLeft.value) / 2 - 120,
              right: 0,
              child: Container(
                width: 80 + (radius * animLeft.value),
                height: 80 + (radius * animLeft.value),
                decoration: BoxDecoration(
                  color: leftCircle,
                  borderRadius: BorderRadius.circular(
                    (40 + (radius * animLeft.value) / 2) * (1 - animLeft.value),
                  ),
                ),
                child: Center(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: leftWorking ? 860 : 0),
                    curve: Interval(0.2, 1.0, curve: Curves.linear),
                    width: after == 1 ? 80 : 0,
                    height: after == 1 ? 80 : 0,
                    decoration: BoxDecoration(
                      color: middleCircle,
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _buildMiddleButton(double h, double w) => Positioned(
    top: h - 120,
    left: w / 2 - 40,
    child: SizedBox(
      width: 80,
      height: 80,
      child: Center(
        child: AnimatedBuilder(
          animation: animMiddle,
          builder: (_, __) => IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: counter == 0
                  ? Color(0xff0044CF)
                  : counter == 1
                  ? Colors.black
                  : Colors.white,
              size: 24,
            ),
            onPressed: _nextPage,
          ),
        ),
      ),
    ),
  );

  Widget _buildOnboardingContent(double h, double w) => SizedBox(
    width: w,
    height: h * 0.75,
    child: SafeArea(
      child: Column(
        children: <Widget>[
          const Spacer(),
          SizedBox(
            width: w,
            height: w,
            child: Stack(
              children: List.generate(boards.length, (index) {
                return AnimatedPositioned(
                  duration: const Duration(milliseconds: 1700),
                  curve: swipe == index
                      ? const Interval(0.80, 1.0)
                      : const Interval(0.0, 0.25),
                  top: 0,
                  left: -w * (swipe - index),
                  child: BoardWidget(
                    lastIdx: swipe == 2,
                    boardModel: boards[index],
                  ),
                );
              }),
            ),
          ),
          const Spacer(),
        ],
      ),
    ),
  );
}
