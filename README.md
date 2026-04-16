🎬 Maltflix

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

## 🛠️ Tecnologias

- **Flutter 3.41.6**
- **Dart**

### 📦 Principais dependências

- **flutter_bloc** — gerenciamento de estado (Cubit)
- **dio** — client HTTP para consumo da API
- **go_router** — navegação declarativa
- **get_it** — injeção de dependências (Service Locator)
- **flutter_dotenv** — gerenciamento de variáveis de ambiente
- **infinite_scroll_pagination** — paginação de listas
- **cached_network_image** — cache e carregamento de imagens
- **shimmer** — efeito de loading
- **animated_text_kit** — animações de texto
- **flutter_svg** — suporte a SVG
- **curl_logger_dio_interceptor** — logging das requisições HTTP

### 🎨 UI & UX

- Material Design
- Layout inspirado na Netflix
- Animações e microinterações

## ▶️ Como executar

```bash
# instalar dependências
flutter pub get

# rodar o projeto
flutter run
```

<div align="center">
  <img src="https://github.com/user-attachments/assets/f8bcfd33-dee1-4745-aaeb-bf6ed455a995" width="250"/>
  <img src="https://github.com/user-attachments/assets/82e08dc9-40ef-4263-ab35-9c4cda7f73dd" width="250"/>
  <img src="https://github.com/user-attachments/assets/940ac71d-d5f3-48d3-b696-3f58b28b26f4" width="250"/>
</div>


