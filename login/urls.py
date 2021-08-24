from django.conf import settings
from django.conf.urls.static import static
from django.urls import path

from . import views

urlpatterns = [
    path(r'', views.check, name='login'),
    path(r'index/', views.check, name='loginProc'),

    path(r'navStudent/', views.getNavigationStudent, name='navStudent'),   #getNavigationStudent
    path(r'navCommittee/', views.getNavigationCommittee, name='navCommittee'),
    path(r'navTPC/', views.getNavigationTPC, name='navTPC'),
    path(r'navAdmin/', views.getNavigationAdmin, name='navAdmin'),

    path(r'logout', views.logout, name='logout'),
    path(r'forgot_password/', views.forgotPassword, name='forgotPass'),
    path(r'reset_password/', views.resetPassword, name='resetPass'),
    path(r'about/', views.about, name='about'),

    path(r'index2', views.register, name='registerProc'),
    path(r'register/', views.list2, name='register')
]
