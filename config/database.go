package configuration

import (
	"database/sql"

	db "gorest.israel.parodi/db/queries"
)

var DB *sql.DB
var Queries *db.Queries
