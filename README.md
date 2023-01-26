# ud-db-sql-bootcamp


## Postgres Setup Notes
1. Environment variables
    - We’ve touched briefly on the importance of `POSTGRES_PASSWORD` to Postgres. 
    - Without specifying this, Postgres can’t run effectively. But there are also other variables that influence container behavior:

- `POSTGRES_USER` – Specifies a user with superuser privileges and a database with the same name. Postgres uses the default user when this is empty.
- `POSTGRES_DB` – Specifies a name for your database or defaults to the POSTGRES_USER value when left blank.
- `POSTGRES_INITDB_ARGS` – Sends arguments to postgres_initdb and adds functionality
- `POSTGRES_INITDB_WALDIR` – Defines a specific directory for the Postgres transaction log. A transaction is an operation and usually describes a change to your database.
- `POSTGRES_HOST_AUTH_METHOD` – Controls the auth-method for host connections to all databases, users, and addresses
- `PGDATA` – Defines another default location or subdirectory for database files
These variables live within your plain text .env file. Ultimately, they determine how Postgres creates and connects databases. You can check out our GitHub Postgres Official Image documentation for more details on environment variables.

2. Docker secrets<br>
    While environment variables are useful, passing them between host and container doesn’t come without risk.<br>
    Docker secrets let you access and load those values from files already present in your container.<br>
    This prevents your environment variables from being intercepted in transit over a port connection.<br> 
    You can use the following command (and iterations of it) to leverage Docker secrets with Postgres:

    ```
    docker run --name some-postgres -e POSTGRES_PASSWORD_FILE=/run/secrets/postgres-passwd -d postgres
    ```
Note: Docker secrets are only compatible with certain environment variables. Reference our docs to learn more.

3. Initialization scripts
   Also called init scripts, these run any executable shell scripts or command-based .sql files once Postgres creates a postgres-data folder. This helps you perform any critical operations before your services are fully up and running. Conversely, Postgres will ignore these scripts if the postgres-data folder initializes.

4. Database configuration
   Your Postgres database application acts as a server, and it’s beneficial to control how it runs. Configuring your database not only determines how your Postgres container talks with other services, but also optimizes how Postgres runs and accesses data.

There are two ways you can handle database configurations with Postgres. You can either apply these configurations locally within a dedicated file or use the command line. The CLI uses an entrypoint script to pass any Docker commands to the Postgres server daemon for processing.

Note: Available configurations differ between Postgres versions. The configuration file directory also changes slightly while using an alpine variant of the Postgres Docker Official Image.


- I will try the following:
  ```
  docker run --name basics-postgres -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=root -p 5432:5432 -d postgres
  docker run --name basics-postgres -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=password -p 5432:5432 -d postgres
  ```