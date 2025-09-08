import 'package:bazaar2/core/const_data/app_image.dart';
import 'package:bazaar2/view/home/model/bazaar.dart';
import 'package:bazaar2/view/home/model/ordersmodel.dart';
import 'package:bazaar2/view/home/model/productmodel.dart';
import 'package:bazaar2/view/home/model/requestmodel.dart';
import 'package:bazaar2/view/home/model/stor.dart';
import 'package:bazaar2/view/home/model/usermodel.dart';

List<Categories> category = [
  Categories(categoryname: 'T-shirt'),
  Categories(categoryname: 'T-shirt'),
  Categories(categoryname: 'T-shirt'),
  Categories(categoryname: 'T-shirt'),
  Categories(categoryname: 'T-shirt')
];
List<UserModel> usermodel = [
  UserModel(
    name: "fadi",
    products: 2,
    imageuser: AppImages.user1,
  ),
  UserModel(
    name: "pieer",
    products: 3,
    imageuser: AppImages.user2,
  ),
  UserModel(
    name: "rita",
    products: 5,
    imageuser: AppImages.user3,
  ),
];
List<Requestmodel> request = [
  Requestmodel(
      name: "rita",
      date: "April 2",
      number: 1,
      image: AppImages.user1,
      typerequest: 'person'),
  Requestmodel(
      name: "fadi",
      date: "April 2",
      number: 2,
      image: AppImages.user2,
      typerequest: 'store'),
  Requestmodel(
      name: "fadi",
      date: "April 2",
      number: 2,
      image: AppImages.user2,
      typerequest: 'store'),
  Requestmodel(
      name: "mariamaria",
      date: "April 2",
      number: 2,
      image: AppImages.user2,
      typerequest: 'person'),
  Requestmodel(
      name: "rechaedre",
      date: "April 2",
      number: 3,
      image: AppImages.user3,
      typerequest: 'person')
];
List<Ordersmodel> orderItems = [
  Ordersmodel(
      number: 1,
      amount: 231.4,
      customer: "Fadi",
      date: "April 2",
      status: "Completed"),
  Ordersmodel(
      number: 2,
      amount: 122.4,
      customer: "John Doe",
      date: "Dec 3",
      status: "pending"),
  Ordersmodel(
      number: 3,
      amount: 54.4,
      customer: "Rechared",
      date: "Jan 3",
      status: "Completed"),
  Ordersmodel(
      number: 3,
      amount: 54.4,
      customer: "Rechared",
      date: "Jan 3",
      status: "Completed"),
  Ordersmodel(
      number: 4,
      amount: 2.123,
      customer: "Rechared",
      date: "Jan 3",
      status: "Completed"),
  Ordersmodel(
      number: 3,
      amount: 54.4,
      customer: "Rechared",
      date: "Jan 3",
      status: "Completed"),
  Ordersmodel(
      number: 3,
      amount: 54.4,
      customer: "Rechared",
      date: "Jan 3",
      status: "Completed"),
  Ordersmodel(
      number: 3,
      amount: 54.4,
      customer: "Rechared",
      date: "Jan 3",
      status: "Completed"),
];

List<Product> productCardItems = [
  Product(
    id: "product1",
    image: AppImages.productbag,
    status: 'DISCOUNT',
    price: 11,
    name: 'Women’s Bag',
    size: '',
    markerName: 'Revenue',
    category: 'Cosmetics',
    details:
        "Elevate your style with this iconic Louis Vuitton women's bag, a timeless piece blending sophistication and functionality. Crafted from the brand's signature Monogram Canvas or Epi leather, this bag embodies luxury and durability.",
    comments: [],
  ),
  Product(
    id: "product2",
    image: AppImages.productPhoto,
    status: 'DISCOUNT',
    price: 12,
    name: 'Women’s Shirt',
    size: 'L',
    markerName: 'Revenue',
    category: 'Pejama',
    details:
        "Chic and versatile, this lightweight blouse features a flattering V-neckline, flowy sleeves, and a delicate floral print. Perfect for casual or polished looks!",
    comments: [],
  ),
];
final List<Bazaar> bazaarCardItems = [
  Bazaar(
      id: "bazaar2",
      image: AppImages.bazaarimage2,
      name: 'New Year',
      details: 'New Year’s sales and many other things!!',
      firstDate: '25 Dec',
      lastDate: '30 Dec',
      status: '',
      reviews: [],
      products: [],
      description: ''),
  Bazaar(
      id: "bazaar2",
      image: AppImages.bazaarimage1,
      name: 'Christmas',
      details: 'Sale up to 70%!!',
      firstDate: '1 Oct',
      lastDate: '10 Oct',
      status: '',
      reviews: [],
      products: [],
      description: ''),
];
