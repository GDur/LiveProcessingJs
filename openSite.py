import sublime, sublime_plugin
import subprocess
import webbrowser
import string

class OpenLiveProcessingJsCommand(sublime_plugin.ApplicationCommand):
	def __init__(self):
		print sublime.packages_path() + "\LiveProcessingJs\ProcessingJsSocket\index.html"
		self.site = "C:\Users\GDur\AppData\Roaming\Sublime Text 2\Packages\LiveProcessingJs\ProcessingJsSocket\index.html"
		
	def run(self):
		print sublime.packages_path() + "\LiveProcessingJs\ProcessingJsSocket\index.html"
		webbrowser.open(self.site, new = False)