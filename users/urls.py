"""Unidad Deportiva UD URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import path, include

from users import views as users_views

# rest_framework
from rest_framework import routers
router = routers.DefaultRouter()
# En el router vamos añadiendo los endpoints a los viewsets
router.register('persona', users_views.PersonasViewSet)

urlpatterns = [
    path('',users_views.home, name="home"),
    path('login',users_views.login_view, name="login" ),
    path('logout',users_views.logout_view, name="logout" ),
    path('signup',users_views.signup_view, name="signup" ),
    path('signup/employee',users_views.signup_employee, name="signup_employee" ),
    path('signup/assistant',users_views.signup_assistant, name="signup_assistant" ),
    #API
    path('api/', include(router.urls)),
]
