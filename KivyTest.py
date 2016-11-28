import kivy
from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
kivy.require('1.9.0')

class GUITestApp(App):
    def build(self):
        return BoxLayout()

glApp = GUITestApp()
glApp.run()
