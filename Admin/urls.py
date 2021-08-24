from django.contrib import admin
from django.urls import path,include
from Admin import views
urlpatterns = [
    path(r'approveEvent/', views.approveEvents, name='approveEvents'),
    path(r'operate/', views.operate, name='operate'),
    path(r'createEvent/', views.createEvent, name='createEvent'),
    path(r'createCommittee/', views.createCommittee, name='createCommittee'),
    path(r'deskA/', views.Desk, name='deskA')

]
