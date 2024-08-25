import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {

  static const String name ='infiniti_scroll_screen';
  
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imagesIDs = [1,2,3,4,5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent){
        //Load next page
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async{
    if(isLoading) return;
    setState(() => isLoading = true);

    await Future.delayed(const Duration(seconds: 2));

    if(!isMounted) return;
    setState(() {
      addFiveImage();
      isLoading = false;
    });
    moveScrollToBottom();
  }

  void addFiveImage(){
    final lastId = imagesIDs.last;
    imagesIDs.addAll(
      [1,2,3,4,5].map((e) => lastId + e)
    );
  }

  Future<void> onRefresh() async{
    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 3));
    if(!isMounted) return;
    setState(() {
      isLoading = false;
      final lastID = imagesIDs.last;
      imagesIDs
        ..clear()
        ..add(lastID + 1);
      addFiveImage();
    });
  }

  void moveScrollToBottom() {
    final position = scrollController.position;
    if(position.pixels + 100 <= position.maxScrollExtent) return;

    scrollController.animateTo(
      position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          edgeOffset: 10,
          strokeWidth: 2,
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIDs.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                placeholder: const AssetImage('assets/Images/jar-loading.gif'),
                image: NetworkImage('https://picsum.photos/id/${imagesIDs[index]}/500/300')
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.pop,
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
      bottomSheet: isLoading ? const _Loading() : const SizedBox(),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Cargando...'),
          SizedBox(width: 20),
          SizedBox(
            height: 10,
            child: CircularProgressIndicator(
              backgroundColor: Colors.black12,
              strokeWidth: 2,
            ),
          )
        ],
      ),
    );
  }
}