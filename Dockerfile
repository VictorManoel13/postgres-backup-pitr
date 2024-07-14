# Utilizar a imagem oficial do PostgreSQL
FROM postgres:13

# Variáveis de ambiente para inicializar o banco de dados
ENV POSTGRES_USER user
ENV POSTGRES_PASSWORD password
ENV POSTGRES_DB testdb

# Adicionar scripts de inicialização
COPY init.sql /docker-entrypoint-initdb.d/

# Expor a porta do PostgreSQL
EXPOSE 5432