from django.shortcuts import render
from django.core.mail import EmailMessage
# from Constants.const import constant
from django.db import connections
import string
import random
# import mimetypes
from login.DbOperations import ForgotPassword, Login


def list1(request):
    return render(request, 'myapp/login.html')


def getNavigationStudent(request):
    return render(request, "myapp/NavigationStudent.html")


def getNavigationCommittee(request):
    return render(request, "myapp/NavigationCommittee.html")


def getNavigationTPC(request):
    return render(request, "myapp/NavigationTPC.html")


def getNavigationAdmin(request):
    return render(request, "myapp/NavigationAdmin.html")


def forgotPassword(request):
    return render(request, "myapp/forgot-password.html")


def resetPassword(request):
    if request.method == 'POST':
        userEmail = request.POST.get('uemail', False)
        newPass = ''.join(random.SystemRandom().choice(string.ascii_uppercase + string.digits) for _ in range(20))
        resetPass = ForgotPassword()
        isSuccessful = resetPass.updatePassword(userEmail, newPass)
        print(isSuccessful)
        if isSuccessful == 0:
            return render(request, "myapp/forgot-password.html", {'error': "Email ID doesn't exists"})
        email = EmailMessage('New Password reset on Project', 'here is your new password ' + newPass, to=[userEmail])
        email.send()
    return render(request, 'myapp/login.html')


def about(request):
    return render(request, "myapp/about_us.html")


# pawan
def list2(request):  # 4
    return render(request, 'myapp/register.html')


def register(request):
    Data = {}
    if request.method == 'POST':
        Data['email'] = request.POST.get('email', False)
        Data['rollno'] = request.POST.get('rollno', False)
        Data['pwd'] = request.POST.get('pwd', False)
        login = Login()
        x = login.auth_uname(Data['rollno'])
        print(x)
        if x == 1:
            login.registration(Data)
        else:
            return render(request, 'myapp/register.html')
    return render(request, 'myapp/login.html')


def logout(request):
    request.session['rollno'] = -1
    request.session['year'] = ""
    return render(request, 'myapp/login.html', {"Error": False})


def check(request):
    if request.method == 'POST':
        l = Login()
        uname = request.POST['uname']
        upass = request.POST['upass']
        request.session['uname']=uname
        if len(uname)==8 and l.checkStudent(uname, upass, request):
            return returnHomepage(request,uname)
        elif (len(uname)== 9 or len(uname)==5 or len(uname)==3) and l.checkOther(uname,upass,request) :
            return returnHomepage(request,uname)
        else:
            return render(request, 'myapp/login.html', {"Error": True})
    else:
        return render(request, 'myapp/login.html')

def displaynotice():
    td = {}
    query = "select title,description from notice"
    conn = connections['default']
    cursor = conn.cursor()
    cursor.execute(query)
    for t in cursor.fetchall():
        td[t[0]] = t[1]
    return td

def returnHomepage(request,uname):
    #student 8 : committee 9 : TPC 5 : admin 3
    td={}
    print(len(uname))
    td=displaynotice()
    if len(uname) == 8:
        return render(request, "myapp/Student.html",{'rollno':uname , 'title':td})
    elif len(uname) == 9:
        return render(request, "myapp/Committee.html",{'rollno':uname, 'title':td})
    elif len(uname) == 5:
        return render(request, "myapp/TPC.html",{'rollno':uname, 'title':td})
    elif len(uname) == 3:
        return render(request, "myapp/Admin.html",{'rollno':uname, 'title':td})