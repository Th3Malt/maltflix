# 🎬 Maltflix

Aplicação Flutter desenvolvida como teste técnico com o objetivo de exibir um catálogo de filmes consumindo a API da The Movie Database (TMDB).

O projeto apresenta uma interface inspirada em plataformas de streaming, com foco em experiência do usuário, organização de código e boas práticas de desenvolvimento.

---

## 🚀 Funcionalidades

- 🎞️ Listagem de filmes **em cartaz (Now Playing)**
- 🔥 Listagem de filmes **populares**
- 🎠 Listas horizontais com paginação
- 🎬 Tela de detalhes com:
  - Imagem principal (backdrop)
  - Título
  - Avaliação dos usuários
  - Gêneros
  - Sinopse
- ⚡ Carregamento progressivo (dados iniciais → detalhes completos)
- 🎨 Interface inspirada na Netflix
- ✨ Animações e microinterações

---

### 🔹 Padrões utilizados

- **Cubit (Bloc)** para gerenciamento de estado  
- **Repository Pattern** para abstração de dados  
- **Service Locator** para injeção de dependências  
- Separação em camadas

---

## 🛠️ Tecnologias

- **Flutter 3.41.6**
- Dart
- HTTP Client
- Bloc / Cubit

---

## ▶️ Como executar

```bash
# instalar dependências
flutter pub get

# rodar o projeto
flutter run
```

<img width="1320" height="2868" alt="Simulator Screenshot - iPhone 16 Pro Max - 2026-04-16 at 09 41 23" src="https://github.com/user-attachments/assets/f8bcfd33-dee1-4745-aaeb-bf6ed455a995" />
![Uploading Simulator Screenshot - iPhone 16 Pro Max - 2026-04-16 at 09.40.46.png…]()
![Uploading Simulator Screenshot - iPhone 16 Pro Max - 2026-04-16 at 09.41.16.png…]()



