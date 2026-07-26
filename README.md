# FAD Task
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/Ahmed-khedrovica/fad_task)

This is a Flutter application developed to demonstrate a user login feature. The app is built following Clean Architecture principles and integrates with the `dummyjson.com` API for authentication.

## Features

- **User Authentication**: A complete login flow with username and password.
- **State Management**: Utilizes `flutter_bloc` (Cubit) to manage UI states such as loading, success, and failure during the login process.
- **Responsive UI**: The layout is designed to be responsive across different screen sizes using `flutter_screenutil`.
- **API Integration**: Communicates with a remote API for login requests using `Dio` and `Retrofit`.
- **Input Validation**: Implements form validation to ensure user inputs are not empty.

## Architecture

The project adheres to Clean Architecture principles, organizing the code into three main layers for separation of concerns and improved maintainability.

- **Data Layer**: Responsible for handling data operations. It includes data models (`LoginRequest`, `LoginResponse`), and the repository implementation which fetches data from the API service.
- **Domain Layer**: Contains the core business logic of the application. It defines repository contracts (abstract classes) and use cases (`LoginUseCase`) that orchestrate the flow of data from the data layer to the UI.
- **UI Layer**: The presentation layer of the application. It consists of screens (`LoginScreen`), widgets, and Cubits (`LoginCubit`) for state management. It is responsible for rendering the UI and handling user interactions.

## Tech Stack & Dependencies

- **State Management**: `flutter_bloc`
- **Networking**: `dio`, `retrofit`
- **Dependency Injection**: `get_it`
- **JSON Serialization**: `json_serializable`, `json_annotation`
- **UI Responsiveness**: `flutter_screenutil`
- **Equality Comparison**: `equatable`
- **Code Generation**: `build_runner`

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

- Flutter SDK installed on your machine.
- An IDE like VS Code or Android Studio.

### Installation

1.  **Clone the repository**
    ```sh
    git clone https://github.com/ahmed-khedrovica/fad_task.git
    ```
2.  **Navigate to the project directory**
    ```sh
    cd fad_task
    ```
3.  **Install dependencies**
    ```sh
    flutter pub get
    ```
4.  **Run the code generator**
    This step is necessary to generate files for `retrofit` and `json_serializable`.
    ```sh
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
5.  **Run the application**
    ```sh
    flutter run
    ```

## Folder Structure

The project's `lib` directory is structured to support the clean architecture and feature-first approach.

```
lib/
├── core/
│   ├── di/               # Dependency Injection setup (GetIt)
│   ├── helpers/          # Utility functions and helpers
│   ├── networking/       # Dio and Retrofit setup for API calls
│   ├── theming/          # App-wide colors, fonts, and styles
│   └── widgets/          # Common reusable widgets
│
├── features/
│   └── login/
│       ├── data/         # Data models and repository implementation
│       ├── domain/       # Repository contracts and use cases
│       └── ui/           # Screens, Cubit, and widgets for the login feature
│
└── main.dart             # Application entry point
