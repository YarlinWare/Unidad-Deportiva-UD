from django.http.response import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from django.contrib.auth.decorators import login_required

# Create your views here.
@login_required
def home_feed(request):
    return render(request, 'home/feed.html')

def home_assistant(request):
    return render(request, 'home/assistant.html')