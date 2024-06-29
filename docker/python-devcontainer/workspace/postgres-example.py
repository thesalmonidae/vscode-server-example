import psycopg

with psycopg.connect('host=postgres port=5432 dbname=postgres user=postgres password=postgres') as db_connection:
    with db_connection.cursor() as db_cursor:
        db_cursor.execute('''
                    CREATE TABLE cars (
                        manufacturer text,
                        model text)
                    ''')

        db_cursor.execute(
            'INSERT INTO cars (manufacturer, model) VALUES (%s, %s)',
            ('Mercedes-Benz', 'EQE 350 4Matic'))

        db_cursor.execute('SELECT * FROM cars')

        for record in db_cursor:
            print(record)

        db_connection.commit()
