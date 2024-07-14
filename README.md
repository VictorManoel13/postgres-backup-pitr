### Verificar Tabela
Para verificar o conteúdo da tabela `users` no banco de dados `testdb`, utilize o seguinte comando:

```sh
docker-compose exec postgres psql -U user -d testdb -c "SELECT * FROM users;"
```

### Fazer Backup
Para fazer um backup do banco de dados `testdb`, utilize o seguinte comando:

```sh
docker-compose exec postgres pg_dump -U user -d testdb -F c -b -v -f /backups/testdb_backup.dump
```

### Apagar Dados
Para apagar dados da tabela `users` onde o nome é 'Alice', utilize o seguinte comando:

```sh
docker-compose exec postgres psql -U user -d testdb -c "DELETE FROM users WHERE name='Alice';"
```

### Restaurar Backup
Para restaurar o backup do banco de dados `testdb`, utilize o seguinte comando:

```sh
docker-compose exec postgres pg_restore -U user -d testdb -c -v /backups/testdb_backup.dump
```


# Documentação dos Arquivos e Ferramentas

## Arquivos Enviados

1. **docker-compose.yml**
2. **Dockerfile**
3. **init.sql**

## Explicação dos Arquivos

### 1. docker-compose.yml
O arquivo `docker-compose.yml` é utilizado para definir e gerenciar aplicações multi-contêiner no Docker. Ele permite definir a configuração de serviços, redes e volumes de uma aplicação em um único arquivo.

**Estrutura Geral:**
- **version:** Define a versão do Docker Compose que está sendo usada.
- **services:** Contém a definição de cada serviço (ou contêiner) que compõe a aplicação.

### 2. Dockerfile
O `Dockerfile` é um arquivo de texto com uma série de comandos que são executados automaticamente para criar uma imagem Docker. Ele define o ambiente e as etapas necessárias para criar um contêiner específico.

**Principais Instruções:**
- **FROM:** Especifica a imagem base.
- **COPY:** Copia arquivos e diretórios para dentro do contêiner.
- **RUN:** Executa comandos durante a construção da imagem.
- **CMD:** Define o comando padrão que será executado quando o contêiner iniciar.

### 3. init.sql
O arquivo `init.sql` é um script SQL que contém comandos para inicializar o banco de dados. Esse arquivo é geralmente utilizado para criar tabelas, inserir dados iniciais ou configurar parâmetros do banco de dados.

**Exemplo de Conteúdo:**
- **CREATE TABLE:** Comando para criar tabelas.
- **INSERT INTO:** Comando para inserir dados nas tabelas.

## Ferramentas Utilizadas

1. **Docker**
   - **Descrição:** Docker é uma plataforma que permite criar, testar e implementar aplicações rapidamente. Utiliza contêineres, que são ambientes isolados que contêm tudo o que é necessário para executar uma aplicação.
   - **Benefícios:** Portabilidade, consistência entre ambientes de desenvolvimento e produção, fácil gerenciamento de dependências.

2. **Docker Compose**
   - **Descrição:** Docker Compose é uma ferramenta para definir e gerenciar aplicações Docker multi-contêiner. Ele usa um arquivo YAML para configurar os serviços da aplicação.
   - **Benefícios:** Facilita o gerenciamento de aplicações complexas, permite definir redes e volumes de forma declarativa, facilita o desenvolvimento e teste de aplicações multi-contêiner.

## Comandos Úteis para Gerenciamento de Banco de Dados com Docker Compose

### Verificar Tabela
Para verificar o conteúdo da tabela `users` no banco de dados `testdb`, utilize o seguinte comando:

```sh
docker-compose exec postgres psql -U user -d testdb -c "SELECT * FROM users;"
