#!/bin/bash
_create_migration() {
    cp scripts/base-table.up.sql resources/migrations/"$1"-"$2"-table-table.up.sql
    cp scripts/base-table.down.sql resources/migrations/"$1"-"$2"-table.down.sql
}

# $1: Resource plural name

_create_migration $(date +"%Y%m%d%H%M%S") $1
