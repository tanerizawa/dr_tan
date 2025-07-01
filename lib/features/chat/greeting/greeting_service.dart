class GreetingService {
  static String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return "Selamat pagi!";
    } else if (hour < 18) {
      return "Selamat siang!";
    } else {
      return "Selamat malam!";
    }
  }
}
