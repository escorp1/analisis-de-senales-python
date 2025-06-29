import numpy as np
import matplotlib.pyplot as plt

# --- Definición de Parámetros Globales ---
# Frecuencia de muestreo (muestras por segundo)
# Una frecuencia de muestreo más alta permite representar frecuencias más altas.
fs = 1000
# Duración de la señal en segundos
T = 2
# Vector de tiempo: desde 0 hasta T, con fs*T puntos
t = np.linspace(0, T, int(T*fs), endpoint=False)

# --- 1. Generación y Análisis de Señales Elementales ---

# A. Pulso Rectangular
# --------------------
# Definición de la señal en el dominio del tiempo
# El pulso va de t=0.8s a t=1.2s
pulse = np.zeros_like(t)
pulse[int(0.8*fs):int(1.2*fs)] = 1

# Cálculo de la Transformada de Fourier
# np.fft.fft() calcula la transformada.
# np.fft.fftshift() centra el espectro en frecuencia cero.
# np.fft.fftfreq() genera los bins de frecuencia correspondientes.
f_pulse = np.fft.fftfreq(len(pulse), 1/fs)
yf_pulse = np.fft.fft(pulse)

# Visualización de los resultados
plt.figure(figsize=(12, 8))
plt.suptitle('Análisis de un Pulso Rectangular', fontsize=16)

# Señal en el dominio del tiempo
plt.subplot(3, 1, 1)
plt.plot(t, pulse)
plt.title('Pulso Rectangular en el Dominio del Tiempo')
plt.xlabel('Tiempo [s]')
plt.ylabel('Amplitud')
plt.grid(True)

# Espectro de Magnitud
plt.subplot(3, 1, 2)
plt.plot(np.fft.fftshift(f_pulse), np.abs(np.fft.fftshift(yf_pulse)))
plt.title('Espectro de Magnitud')
plt.xlabel('Frecuencia [Hz]')
plt.ylabel('Magnitud')
plt.xlim(-50, 50)
plt.grid(True)

# Espectro de Fase
plt.subplot(3, 1, 3)
plt.plot(np.fft.fftshift(f_pulse), np.angle(np.fft.fftshift(yf_pulse)))
plt.title('Espectro de Fase')
plt.xlabel('Frecuencia [Hz]')
plt.ylabel('Fase [rad]')
plt.xlim(-50, 50)
plt.grid(True)

plt.tight_layout(rect=[0, 0, 1, 0.96])
plt.show()

# B. Función Escalón Unitario
# --------------------------
# Definición de la señal en el dominio del tiempo
# El escalón comienza en t=0.5s
step = np.zeros_like(t)
step[t >= 0.5] = 1

# Cálculo de la Transformada de Fourier
f_step = np.fft.fftfreq(len(step), 1/fs)
yf_step = np.fft.fft(step)

# Visualización de los resultados
plt.figure(figsize=(12, 8))
plt.suptitle('Análisis de una Función Escalón', fontsize=16)

# Señal en el dominio del tiempo
plt.subplot(3, 1, 1)
plt.plot(t, step)
plt.title('Función Escalón en el Dominio del Tiempo')
plt.xlabel('Tiempo [s]')
plt.ylabel('Amplitud')
plt.grid(True)

# Espectro de Magnitud
plt.subplot(3, 1, 2)
plt.plot(np.fft.fftshift(f_step), np.abs(np.fft.fftshift(yf_step)))
plt.title('Espectro de Magnitud')
plt.xlabel('Frecuencia [Hz]')
plt.ylabel('Magnitud')
plt.xlim(-50, 50)
plt.grid(True)

# Espectro de Fase
plt.subplot(3, 1, 3)
plt.plot(np.fft.fftshift(f_step), np.angle(np.fft.fftshift(yf_step)))
plt.title('Espectro de Fase')
plt.xlabel('Frecuencia [Hz]')
plt.ylabel('Fase [rad]')
plt.xlim(-50, 50)
plt.grid(True)

plt.tight_layout(rect=[0, 0, 1, 0.96])
plt.show()

# C. Señal Senoidal
# -----------------
# Definición de la señal en el dominio del tiempo
# Frecuencia de la señal senoidal: 20 Hz
f_sin = 20
sinusoid = np.sin(2 * np.pi * f_sin * t)

# Cálculo de la Transformada de Fourier
f_sinusoid = np.fft.fftfreq(len(sinusoid), 1/fs)
yf_sinusoid = np.fft.fft(sinusoid)

# Visualización de los resultados
plt.figure(figsize=(12, 8))
plt.suptitle('Análisis de una Señal Senoidal (20 Hz)', fontsize=16)

# Señal en el dominio del tiempo
plt.subplot(3, 1, 1)
plt.plot(t, sinusoid)
plt.title('Señal Senoidal en el Dominio del Tiempo')
plt.xlabel('Tiempo [s]')
plt.ylabel('Amplitud')
plt.grid(True)

# Espectro de Magnitud
plt.subplot(3, 1, 2)
plt.plot(np.fft.fftshift(f_sinusoid), np.abs(np.fft.fftshift(yf_sinusoid)))
plt.title('Espectro de Magnitud')
plt.xlabel('Frecuencia [Hz]')
plt.ylabel('Magnitud')
plt.xlim(-50, 50)
plt.grid(True)

# Espectro de Fase
plt.subplot(3, 1, 3)
plt.plot(np.fft.fftshift(f_sinusoid), np.angle(np.fft.fftshift(yf_sinusoid)))
plt.title('Espectro de Fase')
plt.xlabel('Frecuencia [Hz]')
plt.ylabel('Fase [rad]')
plt.xlim(-50, 50)
plt.grid(True)

plt.tight_layout(rect=[0, 0, 1, 0.96])
plt.show()


# --- 2. Verificación de Propiedades de la Transformada de Fourier ---

# A. Linealidad: TF{a*x(t) + b*y(t)} = a*X(f) + b*Y(f)
# --------------------------------------------------
# Definimos dos señales
s1 = np.cos(2 * np.pi * 10 * t) # Seno a 10 Hz
s2 = np.sin(2 * np.pi * 30 * t) # Coseno a 30 Hz
a, b = 2, 3
linear_combination = a * s1 + b * s2

# Transformada de la combinación lineal
yf_linear = np.fft.fft(linear_combination)
# Suma ponderada de las transformadas individuales
yf_s1 = np.fft.fft(s1)
yf_s2 = np.fft.fft(s2)
yf_sum = a * yf_s1 + b * yf_s2

# Visualización para comprobar la linealidad
plt.figure(figsize=(12, 6))
plt.suptitle('Propiedad de Linealidad', fontsize=16)
f_axis = np.fft.fftfreq(len(t), 1/fs)

plt.subplot(1, 2, 1)
plt.plot(np.fft.fftshift(f_axis), np.abs(np.fft.fftshift(yf_linear)))
plt.title('TF de la Combinación Lineal')
plt.xlabel('Frecuencia [Hz]')
plt.ylabel('Magnitud')
plt.xlim(-50, 50)
plt.grid(True)

plt.subplot(1, 2, 2)
plt.plot(np.fft.fftshift(f_axis), np.abs(np.fft.fftshift(yf_sum)))
plt.title('Suma Ponderada de las TF')
plt.xlabel('Frecuencia [Hz]')
plt.ylabel('Magnitud')
plt.xlim(-50, 50)
plt.grid(True)

plt.tight_layout(rect=[0, 0, 1, 0.96])
plt.show()

# B. Desplazamiento en el Tiempo: TF{x(t - t0)} = X(f) * e^(-j*2*pi*f*t0)
# ----------------------------------------------------------------------
# Usamos el pulso rectangular original y uno desplazado
t0 = 0.5 # Desplazamiento de 0.5 segundos
pulse_shifted = np.zeros_like(t)
pulse_shifted[int((0.8+t0)*fs):int((1.2+t0)*fs)] = 1

# Transformada del pulso desplazado
yf_pulse_shifted = np.fft.fft(pulse_shifted)

# Visualización del efecto en la magnitud y fase
plt.figure(figsize=(12, 8))
plt.suptitle(f'Propiedad de Desplazamiento en el Tiempo (t0={t0}s)', fontsize=16)

# Magnitudes (deben ser iguales)
plt.subplot(2, 1, 1)
plt.plot(np.fft.fftshift(f_pulse), np.abs(np.fft.fftshift(yf_pulse)), label='Original')
plt.plot(np.fft.fftshift(f_pulse), np.abs(np.fft.fftshift(yf_pulse_shifted)), '--', label='Desplazado')
plt.title('Comparación de Magnitudes')
plt.xlabel('Frecuencia [Hz]')
plt.ylabel('Magnitud')
plt.xlim(-50, 50)
plt.legend()
plt.grid(True)

# Fases (el desplazamiento introduce un desfase lineal)
plt.subplot(2, 1, 2)
plt.plot(np.fft.fftshift(f_pulse), np.angle(np.fft.fftshift(yf_pulse)), label='Original')
plt.plot(np.fft.fftshift(f_pulse), np.angle(np.fft.fftshift(yf_pulse_shifted)), '--', label='Desplazado')
plt.title('Comparación de Fases')
plt.xlabel('Frecuencia [Hz]')
plt.ylabel('Fase [rad]')
plt.xlim(-50, 50)
plt.legend()
plt.grid(True)

plt.tight_layout(rect=[0, 0, 1, 0.96])
plt.show()

# C. Escalamiento en Frecuencia: TF{x(a*t)} = (1/|a|) * X(f/a)
# -----------------------------------------------------------
# Un pulso rectangular más ancho en el tiempo (a < 1)
# Debería resultar en un espectro más estrecho en frecuencia.
a = 0.5 # Factor de escalamiento en tiempo (comprime la señal en frecuencia)
pulse_scaled_time = np.zeros_like(t)
start_time = 1 - (0.2 / a)
end_time = 1 + (0.2 / a)
pulse_scaled_time[int(start_time*fs):int(end_time*fs)] = 1

# Transformada del pulso escalado en tiempo
yf_pulse_scaled_time = np.fft.fft(pulse_scaled_time)

# Visualización del efecto
plt.figure(figsize=(12, 8))
plt.suptitle('Propiedad de Escalamiento (Compresión en Frecuencia)', fontsize=16)

# Señales en el tiempo
plt.subplot(2, 1, 1)
plt.plot(t, pulse, label='Original (Ancho 0.4s)')
plt.plot(t, pulse_scaled_time, '--', label=f'Escalado (Ancho {0.4/a:.1f}s)')
plt.title('Señales en el Dominio del Tiempo')
plt.xlabel('Tiempo [s]')
plt.ylabel('Amplitud')
plt.legend()
plt.grid(True)

# Espectros de Magnitud
plt.subplot(2, 1, 2)
plt.plot(np.fft.fftshift(f_pulse), np.abs(np.fft.fftshift(yf_pulse)), label='TF Original')
plt.plot(np.fft.fftshift(f_pulse), np.abs(np.fft.fftshift(yf_pulse_scaled_time)), '--', label='TF Escalado')
plt.title('Espectros de Magnitud')
plt.xlabel('Frecuencia [Hz]')
plt.ylabel('Magnitud')
plt.xlim(-20, 20)
plt.legend()
plt.grid(True)

plt.tight_layout(rect=[0, 0, 1, 0.96])
plt.show()