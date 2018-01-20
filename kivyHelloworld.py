#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Jan 20 16:04:23 2018

@author: tlaferriere
"""

from kivy.app import App
from kivy.uix.button import Button

class MyApp(App):

    def build(self):
        return Button(text='Hello World')


if __name__ == '__main__':
    MyApp().run()