import mysql.connector

try:
    conn = mysql.connector.connect(
        host="gateway01.ap-southeast-1.prod.aws.tidbcloud.com",
        port=4000,
        user="212XEoDUzm5eTcz.root",
        password="6XMhSTi7v4pYi5nn",
        database="Portofolio"
    )

    print("BERHASIL CONNECT!")

    cursor = conn.cursor()
    cursor.execute("SELECT DATABASE();")
    print(cursor.fetchone())

    conn.close()

except Exception as e:
    print(e)