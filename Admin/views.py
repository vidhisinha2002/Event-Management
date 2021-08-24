from django.db import connections
from django.http import HttpResponse
from django.shortcuts import render
from Admin.dbOperations import Event, Notice, Committee


def approveEvents(request):
    event = Event()
    return render(request, 'myapp/ApproveEventAdmin.html',
                  {'mode': 1, 'context': event.getAllEventApprovalRequest()})


def operate(request):
    if request.method == 'POST':
        operation = request.POST['operation']
        id = request.POST['id']
        event = Event()
        if operation == "accept":
            event.setEventStatus(1, id)
        else:
            event.setEventStatus(-1, id)
    return HttpResponse('')


def createEvent(request):
    if request.method == 'POST':
        title = request.POST.get('title', "")
        desc = request.POST.get('desc', "")
        date = request.POST.get('date', "")
        time = request.POST.get('time', "")
        notice = Notice()
        id = notice.createNotice(title, desc, date, time)
        return render(request, 'myapp/createNotice.html', {'msg': 'Notice=> ' + str(id) + ' successfully added!'})
    else:
        return render(request, 'myapp/createNotice.html')


def createCommittee(request):
    if request.method == 'POST':
        email = request.POST.get('email', "")
        id = request.POST.get('id', "")
        cname = request.POST.get('cname', "")
        committee = Committee()
        id = committee.createCommittee(email, id, cname)
        return render(request, 'myapp/createCommittee.html', {'msg': 'Notice=> ' + str(id) + ' successfully added!'})
    else:
        return render(request, 'myapp/createCommittee.html')


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
    return render(request, 'myapp/Admin.html', {'title': td})
