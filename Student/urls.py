from django.conf import settings
from django.conf.urls.static import static
from django.urls import path

from . import views

urlpatterns = [
    path(r'', views.Desk, name='deskS'),
    path(r'genR/', views.genR, name='genR'),
    path(r'deskS/', views.Desk, name='deskS'),
    path(r'uploadOffer/', views.uploadLetter, name='uploadOffer'),
    path(r'display_events/',views.display_events,name='display_events'),
    path(r'eventregister/',views.eventregister,name='eventregister'),
    path(r'personal_details/',views.details,name='personal_details'),
    path(r'other_details/',views.other_details,name='other_details')

]
