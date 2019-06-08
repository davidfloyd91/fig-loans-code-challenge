require 'sqlite3'
# docs: https://www.rubydoc.info/gems/sqlite3/1.3.11

DB = SQLite3::Database.new "first_database_ever.db"

# citizens have a username, (fake) password_digest and address
CREATE_CITIZENS = <<-SQL
  CREATE TABLE citizens (
    id INTEGER PRIMARY KEY,
    username TEXT,
    password_digest TEXT,
    address TEXT
  );
SQL

# messages have a sender_id (a citizen's id), a recipient_id (ditto), contents and a timestamp
CREATE_MESSAGES = <<-SQL
  CREATE TABLE messages (
    id INTEGER PRIMARY KEY,
    sender_id INTEGER,
    recipient_id INTEGER,
    contents TEXT,
    time_sent DATETIME DEFAULT CURRENT_TIMESTAMP
  );
SQL

# 3 citizens: id 1 is eligible, 2 is ineligible, 3 is ineligible
SEED_CITIZENS = [
  ['Jimbo', 'l0ls0$ecur3', '123 Jimbo Lane'],
  ['Homer', '1mimpr3s$edbyyrS3cur1ty', '666 Homer Boulevard'],
  ['Giuseppe', 'g00djo6h4$hin9', '000 Joey Parkway']
]

SEED_MESSAGES = [
  # citizen 1 sends 4 messages with 199 characters (eligible)
  [1, 2, 'ajsdoifaoibndoinaunsunfianbnrejanndfkjnsdkjnvjasnbdfk'],
  [1, 2, 'ajsdoifaoibndoinaunsunfianbnrejanndfkjnsdkjnvjasnbdfk'],
  [1, 2, 'ajsdoifaoibndoinaunsunfianbnrejanndfkjnsdkjnvjasnbdfk'],
  [1, 2, 'bndoinaunsunfianbnrejanndfkjnsdkjnvjasnb'],

  # citizen 2 sends 5 messages with 5 characters (ineligible)
  [2, 1, 'a'],
  [2, 1, 'b'],
  [2, 1, 'c'],
  [2, 1, 'd'],
  [2, 1, 'e'],

  # citizen 3 sends 1 message with 200 characters (ineligible)
  [3, 2, 'ajsdoifaoibndoinaunsunfianbnrejanndfkjnsdkjnvjasnbdfkajsdoifaoibndoinaunsunfianbnrejanndfkjnsdkjnvjasnbdfkajsdoifaoibndoinaunsunfianbnrejanndfkjnsdkjnvjasnbdfkbndoinaunsunfianbnrejanndfkjnsdkjnvjasnbd']
]

# drop tables
DB.execute('DROP TABLE citizens;')
DB.execute('DROP TABLE messages;')

# create tables
DB.execute(CREATE_CITIZENS)
DB.execute(CREATE_MESSAGES)

# create citizens
SEED_CITIZENS.each do |citizen|
  DB.execute 'INSERT INTO citizens (username, password_digest, address) VALUES (?, ?, ?)', citizen
end

# create messages
SEED_MESSAGES.each do |message|
  DB.execute 'INSERT INTO messages (sender_id, recipient_id, contents) VALUES (?, ?, ?)', message
end
