from django.shortcuts import render
from django.db import connections

# Create your views here.
def index(request):
    conn = connections['default']
    query = "select * from events where approve_status=1"
    print(query)
    cursor = conn.cursor()
    cursor.execute(query)
    data=cursor.fetchall()
    events={}
    for data1 in data:
        # print(data1[0],data1[1],data1[2],data1[3],data1[4],data1[5],data1[6],data1[7],data1[8],data1[9],data1[10],data1[11],data1[12])
        events[data1[2]]={'title':data1[2],
                         'start':data1[4],
                         'end':data1[4]}
    print("dictionary:",events)
    # events={
    #     'even1':{
    #         'title': 'Long Event',
    #         'start': '2018-03-07T00:00:00',
    #         'end': '2018-03-07T00:00:00'
    #     },
    #     'event2':{
    #          "title": 'Meeting',
    #         'start': '2018-03-09',
    #         'end': '2018-03-10'
    #     },
    # }
    dicti={"key":events}
    return render(request,'calendar/demos/default.html',dicti)