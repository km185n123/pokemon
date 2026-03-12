# 📱 Pokedex Flutter App

Aplicación móvil desarrollada en **Flutter** que consume la **PokeAPI**
para mostrar una Pokédex interactiva.\
El proyecto fue construido siguiendo principios de **Clean
Architecture**, con un enfoque **feature-first** y aplicando buenas
prácticas de **persistencia segura, manejo offline, testing y
arquitectura escalable**.

# Galería de Imágenes

## Imágenes pequeñas

| ![Image 1](https://github.com/user-attachments/assets/65c9e7b5-cc4c-4576-83d5-2f7ce8945385) | ![Image 2](https://github.com/user-attachments/assets/d9f0b361-f0a1-460b-8959-4d478004ca69) |
|---|---|
| ![Image 3](https://github.com/user-attachments/assets/3daa7f3f-00cb-49ec-981f-a7bfe84f4ba1) | ![Image 4](https://github.com/user-attachments/assets/bc67558a-eae7-493b-8499-ab917bbbb14b) |

## Captura principal

![Captura grande](https://github.com/user-attachments/assets/f1af330c-424c-48f1-ac09-245d975fa35a)



------------------------------------------------------------------------

# 🏗 Arquitectura

El proyecto sigue **Clean Architecture**, separando claramente
responsabilidades entre capas:

    lib/
     ├── core
     │   ├── database
     │   ├── network
     │   ├── error
     │   ├── base
     │   └── config
     │
     ├── features
     │   ├── landing
     │   ├── pokemon_detail
     │   ├── favorites
     │   ├── profile
     │   └── regions

## Capas

### Presentation

-   UI desarrollada con Flutter
-   Gestión de estado con **Bloc / Cubit**
-   Screens, Views y Widgets reutilizables

### Domain

-   Entities
-   Use Cases
-   Reglas de negocio puras

### Data

-   DTOs
-   Repositories
-   Data Sources (remote / local)
-   Mappers

------------------------------------------------------------------------



# 🌐 Consumo de API

La aplicación consume datos desde:

https://pokeapi.co

Se implementó:

-   Cliente HTTP con **Dio**
-   Manejo de errores
-   DTO → Entity mappers
-   Repositorios desacoplados

------------------------------------------------------------------------

# ⚙️ Funcionalidades principales

## Splash Screen

Al iniciar la aplicación se muestra un **Splash Screen animado**.

La animación fue creada con **Lordicon** y exportada como `.json` para
reproducirse usando **Lottie**.

------------------------------------------------------------------------

## Tutorial de bienvenida

El tutorial se muestra **solo la primera vez** que se abre la
aplicación.

Se controla mediante un boolean almacenado en:

    SharedPreferences

Si se borran los datos de la aplicación, el tutorial vuelve a mostrarse.

------------------------------------------------------------------------

## Pantalla principal (Pokedex)

Incluye:

-   Buscador
-   Filtros
-   Lista con scroll infinito
-   Cards de Pokémon
-   Menú de navegación inferior

Secciones:

-   Pokedex
-   Favoritos
-   Regiones
-   Perfil

------------------------------------------------------------------------

## Scroll infinito

Los Pokémon se cargan en bloques de:

    5 Pokémon por petición

Cada vez que el usuario llega al final del scroll se realiza una nueva
petición.

------------------------------------------------------------------------

## Manejo de conectividad

La app detecta:

-   pérdida de conexión
-   problemas del servicio

En esos casos se muestra una pantalla con:

-   mensaje de error
-   botón **Reintentar**

Si la conexión vuelve, la lista **se actualiza automáticamente**.

------------------------------------------------------------------------

## Modo offline

Desde **Perfil** se puede activar:

    Guardar datos offline

Si está activo:

-   los Pokémon descargados se guardan en la base de datos.

Si está desactivado:

-   no se almacenan.

------------------------------------------------------------------------

## Favoritos

Los Pokémon pueden marcarse como favoritos desde:

-   lista principal
-   detalle
-   pantalla de favoritos
-   deslizando la card

Los favoritos:

-   se guardan en base de datos
-   persisten entre sesiones
-   pueden eliminarse desde múltiples vistas

Si no existen favoritos se muestra un mensaje informativo.

------------------------------------------------------------------------

# 🧩 Estructura de UI

Las vistas se dividieron en:

    screens
    views
    widgets

Esto mejora:

-   organización
-   reutilización
-   mantenibilidad

------------------------------------------------------------------------

# 🧪 Testing

El proyecto incluye **tests unitarios** para:

### Data Layer

-   repositorios
-   mappers
-   datasources

### Presentation Layer

-   blocs
-   estados
-   eventos

Herramientas:

    mocktail
    bloc_test

------------------------------------------------------------------------

# ▶️ Cómo ejecutar el proyecto

## 1. Clonar repositorio

    git clone https://github.com/tu-repositorio/pokedex.git

## 2. Instalar dependencias

    flutter pub get

## 3. Ejecutar app

    flutter run

## 4. Ejecutar tests

    flutter test

    Nota La configuracion del Futter la puedes resolver con FVM 
    {
      "flutter": "3.41.4"
    }

------------------------------------------------------------------------

# 🧠 Decisiones técnicas

Principales decisiones:

-   Clean Architecture
-   Feature-first structure
-   Bloc para gestión de estado
-   Drift + SQLCipher para persistencia segura
-   Secure Storage para proteger claves
-   Either (fpdart) para manejo funcional de errores

------------------------------------------------------------------------

# 🚀 Posibles mejoras

-   tests de integración
-   cache inteligente
-   mejora de paginación
-   soporte offline completo
