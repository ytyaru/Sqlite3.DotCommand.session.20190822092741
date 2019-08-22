SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

sqlite3 :memory: \
"create table users(id integer primary key, name text);" \
".session open main changeset_0" \
"select * from users;"

sqlite3 :memory: \
"create table users(id integer primary key, name text);" \
".session open changeset_0 main" \
"select * from users;"

sqlite3 :memory: \
"create table users(id integer primary key, name text);" \
".session session_0 open changeset_0" \
"select * from users;"

sqlite3 :memory: \
"create table users(id integer primary key, name text);" \
".restore changeset_0" \
"select * from users;"

sqlite3 :memory: \
"create table users(id integer primary key, name text);" \
".read changeset_0" \
"select * from users;"

sqlite3 :memory: \
"create table users(id integer primary key, name text);" \
".import changeset_0 users" \
"select * from users;"

