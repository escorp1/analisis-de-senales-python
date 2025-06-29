# Análisis de Señales en el Dominio del Tiempo y Frecuencia con Python

## Propósito del Proyecto

Este proyecto tiene como objetivo principal analizar y visualizar señales en los dominios del tiempo y la frecuencia utilizando Python. A través de la implementación de la **Transformada Rápida de Fourier (FFT)**, se busca demostrar cómo las características de una señal en el tiempo se traducen a su representación espectral.

El código genera señales elementales (pulso rectangular, escalón unitario y sinusoide), calcula su espectro de frecuencia y visualiza tanto la señal original como su espectro de magnitud y fase. Adicionalmente, se verifican experimentalmente tres propiedades fundamentales de la Transformada de Fourier:

1.  **Linealidad**
2.  **Desplazamiento en el Tiempo**
3.  **Escalamiento en Tiempo/Frecuencia**

Este repositorio sirve como un recurso educativo y práctico para estudiantes e ingenieros que deseen comprender los fundamentos del procesamiento de señales digitales.

## Características

* **Generación de Señales:** Crea señales básicas como pulsos, escalones y sinusoides.
* **Análisis de Frecuencia:** Utiliza la librería `NumPy` para calcular la Transformada Rápida de Fourier (`np.fft.fft`).
* **Visualización Completa:** Emplea `Matplotlib` para generar tres gráficos por señal:
    * Señal en el dominio del tiempo.
    * Espectro de magnitud en el dominio de la frecuencia.
    * Espectro de fase en el dominio de la frecuencia.
* **Demostración de Propiedades:** Incluye secciones de código dedicadas a verificar visualmente las propiedades de la Transformada de Fourier.
* **Código Comentado:** El script está documentado extensamente para facilitar su comprensión, explicando cada paso del proceso.

## Instalación

Para ejecutar este código, necesitas tener Python 3 instalado en tu sistema. Luego, puedes instalar las librerías necesarias ejecutando el siguiente comando en tu terminal:

```bash
pip install numpy scipy matplotlib
```

## Uso

1.  Clona o descarga este repositorio en tu máquina local.
2.  Navega hasta el directorio del proyecto en tu terminal.
3.  Ejecuta el script de Python:

```bash
python nombre_del_archivo.py
```

*Nota: Reemplaza `nombre_del_archivo.py` con el nombre real de tu archivo de script (ej. `analisis_fourier.py`).*

Al ejecutar el script, se mostrarán varias ventanas de `Matplotlib`, cada una conteniendo las gráficas correspondientes al análisis de cada señal y a la verificación de las propiedades.

## Conceptos Demostrados en el Código

* **Dualidad Tiempo-Frecuencia:** Observa cómo una señal corta en el tiempo (como un pulso estrecho) tiene un espectro de frecuencia ancho, y viceversa.
* **Espectro de Señales Periódicas:** Una señal senoidal pura se manifiesta como picos nítidos en su frecuencia fundamental.
* **Efecto de Discontinuidades:** Señales con cambios abruptos (pulso rectangular, escalón) requieren un ancho de banda infinito (representado por lóbulos laterales que se extienden).
* **Propiedad de Desplazamiento:** Un desplazamiento en el tiempo no altera la magnitud del espectro, pero introduce un desfase lineal.
* **Propiedad de Escalamiento:** Comprimir una señal en el tiempo expande su espectro en frecuencia.
