#!/usr/bin/env ruby

# Example application to demonstrate some basic Ruby features
# This code loads a given file into an associated application

class Launcher
    def initialize app_map
        @app_map = app_map
    end

    # execute the given file using the associated app
    def run file_name
        application = select_app file_name
        system "#{application} #{file_name}"
    end

    # given a file, look up the matching application
    def select_app file_name
        ftype = file_type file_name
        @app_map[ ftype ]
    end

    # return the part of the file name after the last '.'
    def file_type file_name
        File.extname( file_name ).gsub( /^\./, '' ).downcase
    end
end

def help
    print "
    You must pass in path to the file to launch.

    Usage: #{__FILE__} target_file
"
end

if ARGV.empty?
    help
    exit
end

app_map = {
    'html' => 'firefox',
    'rb' => 'vim',
    'jpg' => 'gimp',
}


l = Launcher.new app_map
target = ARGV.join ' '
l.run target

