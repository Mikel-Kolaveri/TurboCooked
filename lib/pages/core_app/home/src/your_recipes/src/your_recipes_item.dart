part of '../your_recipes.dart';

class RecipeItem extends StatefulWidget {
  const RecipeItem({
    super.key,
    required this.imgPath,
    required this.name,
    required this.rating,
    required this.duration,
    required this.isFavorite,
  });
  final String imgPath;
  final String name;
  final double rating;
  final int duration;
  final bool isFavorite;

  @override
  State<RecipeItem> createState() => _RecipeItemState();
}

class _RecipeItemState extends State<RecipeItem> {
  late bool _isFave;
  @override
  void initState() {
    _isFave = widget.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final paddH = 16; //ListView HPadding
    final mq = MediaQuery.of(context);
    final width = mq.size.width / 2 - 8 - paddH * 2;
    final height = mq.size.height / 3 - 32;

    Widget myCircleBox = MyCircleBox(
      padding: 10,
      color: mc.pinkMain,
      border: Border.all(color: Colors.white, width: 1),
      child: MySvg(
        height: 20,
        _isFave ? MyAssets.favoriteOn : MyAssets.favoriteOff,
      ),
    );

    myCircleBox = GestureDetector(
      onTap: () => setState(() => _isFave = !_isFave),
      child: myCircleBox,
    );

    const circular16 = Radius.circular(16);

    Widget textBubble = Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: mc.textPrime.opacityTo(0.85),
        borderRadius: BorderRadius.vertical(bottom: circular16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(widget.name, ms.pop12w400TextSec, lines: 2),
          const GapV(8),
          Row(
            children: [
              MyText(widget.rating.toString(), ms.pop12w400PinkMain),
              const GapH(4),
              MySvg(MyAssets.star),
              const GapH.spacer(4),
              MySvg(MyAssets.clock),
              const GapH(4),
              MyText('${widget.duration}min', ms.pop12w400PinkMain),
              //TODO: fix logic, add conversion to x hours x minutes
            ],
          ),
        ],
      ),
    );

    Widget current = Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: width,
          height: height,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(color: mc.textPrime.opacityTo(0.4)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: MyNetworkImage(widget.imgPath),
        ),
        Positioned(right: 8, top: 8, child: myCircleBox),
        Positioned(bottom: 0, width: width, child: textBubble),
      ],
    );
    return current;
  }
}
