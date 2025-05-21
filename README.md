# ReservaSmart

Após consultarmos as partes envolvidas no projeto, optamos por trabalhar com uma estrutura mais robusta e indicada para o projeto.

No backend, foi utilizado Laravel (Laravel 12 + Composer) e PHP 8.2.
No frontend, foi escolhido o framework REACT+Vue.


## Instruções para Instalação Local:
Para instalação local, crie um banco de dados em Postgres chamado "reservas".
Faça a importação do arquivo reservas.sql (ele vai criar as tabelas).


### BACKEND
O arquivo .env ja esta configurado para o banco de dados em postgres. 
Execute o comando `php artisan serve`
Ele vai iniciar o backend no endereço http://127.0.0.1:8000

### FRONTEND 
Após rodar o comando `npm install`, ele vai instalar os arquivos e dependências necessárias para o projeto funcionar.
Depois de instalado, rode o comando: `npm run dev` 
Ele vai iniciar o frontend no endereço http://localhost:5173 

# Implementações no Projeto:
- Inserido Modal para Criação, Deleção, Alteração de Reservas.
- Inserido botão para confirmação de Check In, e alterado status de checkin feito para a cor azul na Dashboard.
- Inserido botão para cancelamento de reservas, depois da reserva feita.
- Botão de procura por contato ou telefone.
- Dashboard com Informações sobre Reservas feitas, Valores arrecadados, Checkins Confirmados e Quantidade de sócios x não sócios.

  ![image](https://github.com/user-attachments/assets/a2cb62b7-5a9a-47c4-af66-6c6ae07362af)


## Lugar Reservado na Cor VERMELHA

![image](https://github.com/user-attachments/assets/d6a09c27-bdcb-42c1-b774-9aca099750c5)


## Botão no Modal para Fazer Check-In, Cancelar e Salvar a RESERVA

![image](https://github.com/user-attachments/assets/35e78a7f-e099-4d9b-b1c8-6ff9cc0bfb69)


## Status de Lugar com Check-In Feito 

![image](https://github.com/user-attachments/assets/af11755b-ea49-4888-87e9-9fa6a8062fde)


## Informações no Dashboard

![image](https://github.com/user-attachments/assets/34ac4468-d598-4190-8e61-e61f862c3dd9)

## Desenvolvedores/Contribuintes :octocat:
- Alessandro Costa Ferreira 
- Aurineide De Jesus Viana
- Bruno Yoshiyo Kodama Wadamori 
- Caio Gomes Rosati
- Cintia Mie Fukui 
- Daniel Vrena Alves
- Stephanie De Oliveira Souza 
- Willian Fabian Soares Dellatorre

