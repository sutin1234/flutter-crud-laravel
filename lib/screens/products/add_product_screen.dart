import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  AddProduct({Key key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final formKey = GlobalKey<FormState>();
  String productName,
      productDetail,
      prodcutPrice,
      productQty,
      productBarCode,
      productStatus,
      productImage,
      productCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("เพิ่มสินค้า"),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: _onSaved,
            label: Text(
              "save",
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _inputName(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _inputBarcode(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _inputDetail(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _inputCategory(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _inputPrice(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _inputQty(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _inputBarcode(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _inputStatus(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _inputImage(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputName() {
    return TextFormField(
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.add_shopping_cart),
        labelText: "ใส่ชื่อสินค้า",
        labelStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
        border: OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "กรุณากรอก ชื่อสินค้า";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        productName = value;
      },
    );
  }

  Widget _inputBarcode() {
    return TextFormField(
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.add_shopping_cart),
        labelText: "บาร์โค้ด",
        labelStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
        border: OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "กรุณากรอก บาร์โค้ด";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        productBarCode = value;
      },
    );
  }

  Widget _inputPrice() {
    return TextFormField(
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.attach_money),
        labelText: "ราคาสินค้า",
        labelStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
        border: OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "กรุณากรอก ราคา";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        prodcutPrice = value;
      },
    );
  }

  Widget _inputQty() {
    return TextFormField(
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.add_shopping_cart),
        labelText: "จำนวนสินค้า",
        labelStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
        border: OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "กรุณากรอก จำนวน";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        productQty = value;
      },
    );
  }

  Widget _inputImage() {
    return TextFormField(
      autofocus: false,
      initialValue:
          "https://www.apple.com/newsroom/images/product/mac/standard/Apple_16-inch-MacBook-Pro_111319_big.jpg.large.jpg",
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.add_shopping_cart),
        labelText: "ที่อยู่รูปสินค้า",
         labelStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
        border: OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "กรุณากรอก ที่อยู่รูป";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        productImage = value;
      },
    );
  }

  Widget _inputStatus() {
    return TextFormField(
      autofocus: false,
      initialValue: '1',
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.add_shopping_cart),
        labelText: "สถานะ",
         labelStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
        border: OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "กรุณากรอก สถานะ";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        productStatus = value;
      },
    );
  }

  Widget _inputCategory() {
    return TextFormField(
      autofocus: false,
      initialValue: 'Computer',
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.add_shopping_cart),
        labelText: "หมวดหมู่",
        labelStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
        border: OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "กรุณากรอก หมวดหมู่";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        productCategory = value;
      },
    );
  }

  Widget _inputDetail() {
    return TextFormField(
      // keyboardType: TextInputType.multiline,
      // maxLines: 2,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.book),
        labelText: "ใส่รายละเอียดสินค้า",
         labelStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
        border: OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "กรุณากรอก รายละเอียด";
        } else {
          return null;
        }
      },
       onSaved: (value) {
        productDetail = value;
      },
    );
  }

  void _onSaved() {
    print('onSaved');
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
    }
  }
}
