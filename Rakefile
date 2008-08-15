require 'osx/cocoa' # dummy
require 'rubygems'
require 'rake'
require 'rake/clean'
require 'spec/rake/spectask'
require 'erb'
require 'pathname'
require File.dirname(__FILE__) + "/lib/version"

# Application own Settings
APPNAME   = "Sinkr"
APPVERSION= Sinkr.version
TARGET    = "#{APPNAME}.app"
RESOURCES = ['lib', '*.lproj']
# RESOURCES = ['lib', '*.lproj', 'Credits.*', '*.icns']
PKGINC    = [TARGET, 'README', 'html', 'client']
LOCALENIB = [] #['Japanese.lproj/Main.nib']
PUBLISH   = 'yourname@yourhost:path'

BUNDLEID  = "rubyapp.#{APPNAME}"

CLEAN.include ['**/.*.sw?', '*.dmg', TARGET, 'image', 'a.out']

# Tasks
task :default => [:spec, :run]

Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
end

desc 'Create Application Bundle and Run it.'
task :run => [TARGET] do
	exec %{#{TARGET}/Contents/MacOS/#{APPNAME}}
end

desc 'Create Application Bundle and Run it.'
task :open => [TARGET] do
	sh %{open '#{TARGET}'}
end

desc 'Create .dmg file for Publish'
task :package => [:clean, 'pkg', TARGET] do
	name = "#{APPNAME}.#{APPVERSION}"
	sh %{
	mkdir image
	cp -r #{PKGINC.join(' ')} image
	ln -s html/index.html image/index.html
	}
	puts 'Creating Image...'
	sh %{
	hdiutil create -volname #{name} -srcfolder image #{name}.dmg
	rm -rf image
	mv #{name}.dmg pkg
	}
end

desc 'Publish .dmg file to specific server.'
task :publish => [:package] do
	sh %{
	svn log > CHANGES
	}
	_, host, path = */^([^\s]+):(.+)$/.match(PUBLISH)
	path = Pathname.new path
	puts "Publish: Host: %s, Path: %s" % [host, path]
	sh %{
	scp pkg/IIrcv.#{APPVERSION}.dmg #{PUBLISH}/pkg
	scp CHANGES #{PUBLISH}/pkg
	scp -r html/* #{PUBLISH}
	}
end

desc 'Make Localized nib from English.lproj and Lang.lproj/nib.strings'
rule(/.nib$/ => [proc {|tn| File.dirname(tn) + '/nib.strings' }]) do |t|
	p t.name
	lproj = File.dirname(t.name)
	target = File.basename(t.name)
	sh %{
	rm -rf #{t.name}
	nibtool -d #{lproj}/nib.strings -w #{t.name} English.lproj/#{target}
	}
end

# File tasks
desc 'Make executable Application Bundle'
file TARGET => [:clean, APPNAME] + LOCALENIB do
	sh %{
	mkdir -p "#{APPNAME}.app/Contents/MacOS"
	mkdir    "#{APPNAME}.app/Contents/Resources"
	cp -rp #{RESOURCES.join(' ')} "#{APPNAME}.app/Contents/Resources"
	cp '#{APPNAME}' "#{APPNAME}.app/Contents/MacOS"
	echo -n "APPL????" > "#{APPNAME}.app/Contents/PkgInfo"
	echo -n #{APPVERSION} > "#{APPNAME}.app/Contents/Resources/APPVERSION"
	}
	File.open("#{APPNAME}.app/Contents/Info.plist", "w") do |f|
		f.puts ERB.new(File.read("Info.plist.erb")).result
	end
end

file APPNAME => ['main.m'] do
	# Universal Binary
	sh %{gcc -arch ppc -arch i386 -Wall -lobjc -framework RubyCocoa main.m -o '#{APPNAME}'}
end

directory 'pkg'

