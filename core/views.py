from msilib import Table
from django.http.response import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.template.loader import render_to_string

import reportlab
import io
from django.http import FileResponse
from reportlab.pdfgen import canvas

from teams.models import AsisMiembroEquipo
from users.models import Persona

# Create your views here.
@login_required
def home_feed(request):
    return render(request, 'home/feed.html')

def home_assistant(request):
    list_asis_miemb_esqui = AsisMiembroEquipo.objects.all()
    return render(request, 'home/assistant.html', {list:list_asis_miemb_esqui})

def export_pdf(request):
    # Create a file-like buffer to receive PDF data.
    buffer = io.BytesIO()
    # Create the PDF object, using the buffer as its "file."
    p = canvas.Canvas(buffer)
    #
    context = {}
    html = render_to_string("home/report-pdf.html", context)
    # Draw things on the PDF. Here's where the PDF generation happens.
    # See the ReportLab documentation for the full list of functionality.
    
    p.drawString(100, 100, html)
    # Close the PDF object cleanly, and we're done.
    p.showPage()
    p.save()
    # FileResponse sets the Content-Disposition header so that browsers
    # present the option to save the file.
    buffer.seek(0)
    return FileResponse(buffer, as_attachment=True, filename='export-pdf.pdf')

from django.conf import settings
from io import BytesIO
from reportlab.pdfgen import canvas
from django.views.generic import View
from reportlab.platypus import Flowable, Paragraph, Table, TableStyle
class ReportePersonasPDF(View):  
     
    def cabecera(self,pdf):
        #Utilizamos el archivo logo_django.png que está guardado en la carpeta media/imagenes
        archivo_imagen = 'http://localhost:8000/static/img/logo.png'
        #Definimos el tamaño de la imagen a cargar y las coordenadas correspondientes
        pdf.drawImage(archivo_imagen, 40, 750, 120, 90,preserveAspectRatio=True)  
        #Establecemos el tamaño de letra en 16 y el tipo de letra Helvetica
        pdf.setFont("Helvetica", 16)
        #Dibujamos una cadena en la ubicación X,Y especificada
        pdf.drawString(230, 790, u"Und. Deportiva UD")
        pdf.setFont("Helvetica", 14)
        pdf.drawString(260, 770, u"REPORTE")    
    def tabla(self,pdf,y):
        #Creamos una tupla de encabezados para neustra tabla
        encabezados = ('Documento', 'Número', 'Correo')
        #Creamos una lista de tuplas que van a contener a las personas
        detalles = [(persona.id_tipo_documento, persona.numero_documento, persona.correo) for persona in Persona.objects.all()]
        #Establecemos el tamaño de cada una de las columnas de la tabla
        detalle_orden = Table([encabezados] + detalles)#, colWidths=[2 * cm, 5 * cm, 5 * cm, 5 * cm])
        #Aplicamos estilos a las celdas de la tabla
        detalle_orden.setStyle(TableStyle(
            [
                #La primera fila(encabezados) va a estar centrada
                ('ALIGN',(0,0),(3,0),'CENTER'),
                #Los bordes de todas las celdas serán de color negro y con un grosor de 1
                #('GRID', (0, 0), (-1, -1), 1, colors.black), 
                #El tamaño de las letras de cada una de las celdas será de 10
                ('FONTSIZE', (0, 0), (-1, -1), 10),
            ]
        ))
        #Establecemos el tamaño de la hoja que ocupará la tabla 
        detalle_orden.wrapOn(pdf, 800, 600)
        #Definimos la coordenada donde se dibujará la tabla
        detalle_orden.drawOn(pdf, 60, y)

    def get(self, request, *args, **kwargs):
        #Indicamos el tipo de contenido a devolver, en este caso un pdf
        response = HttpResponse(content_type='application/pdf')
        #La clase io.BytesIO permite tratar un array de bytes como un fichero binario, se utiliza como almacenamiento temporal
        buffer = BytesIO()
        #Canvas nos permite hacer el reporte con coordenadas X y Y
        pdf = canvas.Canvas(buffer)
        #Llamo al método cabecera donde están definidos los datos que aparecen en la cabecera del reporte.
        self.cabecera(pdf)
        y = 600
        self.tabla(pdf, y)
        #Con show page hacemos un corte de página para pasar a la siguiente
        pdf.showPage()
        pdf.save()
        pdf = buffer.getvalue()
        buffer.close()
        response.write(pdf)
        return response