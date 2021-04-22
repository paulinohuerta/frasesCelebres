# frasesCelebres
laravel 8 CRUD and eloquent relationships 

## Install and deploy
1. git clone https://github.com/paulinohuerta/frasesCelebres.git
2. cd frasesCelebres/
3. composer install
4. create a database for use data persistent data in our Laravel application
5. add database configuration parameters in the .env file
6. php artisan migrate
7. If you want you have data to populate the tables:    
  *psql -U paulino -d frasescelebres -f datos.sql* if your BD is postgres.
9. php artisan serve

### tests
http://localhost:8000/phrases      

http://localhost:8000/authors
