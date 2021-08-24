from django.db import connections


class events:
    conn = ""

    def __init__(self):
        self.conn = connections['default']

    def getCreatedEvents(self, cmid):
        query = "select * from events where cmid_fk="+str(cmid)
        cursor=self.conn.cursor()
        cursor.execute(query)
        return cursor.fetchall()

    def updatepass(self,entry):
        query="update committee set pwd='"+entry['newpass']+"' where username= '"+entry['uname']+"' "
        cursor = self.conn.cursor()
        cursor.execute(query)
        return 1
