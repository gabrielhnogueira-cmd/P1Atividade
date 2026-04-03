# P1 - Projeto Flutter com Splash, Login, Cadastro e Home

## Integrantes
- Nome 1
- Nome 2
- Nome 3

## Descrição do projeto
Este projeto foi desenvolvido em Flutter com o objetivo de demonstrar navegação entre telas, uso de formulários, validação e organização arquitetural, utilizando dados mockados em memória para simular o cadastro e a autenticação de usuários.

O aplicativo possui as seguintes telas:
- Splash
- Login
- Cadastro
- Home

## Arquitetura adotada
O projeto foi organizado em pastas para separar melhor as responsabilidades da aplicação:

- `views`: telas da aplicação
- `viewmodels`: controle de estados, formulários e validações
- `models`: representação dos dados da aplicação
- `data`: armazenamento mockado em memória

Essa organização foi adotada para evitar concentrar toda a lógica na interface e deixar o projeto mais organizado e próximo do padrão trabalhado em aula.

## Estrutura de pastas
```bash
lib/
├── main.dart
├── app/
│   ├── models/
│   │   └── usuario_model.dart
│   ├── data/
│   │   └── usuario_mock_store.dart
│   ├── viewmodels/
│   │   ├── splash_viewmodel.dart
│   │   ├── login_viewmodel.dart
│   │   └── signup_viewmodel.dart
│   └── views/
│       ├── splash_page.dart
│       ├── login_page.dart
│       ├── signup_page.dart
│       └── home_page.dart
## Fluxo da aplicação
Splash → Login → Cadastro → Retorno ao Login → Autenticação correta → Home

## Demonstração do fluxo
O aplicativo inicia na SplashScreen e, após alguns segundos, navega para a tela de Login. Caso o usuário ainda não possua cadastro, ele pode acessar a tela de Cadastro, preencher os dados solicitados e salvar as informações em memória. Após o cadastro, o usuário retorna para a tela de Login, realiza a autenticação com os dados cadastrados e, em caso de sucesso, é direcionado para a tela Home, que contém um ícone e um texto centralizado.

## Como executar
```bash
flutter pub get
flutter run