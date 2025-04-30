Após consultarmos as partes envolvidas no projeto , optamos por trabalhar com uma estrutura mais robusta e indicada para o projeto.
No backend , foi alterado de Python para Laravel , utilizado Laravel 12 + Composer , e PHP 8.2 .
No frontend , foi escolhido o framework Vite+Vue .

Para instalação local , crie um banco de dados em Postgres chamdado "reservas".
Faça a importação do arquivo reservas.sql ( ele vai criar as tabelas ).


BACKEND :

 O arquivo .env ja esta configurado para o banco de dados em postgres. 
Execute o comando php artisan serve 
Ele vai iniciar o backend no endereço http://127.0.0.1:8000

FRONTEND :

Após rodar o comando npm install  , ele vai instalar os arquivos e dependencias necessários para o projeto funcionar.
Depois de instalado , rode o comando :
npm run dev 
Ele vai iniciar o frontend no endereço http://localhost:5173 

Mudanças em relação ao projeto antigo :
- Inserido Modal para Criação , Deleção , Alteração de reservas .
- Inserido botão para confirmação de Check In , e alterado status de checkin feito para a cor azul na Dashboard.
- Inserido botão para cancelamento de reservas , depois da reserva feita.
- Botão de procura por contato ou telefone .
- Dashboard com Informações sobre Reservas feitas , Valores arrecadados , Checkins Confirmados e Quantidade de sócios x não sócios.


  ![image](https://github.com/user-attachments/assets/a2cb62b7-5a9a-47c4-af66-6c6ae07362af)

  

LUGAR RESERVADO NA COR VERMELHA

![image](https://github.com/user-attachments/assets/d6a09c27-bdcb-42c1-b774-9aca099750c5)


BOTÃO NO MODAL PARA FAZER CHECKIN , CANCELAR RESERVA , E SALVRA RESERVA

![image](https://github.com/user-attachments/assets/35e78a7f-e099-4d9b-b1c8-6ff9cc0bfb69)



STATUS DE LUGAR COM CHECKIN FEITO

![image](https://github.com/user-attachments/assets/af11755b-ea49-4888-87e9-9fa6a8062fde)


INFORMAÇÕES NA DASHBOARD


![image](https://github.com/user-attachments/assets/34ac4468-d598-4190-8e61-e61f862c3dd9)










