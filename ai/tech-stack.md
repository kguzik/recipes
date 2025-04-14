# Podsumowanie technologicznego stacka dla projektu "Przepisy 2.0"

Poniżej przedstawiony jest opis wykorzystanych technologii, zaprezentowany kolejno zgodnie z ich rolą w projekcie.

## 1. Frontend

### Astro 5
Astro umożliwia generowanie statycznych stron oraz optymalizację ładowania zasobów, co przyczynia się do szybkiego uruchomienia MVP.

### React 19
React wprowadza interaktywne komponenty, które nadają aplikacji dynamikę oraz umożliwiają płynną obsługę interfejsu użytkownika.

### TypeScript 5
Dzięki statycznemu typowaniu TypeScript poprawia jakość kodu, ułatwia wczesne wykrywanie błędów i przyspiesza rozwój produktu.

### Tailwind CSS 4
Tailwind pozwala na szybkie stylowanie interfejsu poprzez podejście utility-first, co umożliwia łatwe dostosowanie wyglądu aplikacji bez konieczności pisania dużej ilości niestandardowego CSS.

### Shadcn/ui
Biblioteka Shadcn/ui dostarcza gotowe komponenty, które integrują się z Tailwind CSS, ułatwiając budowanie spójnych i responsywnych interfejsów.

## 2. Backend

### Supabase
Supabase to rozwiązanie „backend-as-a-service” oparte na PostgreSQL. Oferuje wbudowaną autentykację, przechowywanie danych oraz gotowe mechanizmy backendowe, co pozwala na szybkie uruchomienie aplikacji oraz łatwe skalowanie w miarę wzrostu liczby użytkowników.

## 3. Integracja AI

### Openrouter.ai
Komunikacja z modelami AI odbywa się przez Openrouter.ai, co umożliwia implementację funkcjonalności generowania przepisów opartych na algorytmach sztucznej inteligencji bez potrzeby budowania własnych, skomplikowanych modeli.

## 4. CI/CD i Hosting

### GitHub Actions
GitHub Actions automatyzuje procesy testowania i wdrażania, co przyspiesza ciągłą integrację oraz dystrybucję aplikacji i pomaga w szybkiej iteracji rozwoju.

### DigitalOcean (Docker)
Hosting na DigitalOcean, wspierany przez Docker, umożliwia tworzenie spójnych środowisk produkcyjnych. Konteneryzacja pozwala łatwo replikować i skalować aplikację, co jest kluczowe przy dynamicznym wzroście użytkowników.
