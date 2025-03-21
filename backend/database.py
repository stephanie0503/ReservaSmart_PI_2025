import sqlite3

DB_NAME = "reservas.db"

def connect_db():
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS reservas (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            telefone TEXT NOT NULL,
            mesa INTEGER NOT NULL,
            lugar INTEGER NOT NULL,
            aniversario DATE NOT NULL
        )
    ''')
    conn.commit()
    return conn

def close_db(conn):
    conn.close()    