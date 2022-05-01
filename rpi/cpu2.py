# pwm fan control: amalgam of 
# - https://wiki.52pi.com/index.php?title=ZP-0110
# - https://www.instructables.com/Smart-Control-of-Raspberry-Pi-Fan-Using-Python-Thi/

import RPi.GPIO as GPIO
from time import sleep
from subprocess import check_output
from re import findall

def get_temp():
    temp = check_output(["vcgencmd", "measure_temp"]).decode()
    temp = float( findall( '\d+\.\d+', temp )[0] )
    return(temp)

try:
    GPIO.setwarnings( False )
    GPIO.setmode( GPIO.BCM )
    GPIO.setup( 14, GPIO.OUT )
    pwm = GPIO.PWM( 14, 100 )
    pwm.start(0)
    while True:
        temp = get_temp()
        if temp > 55:
            pwm.ChangeDutyCycle(100)
            # print("high")
        elif temp > 50:
            pwm.ChangeDutyCycle(70)
            # print("med")
        else:
            pwm.ChangeDutyCycle(0)
            # print("off")
        # print(str(temp))
        sleep(60)
except KeyboardInterrupt:
    pwm.stop()
finally:
    GPIO.cleanup()
