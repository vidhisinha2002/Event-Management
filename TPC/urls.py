from django.contrib import admin
from django.urls import path,include
from . import views

urlpatterns = [
    path(r'',views.home, name='maps'),
    path(r'addcompany/', views.addcompany, name='addcompany'),
    path(r'history/', views.history, name='history'),
    path(r'home/', views.home, name='home'),
    path(r'generatelist/', views.generatelist, name='generatelist'),
    path(r'registercompany/', views.registercompany, name='registercompany'),
    path(r'changepwd/', views.changepwd, name='changepwd'),
    path(r'newpwd/', views.newpwd, name='newpwd'),

]
