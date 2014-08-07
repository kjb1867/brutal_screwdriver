#!/usr/bin/python
import sys
import time
import pylcdlib

lcd = pylcdlib.lcd(0x27,1)
lcd.lcd_write(0x01);
lcd.lcd_write(0x0C);

if len(sys.argv) == 1:
  lcd.lcd_clear()
  lcd.lcd_backlight(0)

elif len(sys.argv) == 2:
  lcd.lcd_puts(sys.argv[1],1)
  lcd.lcd_backlight(1)

else:
  lcd.lcd_puts(sys.argv[1],1)
  lcd.lcd_puts(sys.argv[2],2)
  lcd.lcd_backlight(1)
