from django.db import connections


# from Constants.const import constant


class ForgotPassword:
    conn = ""

    def __init__(self):
        self.conn = connections['default']

    def updatePassword(self, email, passw):
        query = "update student set pwd='" + passw + "' where email= '" + email + "'"
        cursor = self.conn.cursor()
        cursor.execute(query)
        return cursor.rowcount


class Login:
    conn = ""

    def __init__(self):
        self.conn = connections['default']

    def registration(self, entries):
        query = "insert into student (email,pwd,rollno) values(%s,%s,%s)"
        query1 = "insert into student_academic (roll_no_fk) values('"+entries['rollno']+"')"
        query2 = "insert into offer_letter (roll_no_fk) values('" + entries['rollno'] + "')"
        arg = (entries['email'], entries['pwd'], entries['rollno'])
        cursor = self.conn.cursor()
        cursor.execute(query, arg)
        cursor.execute(query1)
        cursor.execute(query2)
        self.conn.commit()

    def auth_uname(self, username):
        query = "select * from student where rollno='" + username + "'"
        cursor = self.conn.cursor()
        cursor.execute(query)
        check = cursor.fetchone()
        print(check)
        if check:
            return 0
        else:
            return 1

    def checkStudent(self, uname, upass, request):
        query = "SELECT rollno,year,branch FROM `student` where rollno='{}' and pwd='{}'".format(uname, upass)
        cursor = self.conn.cursor()
        print(query)
        if cursor.execute(query):
            res = cursor.fetchone()
            request.session['rollno'] = res[0]
            request.session['year'] = res[1] + "-" + res[2]
            return True
        return False

    def checkOther(self, uname, upass, request):
        query = "SELECT cmid FROM `committee` where username='{}' and pwd='{}'".format(uname, upass)
        cursor = self.conn.cursor()
        print(query)
        if cursor.execute(query):
            res = cursor.fetchone()
            request.session['cmid_fk'] = res[0]
            return True
        return False
