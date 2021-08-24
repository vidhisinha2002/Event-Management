from django.db import connections
from django.db.models.functions import datetime
from django.shortcuts import render
from Student.forms import DocumentForm
from Student.models import Document


def genR(request):
    conn = connections['default']
    cursor = conn.cursor()
    query = "SELECT * FROM student_academic where roll_no_fk='" \
            + request.session.get('rollno', "") + "'"
    cursor.execute(query)
    P = cursor.fetchone()
    print(P)
    query = "SELECT * FROM student where rollno='" \
            + request.session.get('rollno', "") + "'"
    cursor.execute(query)
    AC = cursor.fetchone()
    print(AC)
    return render(request, "myapp/genR.html", {'P': AC, 'AC': P})


def Desk(request):
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
    return render(request, 'myapp/Student.html', {'title': td})


def uploadLetter(request):
    if request.method == 'POST':
        form = DocumentForm(request.POST, request.FILES)
        if form.is_valid():
            companyName = request.POST.get("Cnsme", "")
            newdoc = Document(docfile=request.FILES['docfile'])
            newdoc.save()
            fname = newdoc.docfile.name
            arr = fname.split("/")
            fname = arr[len(arr) - 1]
            print(fname, companyName)
            dateT = datetime.datetime.today().strftime('%Y-%m-%d')
            conn = connections['default']
            cursor = conn.cursor()

            query = "insert into offer_letter (roll_no_fk,company,date,doc_name) values('" + request.session.get(
                'rollno', "") + "','" + companyName + "','" + dateT + "','" + fname + "')"
            print()
            cursor.execute(query)
            form = DocumentForm()
            return render(request, "myapp/uploadOffer.html", {"msg": "Your File Uploaded Successfully!", 'form': form})
    else:
        form = DocumentForm()  # A empty, unbound form
        return render(request, 'myapp/uploadOffer.html', {'form': form})


def details(request):
    conn = connections['default']
    cursor = conn.cursor()
    query = "select * from student where rollno='" + request.session['rollno'] + "' "
    cursor.execute(query)
    result = cursor.fetchone()
    print(result)
    template = 'myapp/personal_details.html'
    if request.method == 'POST':
        name = request.POST['name']
        year = request.POST['year']
        branch = request.POST['branch']
        address = request.POST['address']
        contact = request.POST['contact']
        dob = request.POST['dob']
        conn = connections['default']
        query = "update student set name='" + name + "',year='" + year + "',branch='" + branch + "',address='" + address + "',contact='" + contact + "',dob='" + dob + "' where rollno = '" + \
                request.session['rollno'] + "' "
        cursor = conn.cursor()
        cursor.execute(query)
        context = {
            'result': result,
            'rollno': request.session['rollno'],
            'success': 'Details are updated successfully!',
        }
        return render(request, template, context)
    else:
        context = {
            'result': result,
            'rollno': request.session['rollno'],
        }
        return render(request, template, context)


def other_details(request):
    template = 'myapp/other_details.html'
    conn = connections['default']
    cursor = conn.cursor()
    query = "select * from student_academic where roll_no_fk='" + request.session['rollno'] + "' "
    cursor.execute(query)
    print(query)
    result = cursor.fetchone()
    print(result)
    if request.session['rollno'] is None:
        context = {
            'rollno': request.session['rollno'],
            'result': result,
        }
        return render(request, template, context)
    else:
        if request.method == 'POST':
            conn = connections['default']
            cursor = conn.cursor()
            ssc = request.POST['ssc']
            hsc = request.POST['ssc']
            s1 = request.POST['s1']
            s2 = request.POST['s2']
            s3 = request.POST['s3']
            s4 = request.POST['s4']
            s5 = request.POST['s5']
            s6 = request.POST['s6']
            s7 = request.POST['s7']
            s8 = request.POST['s8']
            live_kt = request.POST['live_kt']
            dead_kt = request.POST['dead_kt']
            objective = request.POST['objective']
            extra = request.POST['extra']
            achievement = request.POST['achievement']
            query = "update student_academic set ssc=" + ssc + ",hsc=" + hsc + ",s1=" + s1 + ",s2=" + s2 + ",s3=" + s3 + ",s4=" + s4 + ",s5=" + s5 + ",s6=" + s6 + ",s7=" + s7 + ",s8=" + s8 + ",live_kt=" + live_kt + ",dead_kt=" + dead_kt + ",objective='" + objective + "',extra='" + extra + "',achievement='" + achievement + "' where roll_no_fk = '" + \
                    request.session['rollno'] + "' "
            print(query)
            cursor.execute(query)
            context = {
                'rollno': request.session['rollno'],
                'success': 'Details are uploaded successfully!',
                'result': result,
            }
            return render(request, template, context)
        else:
            context = {
                'rollno': request.session['rollno'],
                'result': result,
            }
            return render(request, template, context)


def display_events(request):
    template = 'myapp/events.html'
    conn = connections['default']
    cursor = conn.cursor()
    query = "select branch,year,name,email,contact from student where rollno = '" + request.session['rollno'] + "'"
    print(query)
    cursor.execute(query)
    args = cursor.fetchone()
    print("result", args[0])
    query1 = "select ename,description,date,from_hr,to_hr,amount,author,eid from events where target_aud = '" + args[
        1] + "' and branch = '" + args[0] + "'"
    print(query1)
    cursor.execute(query1)
    events = cursor.fetchall()
    print(events)
    print(args)
    context = {
        'args': args,
        'rollno': request.session['rollno'],
        'events': events,
    }
    return render(request, template, context)


def eventregister(request):
    conn = connections['default']
    cursor = conn.cursor()
    query = "select branch,year,name,email,contact from student where rollno = '" + request.session['rollno'] + "'"
    cursor.execute(query)
    args = cursor.fetchone()
    query1 = "select ename,description,date,from_hr,to_hr,amount,author,eid from events where target_aud = '" + \
             args[1] + "' and branch = '" + args[0] + "'"
    print(query1)
    cursor.execute(query1)
    events = cursor.fetchall()

    template = 'myapp/events.html'
    if request.method == 'POST':
        flag1 = 0
        eid = request.POST['eid']
        ename = request.POST['ename']
        name = request.POST['name']
        email = request.POST['email']
        contact = request.POST['contact']
        amount = request.POST['amount']

        query = "select * from formregister where eid=" + eid + " and name='" + name + "'"
        cursor.execute(query)
        if cursor.fetchone():
            flag1 = 1
            context = {
                'events': events,
                'flag': flag1,
            }

            return render(request, 'myapp/events.html', context)

        else:
            flag1 = 0
            query = "insert into formregister(eid,ename,name,email,contact) values(" + eid + ",'" + ename + "','" + name + "','" + email + "','" + contact + "')"
            cursor.execute(query)
            print(query)

            context = {
                'events': events,
                'flag': flag1,
            }
            return render(request, 'myapp/events.html', context)
    else:

        return render(request, 'myapp/events.html')
