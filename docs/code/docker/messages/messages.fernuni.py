from datetime import time
import time as t
import datetime
import mariadb
from flask import Flask, request

app = Flask(__name__)

mydb_maria = mariadb.Connection(
    host="localhost",
    port=3306,
    user="testuser",
    password="58tqxEJxqf123",
    database="messages"
)

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        message = request.form['message']
        if message != "" and 'script' not in message.lower():
            insertMessage(t.time(), message)

    messages = []

    mycursor = mydb_maria.cursor();
    mycursor.execute("select * from messagestorage")
    rows = mycursor.fetchall()
    for row in rows:
        messages.append(row)

    return """
        <h1>Welcome to My Website</h1>
        <p>Please enter your message:</p>
        <form action="/" method="post">
            <input type="text" name="message">
            <input type="submit" value="Submit">
        </form>
        {messages}
    """.format(messages='\n'.join([
        '<p>Message: {}, Timestamp: {}</p>'.format(m[1], m[0])
        for m in messages
    ]))


def insertMessage(timestamp, message):
    # Convert Unix timestamp to datetime object
    dt = datetime.datetime.fromtimestamp(timestamp)
    # Convert datetime object to MySQL/MariaDB datetime format
    dt_str = dt.strftime('%Y-%m-%d %H:%M:%S')
    mycursor = mydb_maria.cursor()
    sql = "INSERT INTO messagestorage (timestamp, message) VALUES (%s, %s)"
    val = (dt_str, message)
    mycursor.execute(sql, val)
    mydb_maria.commit()

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=7500, debug=True)
