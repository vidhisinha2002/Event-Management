import random
import string
from django.core.mail import EmailMessage
from django.db import connections
from django.db.models.functions import datetime


class Event:
    conn = ""

    def __init__(self):
        self.conn = connections['default']

    def cleanData(self):
        dateT = datetime.datetime.today().strftime('%Y-%m-%d')
        query="select eid,ename  from events where STR_TO_DATE(date,'%Y-%m-%d') < STR_TO_DATE('"+dateT+"','%Y-%m-%d')"
        cursor=self.conn.cursor()
        cursor.execute(query)
        print(query)
        for event in cursor.fetchall():
            id=event[0]
            query1="delete from event_student where eid_fk="+str(id)
            cursor.execute(query1)
            query1="delete from events where eid="+str(id)
            cursor.execute(query1)

    def getAllEventApprovalRequest(self):
        self.cleanData()
        query = "select * from events where approve_status=0 ORDER BY event_timestamp ASC"
        cursor = self.conn.cursor()
        print(query)
        cursor.execute(query)
        return cursor.fetchall()

    def setEventStatus(self, status, eid):
        query = "update events set approve_status=" + str(status) + " where eid=" + str(eid)
        cursor = self.conn.cursor()
        if cursor.execute(query):
            print("done")
        else:
            print("not done")
    

class Notice:
    conn = ""

    def __init__(self):
        self.conn = connections['default']

    def createNotice(self, title, desc, date, time):
        query = "insert into notice (title,description,date,time) values('" + title + "','" + desc + "','" + date + "','" + time + "')"
        cursor = self.conn.cursor()
        if cursor.execute(query):
            self.conn.commit()
            return cursor.lastrowid
        return -1


class Committee:
    conn = ""

    def __init__(self):
        self.conn = connections['default']

    def createCommittee(self, email, id, cname):
        newPass = ''.join(random.SystemRandom().choice(string.ascii_uppercase + string.digits) for _ in range(20))
        query = "insert into committee (username,pwd,cname) values('" + id + "','" + newPass + "','" + cname + " ') "
        email = EmailMessage('New User Created ', 'here is your new password ' + newPass, to=[email])
        email.send()
        cursor = self.conn.cursor()
        if cursor.execute(query):
            self.conn.commit()
            return cursor.lastrowid
        return -1
