#!/usr/bin/env ruby
require 'json'
require 'pg'
require_relative 'utility'


def connect(database)
    user = ''
    if database == "landcharges"
      user = "landcharges"
    elsif database == "working"
      user = "lc-working-data"
    elsif database == "db2"
      user = "lc-db2-mock"
    elsif database == "docstore"
      user = "lc-documents"
    end


    PGconn.connect( 'localhost', 5432,  '', '', database, user, 'lcalpha')
end

def disconnect(connection)
    connection.close
end

def save()
end

def execute(clear, setup, save = false, quiet = false)
    puts "execute"

    #if File.directory?("/vagrant/apps")
    #    folders = Dir["/vagrant/apps/*"]
    #else
    #    folders = Dir["/opt/landregistry/applications/*/source"]
    #end

    folder = File.expand_path("../..", File.dirname(__FILE__))
    if clear
        out = `ruby "#{folder}/data/lc-clear.rb"`
        puts "  #{out}" unless(quiet)
        out = `ruby "#{folder}/data/cw-clear.rb"`
        puts "  #{out}" unless(quiet)
    end

    if setup
        out = `ruby "#{folder}/data/lc-setup.rb"`
        puts "  #{out}" unless(quiet)
        out = `ruby "#{folder}/data/cw-setup.rb"`
        puts "  #{out}" unless(quiet)
    end


    #puts folders

    #folders.each do |folder|
    #    puts "Processing #{folder}" unless(quiet)
#
#        if clear
#            puts("  clear") unless(quiet)
#            if File.exists?("#{folder}/data/delete.py")
#                out = `python3 #{folder}/data/delete.py`
#                puts out unless(quiet)
#            end#
#
#            if File.exists?("#{folder}/data/clear.rb")
#                out = `ruby "#{folder}/data/clear.rb" #{folder}`
#                puts out unless(quiet)
#            end
#        end
#    end
    
#    folders.each do |folder|
#        if setup
#            puts("  setup") unless(quiet)#
#
#            if File.exists?("#{folder}/data/load.py")
#                out = `python3 #{folder}/data/load.py`
#                puts out unless(quiet)
#            end
#
#
 #           if File.exists?("#{folder}/data/setup.rb")
 #               out = `ruby "#{folder}/data/setup.rb" #{folder}`
 #               puts out unless(quiet)
 #           end
 #       end

  #  end
end

def clear_data
    execute(true, false, false)
end

def setup_data
    execute(false, true, false)
end

def reset_data
    execute(true, true, false, true)
end

puts __FILE__
puts $0

if __FILE__ == $0
    clear = false
    setup = false
    if ARGV.length == 0
        clear = true
        setup = true
        save = false
    else
        clear = ARGV.include?('clear')
        setup = ARGV.include?('setup')
        save = ARGV.include?('save')
    end
    execute(clear, setup, save)
end



