SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

# changeset
sqlite3 :memory: \
".session open main session_0" \
"create table users(id integer primary key, name text);" \
"insert into users(name) values('Yamada');" \
".session changeset changeset_0"
cat changeset_0

# patchset
sqlite3 :memory: \
".session open main session_0" \
"create table users(id integer primary key, name text);" \
"insert into users(name) values('Yamada');" \
"update users set name='YaMaDa';" \
".session changeset patchset_0"
cat patchset_0

