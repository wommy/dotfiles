# armor pwm fan control

import RPi.GPIO as GPIO
import time
import subprocess

GPIO.setmode(GPIO.BCM)
GPIO.setup(14, GPIO.OUT)
pwm = GPIO.PWM(14,100)

print("\nPress Ctrl+C to quit \n")
dc = 0
pwm.start(dc)

try:
    while True:
        # from https://stackoverflow.com/a/68323238
        # proc1 = subprocess.run(["vcgencmd measure_temp"], stdout=subprocess.PIPE, shell=True)
        # proc2 = subprocess.run(["sed 's/[^0-9.]//g'"], input=proc1.stdout, stdout=subprocess.PIPE, shell=True)
        # temp = proc2.stdout.decode()
        temp = subprocess.run(["vcgencmd measure_temp | sed 's/[^0-9.]//g'"], shell=True, stdout=subprocess.PIPE).stdout.decode()
        if round(float(temp)) >= 55:
            dc = 100
            pwm.ChangeDutyCycle(dc)
            time.sleep(120)
        if round(float(temp)) >= 50:
            dc = 70
            pwm.ChangeDutyCycle(dc)
            time.sleep(120)
        else:
            dc = 0
            pwm.ChangeDutyCycle(dc)
            time.sleep(60)
except KeyboardInterrupt:
    pwm.stop()
    GPIO.cleanup()
    print("Ctrl + C pressed -- Ending program")
