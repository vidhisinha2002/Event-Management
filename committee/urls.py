from django.contrib import admin
from django.urls import path,include
from committee import views
urlpatterns = [
    path(r'viewEvents/', views.viewEvents, name='viewEvent'),
    path(r'AddEvent/', views.addEvent, name='AddEvent'),
    path(r'EditEvent/', views.EditEvent, name='EditEvent'),
    path(r'editEvent/', views.editEvent, name='editEvent'),
    path(r'rescheduleEvent/', views.rescheduleEvent, name='rescheduleEvent'),
    path(r'deleteEvent/', views.deleteEvent, name='deleteEvent'),
    path(r'reschdule/', views.reschdule, name='reschdule'),
    path(r'deskC/', views.Desk, name='deskC'),
    path(r'changepass/', views.changepass, name='changepass'),
    path(r'newpass/', views.newpass, name='newpass')
]
