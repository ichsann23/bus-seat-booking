# Bus Seat Booking App 🚌

Flutter application for booking bus seats with Regular and Express class options.

**Technical Test Submission** for Flutter Developer Position at PT Timedoor Indonesia.

---

## 📱 APK Download

**[Download APK Here](https://drive.google.com/uc?export=download&id=1_ru-nDx4kwxBN4R6B_sc1thu1EZdvYv0)**

Alternative link: [View on Google Drive](https://drive.google.com/file/d/1_ru-nDx4kwxBN4R6B_sc1thu1EZdvYv0/view?usp=sharing)

---

## ✨ Features

### Core Features

- ✅ **Bus Type Selection**: Radio button to choose between Regular and Express class
- ✅ **Dynamic Seat Layout**:
  - Regular Class: 20 seats (10 left + 10 right) with 1:1 square layout
  - Express Class: 12 seats (6 left + 6 right) with 2:1 rectangle layout
- ✅ **Seat Selection**: Tap to select/unselect seats with visual highlighting
- ✅ **Live Price Calculation**:
  - Regular: Rp 85.000 per seat
  - Express: Rp 150.000 per seat
- ✅ **No Selection Limit**: Book all available seats if needed

### Bonus Features

- ✅ **Confirm Booking**: Selected seats become permanently unavailable
- ✅ **Local Storage**: Seat availability persisted using SharedPreferences
- ✅ **Auto-Reset Rule**: Seats reset automatically when ALL seats for a bus type are fully booked
- ✅ **Independent Bus Types**: Regular and Express have separate availability tracking
- ✅ **Booking History**: View all past bookings with filters (All, Today, This Week)
- ✅ **Revenue Tracking**: Display total revenue from all bookings

---

## 🛠️ Tech Stack

- **Framework**: Flutter 3.27.0
- **State Management**: Riverpod (riverpod_annotation)
- **Local Storage**: SharedPreferences
- **Date Formatting**: intl package
- **Architecture**: Clean Architecture with feature-based structure

---

## 🚀 How to Run

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)

### Installation

1. Clone the repository:

```bash
git clone https://github.com/ichsann23/bus-seat-booking.git
cd bus-seat-booking
```

2. Install dependencies:

```bash
flutter pub get
```

3. Generate code (for riverpod_annotation):

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Run the app:

```bash
flutter run
```

### Build APK

```bash
flutter build apk --release
```

APK will be available at: `build/app/outputs/flutter-apk/app-release.apk`

---

## 📋 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.4.9
  riverpod_annotation: ^2.3.3
  shared_preferences: ^2.2.2
  intl: ^0.18.1

dev_dependencies:
  build_runner: ^2.4.7
  riverpod_generator: ^2.3.9
  flutter_lints: ^3.0.0
```

---

## 🎯 Key Functionalities

### 1. Seat Booking Flow

1. User selects bus type (Regular or Express)
2. Seat grid renders dynamically based on bus type
3. User taps seats to select/unselect
4. Total price updates in real-time
5. User confirms booking
6. Selected seats become permanently unavailable
7. Booking saved to history

### 2. Auto-Reset Logic

- When ALL 20 Regular seats are booked → Regular seats reset
- When ALL 12 Express seats are booked → Express seats reset
- Each bus type resets independently

### 3. Booking History

- Filter by: All, Today, This Week
- Display: Bus type, seats booked, total price, timestamp
- Calculate total revenue across all bookings

---

## 💾 Data Persistence

All data is stored locally using **SharedPreferences**:

- `regular_booked_seats`: Booked seats for Regular class
- `express_booked_seats`: Booked seats for Express class
- `booking_history`: List of all booking records

---

## 🎨 UI/UX Highlights

- Clean and modern interface
- Navy blue color scheme (#1E3A5F)
- Responsive seat grid layout
- Visual distinction between seat states (available, selected, booked)
- Smooth transitions and interactions
- User-friendly history filtering

---

## 🧪 Testing

The app has been tested for:

- ✅ Seat selection and deselection
- ✅ Price calculation accuracy
- ✅ Booking confirmation
- ✅ Local storage persistence
- ✅ Auto-reset functionality
- ✅ History filtering
- ✅ Bus type switching

---

## 📝 Notes

This project was developed as a technical assessment for the Flutter Developer position at PT Timedoor Indonesia.

**Submission Date**: January 2025

---

## 👨‍💻 Developer

**Muhammad Ichsan**

GitHub: [@ichsann23](https://github.com/ichsann23)

For any questions regarding this project, please contact through the recruitment process.

---

## 📄 License

This project is created for technical assessment purposes.

---

**Built with ❤️ using Flutter**
