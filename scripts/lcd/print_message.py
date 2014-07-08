#!/usr/bin/python
import sys
import time
from Adafruit_CharLCD import Adafruit_CharLCD
#from subprocess import * 
lcd = Adafruit_CharLCD()

if len(sys.argv) == 1:
  lcd.clear()

elif len(sys.argv) == 2:
  lcd.message(sys.argv[1])

else:
  lcd.message(sys.argv[1] + '\n' + sys.argv[2])

