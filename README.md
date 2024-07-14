# Construção e Gerenciamento de Contêineres Docker

Este repositório contém os arquivos necessários para configurar e gerenciar contêineres Docker para sua aplicação. Para construir o container Docker é da seguinte maneira:

```sh
docker-compose up --build
```

# Testes para Backup
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



# Backup e Recuperação Point-in-Time (PITR) no PostgreSQL

## Backup no PostgreSQL

### O que é um Backup?
No contexto do PostgreSQL, um backup é o processo de criar uma cópia do banco de dados para que ele possa ser restaurado em caso de falha ou perda de dados. Existem várias maneiras de fazer backups no PostgreSQL, incluindo backups lógicos e físicos.

### Tipos de Backup no PostgreSQL

1. **Backup Lógico:**
   - **Descrição:** Envolve a extração dos comandos SQL necessários para recriar o banco de dados.
   - **Ferramentas:** `pg_dump` e `pg_dumpall`.
   - **Uso:** Ideal para migrações de banco de dados e backups em menor escala.

2. **Backup Físico:**
   - **Descrição:** Envolve a cópia direta dos arquivos de dados do PostgreSQL.
   - **Ferramentas:** `pg_basebackup`.
   - **Uso:** Mais adequado para backups completos de grandes bancos de dados e para implementar PITR.

### Importância do Backup
- **Recuperação de Dados:** Permite restaurar os dados em caso de perda ou corrupção.
- **Continuidade dos Negócios:** Garante que a operação do negócio possa continuar com mínima interrupção.
- **Compliance:** Atende às exigências de conformidade de diversas indústrias e regulamentos.

## Recuperação Point-in-Time (PITR) no PostgreSQL

### O que é PITR?
Recuperação Point-in-Time (PITR) no PostgreSQL é uma técnica que permite restaurar o banco de dados a um estado específico em um ponto no tempo anterior. Isso é feito usando uma combinação de um backup base e arquivos de log de transação (WAL - Write-Ahead Logging).

### Como Funciona?
1. **Backup Base:**
   - **Descrição:** Um snapshot completo do banco de dados em um momento específico.
   - **Ferramentas:** `pg_basebackup`.

2. **Logs de Transação (WAL):**
   - **Descrição:** Arquivos que registram todas as mudanças feitas no banco de dados após o backup base.
   - **Configuração:** Para habilitar PITR, o parâmetro `archive_mode` deve ser ativado e `archive_command` deve ser configurado para armazenar os arquivos WAL.

3. **Processo de Recuperação:**
   - **Passos:** 
     1. Restaurar o backup base.
     2. Aplicar os logs de transação até o ponto no tempo desejado.
   - **Ferramentas:** `pg_restore` e `pg_rewind`.

### Benefícios do PITR
- **Correção de Erros:** Permite retornar o banco de dados a um estado anterior a um erro específico.
- **Flexibilidade:** Oferece a capacidade de restaurar o banco de dados a qualquer ponto no tempo.
- **Minimização de Perdas de Dados:** Reduz a perda de dados, restaurando o banco de dados ao ponto exato antes de um incidente.





