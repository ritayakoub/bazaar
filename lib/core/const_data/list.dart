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
