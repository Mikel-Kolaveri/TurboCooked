part of '../your_recipes.dart';

class _Item extends StatefulWidget {
  const _Item({
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
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  late bool _isFave;
  @override
  void initState() {
    _isFave = widget.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final paddH = 16; //ListView HPadding
    final width = MediaQuery.of(context).size.width / 2 - 8 - paddH * 2;

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

    Widget textBubble = Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: mc.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(widget.name, ms.pop12w400TextSec),
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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.imgPath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        Positioned(right: 8, top: 8, child: myCircleBox),
        Positioned(bottom: -8, width: width, child: textBubble),
      ],
    );
    return current;
  }
}
