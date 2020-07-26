import 'package:flutter/material.dart';
import 'package:flutter_stock/models/Product.dart';
import 'package:flutter_stock/services/rest_api.dart';
import 'package:google_fonts/google_fonts.dart';

class StockScreen extends StatefulWidget {
  StockScreen({Key key}) : super(key: key);

  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  // init API
  CallAPI httpClient;

  // init Context
  BuildContext ctx;

  @override
  void initState() {
    super.initState();
    httpClient = CallAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // disabled arrow let
        title: Text(
          "รายการสินค้าทั้งหมด",
          style: GoogleFonts.kanit(),
        ),
        actions: <Widget>[
          InkWell(
            onTap: _onAddProduct,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.add),
            ),
          ),
          InkWell(
            onTap: _onRefreshProduct,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.refresh),
            ),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: httpClient.listProduct(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Server Internal Error"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<Product> products = snapshot.data;
              return buildListView(products);
            } else {
              return Center(
                child: loadingWidget(),
              );
            }
          },
        ),
      ),
    );
  }

  // BuildListView
  Widget buildListView(List<Product> products) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          Product product = products[index];
          return Card(
            child: InkWell(
              onTap: _onCardTab,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          // height: 200.0,
                          child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Image.network(product.productImage)),
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(product.productName,
                                style: TextStyle(fontSize: 20.0),
                                overflow: TextOverflow.ellipsis),
                            Text('price: ' + product.productPrice + ' THB',
                                style: TextStyle(
                                    color: Colors.red, fontSize: 12.0),
                                overflow: TextOverflow.ellipsis),
                            Text('Instock: ' + product.productQty.toString(),
                                style: TextStyle(color: Colors.green),
                                overflow: TextOverflow.ellipsis),
                            Text('updated: ' + product.updatedAt.toString(),
                                style: TextStyle(
                                    color: Colors.purple, fontSize: 12.0),
                                overflow: TextOverflow.ellipsis)
                          ],
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton.icon(
                            onPressed: _onEditProduct,
                            label: Text(
                              "EDIT",
                              style: TextStyle(color: Colors.blue),
                            ),
                            icon: Icon(
                              Icons.edit,
                              color: Colors.blue,
                            )),
                        FlatButton.icon(
                            onPressed: _onDeleteProduct,
                            label: Text("DELETE",
                                style: TextStyle(color: Colors.red)),
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _onAddProduct() {
    print('add Product...');
    Navigator.pushNamed(context, '/addProduct');
  }

  void _onRefreshProduct() {
    print('refresh Product...');
  }

  void _onCardTab() {
    print('card Tab...');
  }

  void _onEditProduct() {
    print('edit Product...');
  }

  void _onDeleteProduct() {
    print('delete Product...');
  }

  // Loading
  Widget loadingWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 20.0),
            Text("กำลังโหลดสินค้า...")
          ],
        ),
      ),
    );
  }
}
