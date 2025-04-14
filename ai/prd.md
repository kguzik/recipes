# Dokument wymagań produktu (PRD) - Przepisy 2.0

## 1. Przegląd produktu
Aplikacja Przepisy 2.0 to responsywna platforma webowa, której głównym celem jest szybkie generowanie przepisów na podstawie dostępnych składników. Rozwiązanie skierowane jest do użytkowników, którzy chcą znaleźć inspirację do gotowania i jednocześnie zminimalizować marnowanie żywności. System przewiduje dwie główne ścieżki:
- Dla użytkowników niezalogowanych – możliwość szybkiego generowania przepisu na podstawie jednorazowego wprowadzenia listy składników.
- Dla użytkowników zalogowanych – dostęp do dodatkowych funkcjonalności, takich jak zarządzanie osobistą listą składników, generowanie przepisu na bazie zapisanej listy, automatyczne sugerowanie kilku wariantów oraz zapisywanie wygenerowanych przepisów.

Projekt będzie realizowany przy użyciu następującego stacku technologicznego:
- Frontend: Astro 5, React 19 (dla komponentów interaktywnych), TypeScript 5, Tailwind 4 oraz Shadcn/ui.
- Backend: Supabase (PostgreSQL, wbudowana autentykacja) jako rozwiązanie backendowe.
- AI: Komunikacja z modelami przez Openrouter.ai.
- CI/CD i Hosting: Github Actions oraz DigitalOcean z wykorzystaniem obrazu docker.

## 2. Problem użytkownika
Użytkownicy często mają trudności z wyborem przepisu, gdy dysponują ograniczonym zestawem składników. W rezultacie manualne przeglądanie przepisów zajmuje dużo czasu i nie zawsze kończy się znalezieniem odpowiedniej inspiracji. Problemy te prowadzą do:
- Braku pomysłów na szybki posiłek.
- Marnowania żywności przez niewykorzystanie dostępnych składników.
- Frustracji związanej z organizacją posiłków.

## 3. Wymagania funkcjonalne
• Dla użytkowników niezalogowanych:
  - Możliwość wprowadzenia listy składników poprzez prosty input z wyborem ilości porcji.
  - Generacja przepisu wyłącznie na podstawie jednorazowego inputu, z wyświetleniem wyniku w formie tekstowego opisu bez opcji zapisu.

• Dla użytkowników zalogowanych:
  - Rejestracja i logowanie (korzystając z gotowych rozwiązań, np. NextAuth.js w integracji z Supabase).
  - Możliwość tworzenia, edytowania (dodawanie, usuwanie, modyfikacja) oraz przechowywania spersonalizowanej listy składników.
  - Generacja przepisu zarówno na podstawie ręcznie wprowadzonych składników, jak i z zapisanej listy.
  - Automatyczne sugerowanie co najmniej trzech wariantów przepisu na podstawie zapisanej listy składników.
  - Opcja zapisywania wygenerowanych przepisów w koncie oraz przeglądania ich w dedykowanej sekcji profilu.

• Dodatkowe funkcjonalności:
  - Walidacja danych – system weryfikuje, czy wprowadzone składniki należą do kategorii produktów spożywczych.
  - Przechowywanie danych w bazie (konto użytkowników, listy składników, zapisane przepisy) z wykorzystaniem Supabase.
  - Generowanie przepisu odbywa się w formie tekstowego opisu, bez możliwości ręcznej modyfikacji przed zapisem.

## 4. Granice produktu
• W zakres MVP wchodzą:
  - Generacja przepisu na podstawie listy składników (z liczbą porcji) dla użytkowników niezalogowanych i zalogowanych.
  - System rejestracji i logowania zintegrowany z Supabase.
  - Zarządzanie listą posiadanych składników oraz zapisywanie wygenerowanych przepisów. Lista posiada możliwość dodania gramatury (w polskich miarach).
  - Prosty, responsywny interfejs użytkownika zgodny z rekomendowanym stackiem technologicznym.

• Nie wchodzi w zakres MVP:
  - Zaawansowane algorytmy rekomendacji (np. generacja przepisu uwzględniającego brakujące lub alternatywne składniki).
  - Integracja z zewnętrznymi API dostarczającymi przepisy lub szczegółowe informacje o składnikach.
  - Funkcjonalności społecznościowe (np. udostępnianie przepisów innym użytkownikom).
  - Aplikacja mobilna – na początek tylko wersja webowa.
  - Importowanie składników z zewnętrznych formatów (PDF, DOCX, itp.).
  - Obsługa zdjęć w generowanych przepisach (funkcjonalność planowana na przyszły etap).

• Niesprecyzowane kwestie:
  - Dokładny mechanizm walidacji składników – możliwa integracja z bazą produktów spożywczych lub zastosowanie ręcznych reguł.
  - Szczegółowe logi i metryki mierzące zaangażowanie użytkowników.

## 5. Historyjki użytkowników
- US-001  
  Tytuł: Generowanie przepisu dla niezalogowanych użytkowników  
  Opis: Jako niezalogowany użytkownik chcę wprowadzić listę składników (z podaniem liczby porcji) w prostym formularzu, aby otrzymać wygenerowany przepis bez możliwości jego zapisu.  
  Kryteria akceptacji:
  - Formularz umożliwia wpisanie składników oraz liczby porcji.
  - System generuje przepis na podstawie wprowadzonych danych.
  - Wygenerowany przepis wyświetlany jest w formie czytelnego tekstowego opisu.

- US-002  
  Tytuł: Rejestracja i logowanie użytkowników  
  Opis: Jako potencjalny użytkownik chcę móc zarejestrować się i zalogować, aby uzyskać dostęp do funkcjonalności zarządzania listą składników i zapisywania wygenerowanych przepisów.  
  Kryteria akceptacji:
  - Użytkownik może utworzyć konto przy użyciu prostego formularza rejestracyjnego.
  - Proces logowania wykorzystuje wbudowaną autentykację Supabase (np. za pośrednictwem NextAuth.js).
  - Po zalogowaniu użytkownik uzyskuje dostęp do dodatkowych funkcjonalności.

- US-003  
  Tytuł: Zarządzanie listą posiadanych składników  
  Opis: Jako zalogowany użytkownik chcę mieć możliwość dodawania, edytowania i usuwania składników na mojej liście, aby móc szybko generować przepisy na podstawie dostępnych produktów.  
  Kryteria akceptacji:
  - Użytkownik może dodawać składniki z określeniem ilości (w gramach).
  - Użytkownik może edytować i usuwać istniejące składniki.
  - Lista składników jest zapisywana w bazie danych i dostępna przy każdym logowaniu.

- US-004  
  Tytuł: Generowanie przepisu dla zalogowanych użytkowników  
  Opis: Jako zalogowany użytkownik chcę mieć możliwość generowania przepisu zarówno na podstawie ręcznie wprowadzonych składników, jak i z zapisanej listy, aby uzyskać ostateczny, nieedytowalny przepis przed jego zapisem.  
  Kryteria akceptacji:
  - Użytkownik może wybrać między wprowadzeniem nowych składników a użyciem zapisanej listy.
  - System generuje przepis w formie tekstowego opisu.
  - Wygenerowany przepis jest finalny i nie można go modyfikować przed zapisem.

- US-005  
  Tytuł: Zapisywanie i przeglądanie wygenerowanych przepisów  
  Opis: Jako zalogowany użytkownik chcę móc zapisywać wygenerowane przepisy w swoim koncie, aby móc je później przeglądać i wykorzystywać przy kolejnych gotowaniach.  
  Kryteria akceptacji:
  - Opcja zapisu przepisu pojawia się po jego wygenerowaniu.
  - Zapisany przepis pojawia się w dedykowanej sekcji profilu użytkownika.
  - Użytkownik może przeglądać historię swoich zapisanych przepisów.

- US-006  
  Tytuł: Automatyczne sugerowanie przepisów na podstawie zapisanej listy składników  
  Opis: Jako zalogowany użytkownik chcę otrzymać co najmniej trzy warianty przepisu generowane automatycznie na bazie mojej zapisanej listy składników, aby móc wybrać najbardziej inspirującą opcję.  
  Kryteria akceptacji:
  - System automatycznie generuje minimum trzy warianty przepisu wykorzystując zapisane składniki.
  - Propozycje przepisu są prezentowane w czytelnym formacie umożliwiającym szybki wybór.

- US-007  
  Tytuł: Walidacja wprowadzanych składników  
  Opis: Jako użytkownik chcę, aby system walidował wprowadzane dane, upewniając się, że dotyczą one produktów spożywczych oraz że ilości są zgodne z polską gramaturą, co zapobiega błędom w generacji przepisu.  
  Kryteria akceptacji:
  - System weryfikuje, że wprowadzone składniki to produkty spożywcze.
  - Ilości są sprawdzane pod kątem zgodności z polskimi standardami.
  - W przypadku błędnych danych użytkownik otrzymuje odpowiedni komunikat i wskazówki poprawy.

## 6. Metryki sukcesu
• Co najmniej 75% użytkowników akceptuje generowane przepisy jako wartościowe i inspirujące.  
• Użytkownicy zalogowani regularnie korzystają z funkcji zapisywania przepisów oraz zarządzania listą składników.  
• Wysoka częstotliwość generowania i zapisywania przepisów przez zalogowanych użytkowników (mierzone np. liczbą wizyt i zapisów).  
• Zaangażowanie użytkowników wzrasta, co można monitorować przez liczbę wizyt, interakcje z formularzami oraz korzystanie z opcji automatycznych sugestii przepisów.
