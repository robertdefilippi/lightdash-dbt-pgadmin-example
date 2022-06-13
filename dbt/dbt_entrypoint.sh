#!/bin/bash

dbt clean && dbt deps &&
dbt debug --profiles-dir . &&
dbt seed --profiles-dir . &&
dbt run --profiles-dir . --full-refresh &&
dbt test --profiles-dir . &&
dbt docs generate --profiles-dir . &&
dbt docs serve --port 8899 --profiles-dir .
