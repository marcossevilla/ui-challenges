class Dishes {
  static final List<_Type> types = [
    _Type('Pizzas', 'assets/food_app/pizza.png'),
    _Type('Salad', 'assets/food_app/salad.png'),
    _Type('Shake', 'assets/food_app/shake.png'),
  ];

  static final List<_Dish> dishes = [
    _Dish(
      'Sea Platter',
      'Maratine Star Restaurant',
      'assets/food_app/dish-1',
      20.0,
      4.0,
      2.3,
      18,
    ),
    _Dish(
      'Chicken Wadges',
      'Rio cafe',
      'assets/food_app/dish-2',
      25.0,
      4.5,
      2.3,
      18,
    ),
  ];
}

class _Type {
  final String name;
  final String image;

  _Type(this.name, this.image);
}

class _Dish {
  final String name;
  final String place;
  final String image;
  final double price;
  final double rating;
  final double distance;
  final int deliveryTime;

  _Dish(
    this.name,
    this.place,
    this.image,
    this.price,
    this.rating,
    this.distance,
    this.deliveryTime,
  );
}
