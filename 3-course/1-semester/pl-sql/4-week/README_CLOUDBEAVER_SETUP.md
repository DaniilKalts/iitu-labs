# Oracle PL/SQL + CloudBeaver

Requires Docker with Docker Compose.

## Start the services

```bash
docker compose up -d
```

The first start may take several minutes. Check the container status:

```bash
docker compose ps
```

Wait until the Oracle container is marked as `healthy`.

## Configure CloudBeaver

Open [CloudBeaver](http://localhost:8978).

On the first visit, complete **Initial Server Configuration**:

| Field | Value |
|---|---|
| Server Name | `PL/SQL Lab` |
| Allowed Server URLs | Leave empty |
| Session lifetime | Default |
| Force HTTPS | Off |
| Private connections | On |
| Resource Manager | Off |
| Anonymous authentication | Off |
| Local authentication | On |
| Administrator credentials | Create your own |

The CloudBeaver administrator account is separate from Oracle. Remember these credentials because the password cannot be recovered automatically.

Leave the embedded database drivers disabled. For this local setup, saving credentials for your own connections is acceptable.

Click **Save**.

## Create an Oracle connection

1. Open the main CloudBeaver workspace.
2. Click the **`+`** button in the top-left corner.
3. Select **Oracle**.
4. Select **Manual** configuration.
5. Enter the following values:

| Setting | Value |
|---|---|
| Host | `oracle` |
| Port | `1521` |
| Service type | `Service name` |
| Service name | `FREEPDB1` |
| Username | `daniilkalts` |
| Password | `Qwerty1234!` |
| Connection name | `PL/SQL Oracle` |

Use `oracle` as the host because CloudBeaver and Oracle run in the same Docker Compose network. Do not use `localhost`.

Click **Test Connection**. If the test succeeds, click **Create**.

You can now use the SQL Editor to run SQL and PL/SQL queries.

## Stop the services

Stop the containers while keeping all database data:

```bash
docker compose down
```

Start them again later with:

```bash
docker compose up -d
```
