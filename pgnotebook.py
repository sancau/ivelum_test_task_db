# coding=utf-8

import pandas as pd
import psycopg2


class PostgreSQL:
    """
    Wrapper around psycopg2 and pandas to simplify PostgreSQL workflow
    """
    def __init__(self, user='postgres', password=None, host='localhost', port='5432'):
        self.user = user
        self.password = password
        self.host = host
        self.port = port
        self.connection = self.__get_connection()

    def __get_connection(self, autocommit=True):
        conn = psycopg2.connect(user=self.user, password=self.password,
                                host=self.host, port=self.port)
        conn.autocommit = autocommit
        return conn

    @staticmethod
    def __rows_to_dict_list(cursor, lowercase=True):
        columns = [(i[0].lower() if lowercase else i[0]) for i in cursor.description]
        return [dict(zip(columns, row)) for row in cursor]

    def sql(self, query):
        cur = self.connection.cursor()
        cur.execute(query)
        try:
            return pd.DataFrame(self.__rows_to_dict_list(cur))
        except:
            return None

    def show_tables(self, schema='public'):
        return self.sql("""
        select tablename, schemaname
        from pg_catalog.pg_tables
        where schemaname = '{}'
        """.format(schema))
