verificar tabela

docker-compose exec postgres psql -U user -d testdb -c "SELECT * FROM users;"

fazer backup

docker-compose exec postgres pg_dump -U user -d testdb -F c -b -v -f /backups/testdb_backup.dump

apagar

docker-compose exec postgres psql -U user -d testdb -c "DELETE FROM users WHERE name='Alice';"

restaurar

docker-compose exec postgres pg_restore -U user -d testdb -c -v /backups/testdb_backup.dump
