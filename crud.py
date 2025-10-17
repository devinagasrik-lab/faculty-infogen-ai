from db_utils import get_db_conn

def add_faculty(data):
    conn = get_db_conn()
    cur = conn.cursor()
    sql = """INSERT INTO faculty (name, department, designation, qualification, experience, email, phone)
             VALUES (%s,%s,%s,%s,%s,%s,%s)"""
    cur.execute(sql, (data['name'], data['dept'], data['designation'], data['qualification'],
                      data['experience'], data['email'], data.get('phone')))
    conn.commit()
    cur.close(); conn.close()

def list_faculty():
    conn = get_db_conn()
    cur = conn.cursor(dictionary=True)
    cur.execute("SELECT * FROM faculty")
    rows = cur.fetchall()
    cur.close(); conn.close()
    return rows
