# 🍃 Flutter Weather App

A dynamic and visually appealing weather application built with Flutter that provides real-time weather data for any location in the world. The app features a clean user interface where the background image changes dynamically to reflect the current weather conditions.

## ✨ Features

  * **Real-time Weather Data**: Fetches and displays current temperature, weather conditions (e.g., "moderate rain"), and city name from the OpenWeatherMap API.
  * **Dynamic Backgrounds**: The app's background image changes based on the current weather, providing a visually intuitive experience (e.g., a rainy background for rainy weather).
  * **Weather Icons**: Displays official weather icons from the API corresponding to the current conditions.
  * **Location Search**: Allows users to enter any city name in a text field to get its latest weather information.
  * **Clean Architecture**: The project is structured with a clear separation of concerns:
      * **UI (`main.dart`)**: Manages the application's state and user interface.
      * **Data Service (`data_services.dart`)**: Handles all API communication with the OpenWeatherMap service.
      * **Models (`modals.dart`)**: Provides type-safe Dart classes for parsing the JSON API response.
      * **UI Logic (`backgroundimage.dart`)**: Contains the logic for selecting the appropriate background image based on weather data.

## 🛠️ How It Works

1.  The user enters a city name and taps the "SEARCH" button.
2.  The `DataServices` class sends an HTTP GET request to the OpenWeatherMap API with the specified location.
3.  The app receives a JSON response, which is then parsed into strongly-typed Dart objects using the models defined in `modals.dart`.
4.  The UI updates its state with the new weather data, displaying the temperature, description, and an icon.
5.  Simultaneously, the weather icon code is used by the `Bgi` class to select and display a relevant background image from the local assets.

## 🚀 Getting Started

To run this project, you'll need to get your own API key from [OpenWeatherMap](https://openweathermap.org/api).

1.  **Clone the repository:**
    ```bash
    git clone <your-repository-url>
    ```
2.  **Add your API Key:**
    Open the `lib/data_services.dart` file and replace the placeholder with your own API key:
    ```dart
    final String _apiKey = "YOUR_API_KEY_HERE";
    ```
3.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
4.  **Run the app:**
    ```bash
    flutter run
    ```
