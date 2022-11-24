# WOONGZZ0110 SYSBENCH

## Run by script
- RUN COMMAND

```
docker run --name sysbench -v YOUR_DIR:/woongzz0110/sysbench/src/run woongzz0110/sysbench:latest
```


- YOUR_DIR/sample.sh
```
# Setting
export PGPASSWORD=postgres
SB_CMD="sysbench --db-driver=pgsql --pgsql-host=pg-15-1-0-ha-pgpool.target-db.svc.cluster.local --pgsql-port=5432 --pgsql-user=postgres --pgsql-password=postgres"
PSQL_CMD="psql -h pg-15-1-0-ha-pgpool.target-db.svc.cluster.local -d postgres -U postgres -c "

# Cleanup before running
$PSQL_CMD "CREATE DATABASE SBTEST;"
$SB_CMD /woongzz0110/sysbench/lua/oltp_read_write.lua cleanup

# Grant privileges for monitoring 
$PSQL_CMD "GRANT ALL PRIVILEGES ON DATABASE SBTEST TO postgres;"

# Run
$SB_CMD /woongzz0110/sysbench/lua/oltp_read_write.lua prepare
$SB_CMD --time=2592000 --threads=10 /woongzz0110/sysbench/lua/oltp_read_write.lua run
$SB_CMD /woongzz0110/sysbench/lua/oltp_read_write.lua cleanup
```

## Lua
- All lua files are located in `/woongzz0110/sysbench/lua` directory in the container.