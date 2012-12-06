import sublime, sublime_plugin
import subprocess
import webbrowser
import string

class OpenLiveProcessingJsCommand(sublime_plugin.ApplicationCommand):
	def __init__(self):
		self.site = sublime.packages_path() + "\LiveProcessingJs\ProcessingJsSocket\index.html"
		print self.site

	def run(self):
		print self.site
		webbrowser.open(self.site, new = False)