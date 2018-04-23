#!/bin/bash
_create_migration() {
    cp scripts/users-table.up.sql resources/migrations/"$1"-users-table-table.up.sql
    cp scripts/users-table.down.sql resources/migrations/"$1"-users-table.down.sql
}


_create_migration $(date +"%Y%m%d%H%M%S")
