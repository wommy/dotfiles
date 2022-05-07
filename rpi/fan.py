### pwm fan control: amalgam of 
# - https://wiki.52pi.com/index.php?title=ZP-0110
# - https://www.instructables.com/Smart-Control-of-Raspberry-Pi-Fan-Using-Python-Thi/
# - https://stackoverflow.com/questions/4760215/running-shell-command-and-capturing-the-output
# - https://discourse.osmc.tv/t/bash-vcgencmd-command-not-found/37733
### additonal from readme
# - https://github.com/torfsen/python-systemd-tutorial
# - https://tecadmin.net/setup-autorun-python-script-using-systemd/
# - https://stackoverflow.com/questions/7323859/python-how-to-call-bash-commands-with-pipe
# - https://stackoverflow.com/questions/4256107/running-bash-commands-in-python

import RPi.GPIO as GPIO
from time import sleep
from subprocess import run, PIPE
from re import findall

def get_temp():
    temp = run(["/opt/vc/bin/vcgencmd measure_temp"], shell=True, stdout=PIPE).stdout.decode()
    temp = float(findall('\d+\.\d+', temp)[0])
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
        # sleep(3)
        sleep(90)
except KeyboardInterrupt:
    pwm.stop()
finally:
    GPIO.cleanup()
