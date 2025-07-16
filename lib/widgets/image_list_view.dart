 import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class ImageListView extends StatefulWidget {
  const ImageListView({super.key, required this.startIndex, required this.duration});
  final int startIndex ;
  final int duration;

  @override
  State<ImageListView> createState() => _ImageListViewState();
}
class _ImageListViewState extends State<ImageListView> {
  late ScrollController _scrollController;
@override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener((){ 
      if(_scrollController.position.atEdge) {
        _autoScroll();
      }
    });
      WidgetsBinding.instance.addPostFrameCallback((_){
      _autoScroll();
      }); 
  }
  _autoScroll(){
    final _currentscrollPosition = _scrollController.offset;

    final _scrollEndPosition = _scrollController.position.maxScrollExtent;

    scheduleMicrotask((){
      _scrollController.animateTo(
        _currentscrollPosition == _scrollEndPosition?0 : _scrollEndPosition
        , duration: Duration(seconds: widget.duration), curve: Curves.linear);
    }); 
  }
  @override  
  Widget build(BuildContext context) {
    return  Transform.rotate(
      angle: 1.95* pi,
      child: SizedBox(
        height: 115,
        child: ListView.builder(
          
          controller: _scrollController ,
          itemCount: 10,
          scrollDirection: Axis.horizontal ,
          itemBuilder: (BuildContext context, int index) { 
            return ImageTile(image:'assets/nfts/${widget.startIndex + index }.png' );
           },
          
        ) ,
      ),
    );
  }
}

class ImageTile extends StatelessWidget {
  const ImageTile({super.key, required this.image});
final String image;
  @override
  Widget build(BuildContext context) {
    return  Hero(
      tag: image, 
    child:Image.asset(
      image,
      height: 130,
    ) );
  }
}