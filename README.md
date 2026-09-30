# Artisan Coffee · Specialty Roasters Mobile App

<p align="center">
  <strong>An OLED-optimized, artisan coffee ordering mobile experience built with Flutter & Material 3.</strong><br />
  <em>Featuring fluid category switching, real-time roast searching, tactile card physics, and deep obsidian aesthetics.</em>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white" alt="Flutter 3.x" />
  <img src="https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white" alt="Dart 3.x" />
  <img src="https://img.shields.io/badge/Design-Dark_Mode_OLED-orange" alt="Dark Mode" />
  <img src="https://img.shields.io/badge/Platform-iOS_%7C_Android_%7C_Web-black" alt="Platforms" />
  <img src="https://img.shields.io/badge/License-MIT-green" alt="MIT" />
</p>

<p align="center">
  <a href="#visual-walkthrough">Visual Walkthrough</a> •
  <a href="#ui-ux-craftsmanship">UI/UX Craftsmanship</a> •
  <a href="#project-architecture">Project Architecture</a> •
  <a href="#getting-started">Getting Started</a> •
  <a href="#license">License</a>
</p>

---

## Visual Walkthrough

<div align="center">
  <table>
    <tr>
      <td align="center" width="33%">
        <strong>Curated Coffee Roasts</strong><br /><br />
        <img src="https://user-images.githubusercontent.com/53341343/163552340-1eb989c8-9388-4405-94c5-d0d2d2868386.jpeg" width="280" alt="Storefront View" />
      </td>
      <td align="center" width="33%">
        <strong>Artisan Pour & Ingredients</strong><br /><br />
        <img src="https://user-images.githubusercontent.com/53341343/163552770-634456ad-cbd9-4b67-8c99-e3098637b4a8.PNG" width="280" alt="Item Detail View" />
      </td>
      <td align="center" width="33%">
        <strong>Bag & Order Summary</strong><br /><br />
        <img src="https://user-images.githubusercontent.com/53341343/163552305-d49d8190-94c6-4e0a-a070-c31f3b6e8949.PNG" width="280" alt="Cart Selection View" />
      </td>
    </tr>
  </table>
</div>

---

## UI/UX Craftsmanship

* **OLED-Tuned Contrast:** Pure obsidian dark backgrounds (`#0C0F14`) accented by rich caramel copper (`#D17842`) and warm golden creams.
* **Interactive Roast Filters:** Smooth one-tap category navigation (Cappuccino, Espresso, Latte, Flat White, Mocha) with dynamic indicator markers.
* **Live Search Querying:** Instant filtering across coffee blends, origin notes, and dairy/plant-based milk preparations.
* **Tactile Micro-Feedback:** Floating contextual confirmation pills upon adding items to the ordering queue.
* **Bezel-Aware Responsive Layout:** Optimized padding and `SafeArea` boundaries tested across compact and Pro Max mobile viewports.

---

## Project Architecture

```
lib/
├── main.dart              # Application entry point & Material 3 Dark theme setup
├── screens/
│   └── homepage.dart      # Interactive catalog, search, category pills & banner
└── widgets/
    └── coffee_tile.dart   # Polished product card with rating chip & cart trigger
```

---

## Getting Started

### Prerequisites
* Flutter SDK (3.x or higher)
* Dart SDK (3.x or higher)

### Installation & Run

```bash
# Clone the repository
git clone https://github.com/Ghost-9/Coffee-App.git

# Enter project directory
cd Coffee-App

# Fetch dependencies
flutter pub get

# Run test suite
flutter test

# Launch on device or simulator
flutter run
```

---

## Design Credits & License

* Design concept reference by [Fahad Bin Omar (Dribbble)](https://dribbble.com/shots/15475209-Coffee-Shop-Mobile-Apps-Dark-Mode).
* Implemented and maintained with Flutter 3.x by [Mayank Batra](https://github.com/Ghost-9).
* Licensed under the [MIT License](LICENSE).
