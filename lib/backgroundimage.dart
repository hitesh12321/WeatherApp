class Bgi {
  String? iconCode;

  Bgi({this.iconCode});

  String getBackgroundImage(String iconCode) {
    switch (iconCode) {
      case '01d':
        return 'assets/clearsky.png';
      case '01n':
        return 'assets/clearsky.png';
      case '02d':
        return 'assets/cloudy.png';
      case '02n':
        return 'assets/cloudy.png';
      case '03d':
        return 'assets/cloudy.png';
      case '03n':
        return 'assets/nature.png';
      case '04d':
        return 'assets/cloudy.png';
      case '04n':
        return 'assets/cloudy.png';
      case '09d':
        return 'assets/rainy.png';
      case '09n':
        return 'assets/rainy.png';
      case '10d':
        return 'assets/rainy.png';
      case '10n':
        return 'assets/rainy.png';
      case '11d':
        return 'assets/thunder.png';
      case '11n':
        return 'assets/thunder.png';
      case '13d':
        return 'assets/foggy.png';
      case '13n':
        return 'assets/foggy.png';
      case '50d':
        return 'assets/nature.png';
      case '50n':
        return 'assets/nature.png';
      default:
        return 'assets/default.png';
    }
  }
}
