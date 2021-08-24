
from django.db import connections

class Login:
    conn = ""

    def __init__(self):
        self.conn = connections['default']

    def registration(self, entries):
        query = "insert into company (coname,ssc,hsc,avg_ptr,live_kt,dead_kt) values(%s,%s,%s,%s,%s,%s)"
        arg = (entries['name'], entries['ssc'], entries['hsc'], entries['avg_ptr'], entries['live_kt'], entries['dead_kt'])
        cursor = self.conn.cursor()
        cursor.execute(query, arg)
        self.conn.commit()

    def gethistory(self):
        query = "select coname from company"
        cursor = self.conn.cursor()
        cursor.execute(query)
        self.conn.commit()
        reply = []
        for key in cursor.fetchall():
            reply.append(key[0])
        return reply

    def updatepwd(self,entry):
        query="update committee set pwd='"+entry['newpwd']+"' where username= '"+entry['uname']+"' "
        cursor = self.conn.cursor()
        cursor.execute(query)
        return 1

    def getstudlist(self,name):           #Generate the students list for given company name by criteria
        stud=[]
        print(name)
        query = "select ssc,hsc,avg_ptr,live_kt,dead_kt from company where coname='"+name+"'"  # get criteria from company
        print(query)
        cursor = self.conn.cursor()
        cursor.execute(query)
        self.conn.commit()
        key = cursor.fetchone()
        print(key)
        cssc=key[0]
        chsc=key[1]
        cavg=key[2]
        clive=key[3]
        cdead=key[4]

        query = "select rollno from student where year='BE'"       #get roll_no from students by year
        cursor = self.conn.cursor()
        cursor.execute(query)
        self.conn.commit()
        reply1 = []
        for key in cursor.fetchall():
            reply1.append(key[0])

        print(reply1)
        for roll in reply1:
            print("rollno:")
            print(roll)
            query3 = "select ssc,hsc,live_kt,dead_kt from student_academic where roll_no_fk='"+roll+"'"      #get other params from academic
            cursor = self.conn.cursor()
            cursor.execute(query3)
            print(query3)
            self.conn.commit()
            key=cursor.fetchone()
            ssc=key[0]
            hsc=key[1]
            live_kt=key[2]
            dead_kt=key[3]
            savg=0
            sum=0.0
            query4 = "select s1,s2,s3,s4,s5,s6 from student_academic where roll_no_fk='"+roll+"'"          #det sems from academic
            cursor = self.conn.cursor()
            cursor.execute(query4)
            self.conn.commit()
            for key in cursor.fetchone():
                print("key[0]")
                print(key)
                sum=sum+key
            savg=sum/6
            print("savg")
            print(savg)
            print(cavg)
            if ssc>cssc and hsc>chsc and live_kt<=clive and dead_kt<=cdead and savg>cavg:
               stud.append(roll)
            print("students:")
            print(stud)

        return stud


class Notice:
    conn = ""

    def __init__(self):
        self.conn = connections['default']

    def createNotice(self, title, desc):
        query = "insert into notice (title,description,date,time) values('" + title + "','" + desc + "','" "','" "')"
        cursor = self.conn.cursor()
        if cursor.execute(query):
            self.conn.commit()
            return cursor.lastrowid
        return -1

