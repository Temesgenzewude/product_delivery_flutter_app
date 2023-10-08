class Product {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductModel> _products;

  List<ProductModel> get products => _products;

  Product(
      {required totalSize,
      required typeId,
      required offset,
      required products}) {
    _totalSize = totalSize;
    _typeId = typeId;
    _offset = offset;
    _products = products;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = json['totalSize'];
    _typeId = json['typeId'];
    _offset = json['offset'];
    
    if (json['products'] != null) {
      _products = <ProductModel>[];

      (json['products']).forEach((product) {
        _products.add(ProductModel.fromJson(product));
      });
    }
  }
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['totalSize'] = _totalSize;
    data['typeId'] = _typeId;
    data['offset'] = _offset;

    // ignore: unnecessary_null_comparison
    if (_products != null) {
      data['products'] =
          _products.map((product) => product.toJson()).toList();
    }

    return data;
  }
}

class ProductModel { 
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  

  String? updatedAt;
  int? typeId;
  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stars,
    this.img,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.typeId,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    typeId = json['typeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['stars'] = stars;
    data['img'] = img;
    data['typeId'] = typeId;
    data['updatedAt'] = updatedAt;
    data['createdAt'] = createdAt;

    return data;
  }
}

