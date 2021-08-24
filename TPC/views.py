from django.shortcuts import render
from django.db import connections
from django.core.mail import EmailMessage
import threading

# Create your views here.
from TPC.DbOperations import Login, Notice


def home(request):
    title = []
    desc = []
    td = {}
    query = "select title,description from notice"
    conn = connections['default']
    cursor = conn.cursor()
    cursor.execute(query)
    for t in cursor.fetchall():
        td[t[0]] = t[1]
        print("print")
        print(td[t[0]])
        print(t[0])
    return render(request, 'myapp/TPC.html', {'title': td})


def addcompany(request):
    return render(request, 'myapp/addcompany.html')


def history(request):
    login = Login()
    companies = login.gethistory()
    return render(request, 'myapp/history.html', {'companies': companies})

def changepwd(request):
    return render(request, 'myapp/changepwd.html')

def newpwd(request):
    D={}
    if request.method == 'POST':
        D['uname']=request.session['uname']
        D['newpwd'] = request.POST.get('newpwd', False)
        D['cpwd'] = request.POST.get('cpwd', False)
        login=Login()
        if login.updatepwd(D)==1:
            return render(request, 'myapp/changepwd.html',{'success': 'successfully updated your password!'})

def generatelist(request):
    studlist = []
    maillist = []
    studnames = []
    name = request.POST['cname']
    login = Login()
    studlist = login.getstudlist(name)
    print("studlist")
    print(studlist)
    desc = "The mail has been sent to all the eligible students.Kindly check the mail"
    notice = Notice()
    notice.createNotice(name, desc)
    for roll in studlist:
        query = "select name from student where rollno='" + roll + "'"
        conn = connections['default']
        cursor = conn.cursor()
        cursor.execute(query)
        for key in cursor.fetchone():
            studnames.append(key)

    for roll in studlist:
        query = "select email from student where rollno='" + roll + "'"
        conn = connections['default']
        cursor = conn.cursor()
        cursor.execute(query)
        for key in cursor.fetchone():
            maillist.append(key)
    thread1 = emailnotify(maillist)
    thread1.start()

    # here lies memories of tylor swifts
    query = "insert into events (cmid_fk,' TPC EVENT ','Company related Event',) "

    return render(request, 'myapp/generatelist.html', {'studlist': studnames})


def registercompany(request):
    Data = {}
    if request.method == 'POST':
        Data['name'] = request.POST.get('name', False)
        Data['ssc'] = request.POST.get('ssc', False)
        Data['hsc'] = request.POST.get('hsc', False)
        Data['avg_ptr'] = request.POST.get('avg_ptr', False)
        Data['live_kt'] = request.POST.get('live_kt', False)
        Data['dead_kt'] = request.POST.get('dead_kt', False)
        login = Login()
        login.registration(Data)
        return render(request, 'myapp/tpc.html')


class emailnotify(threading.Thread):
    maillist = ""

    def __init__(self, maillist):
        threading.Thread.__init__(self)
        self.maillist = maillist

    def run(self):
        for student in self.maillist:
            print("hello1")
            print(student)
            # todo add link here
            email = EmailMessage('New Company Arrived', 'here is your link to apply for this company https:www.google.com ', to=[student])
            email.send()
