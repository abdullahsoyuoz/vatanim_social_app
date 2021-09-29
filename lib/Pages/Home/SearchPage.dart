import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:vatanim_app/Data/FakeData.dart';
import 'package:vatanim_app/Utility/AssetPath.dart';
import 'package:vatanim_app/Utility/Utility.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: WithoutGlow(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
          title: Row(
            children: [
              Image.asset(
                iconPathNavSearchSelected,
                width: 20,
                height: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextField(
                    style: TextStyle(fontSize: 20),
                    controller: _searchController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Arama',
                      hintStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
          centerTitle: false,
        ),
        body: Container(
          width: getSize(context),
          height: MediaQuery.of(context).size.height,
          child: StaggeredGridView.countBuilder(
            staggeredTileBuilder: (index) => StaggeredTile.fit(1),
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            padding: EdgeInsets.only(bottom: 80, top: 3),
            itemCount: fakePostList.length,
            itemBuilder: (context, index) {
              var item = fakePostList[index];
              print(item.imageUrl);
              return ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  item.imageUrl,
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
