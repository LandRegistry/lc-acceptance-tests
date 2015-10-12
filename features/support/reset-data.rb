#!/usr/bin/env ruby
require 'json'
require 'pg'
require_relative 'utility'


def connect(database)
    PGconn.connect( 'localhost', 5432,  '', '', database, 'landcharges', 'lcalpha')
end

def disconnect(connection)
    connection.close
end

def save()
end

def execute(clear, setup, save = false, quiet = false)
    if File.directory?("/vagrant/apps")
        folders = Dir["/vagrant/apps/*"]
    else
        folders = Dir["/opt/landregistry/applications/*/source"]
    end

    folders.each do |folder|
        if File.directory?("#{folder}/data") && File.exists?("#{folder}/data/data.json")
            puts "Processing #{folder}" unless(quiet)
            info = JSON.parse(File.read("#{folder}/data/data.json"))

            db_name = info['name']
            tables = info['tables']

            conn = connect(db_name)
            if save
                #out_dir = "#{folder}/data/

                puts "  save" unless(quiet)
                tables.each do |table|
                    `psql #{db_name} -c "COPY #{table} TO '#{folder}/data/#{table}.txt' DELIMITER '|' CSV`
                end

                if File.exists?("#{folder}/data/save.rb")
                    `ruby "#{folder}/data/save.rb" #{folder}`
                end
            end

            if clear
                puts("  clear") unless(quiet)
                tables.each do |table|
                    conn.exec("DELETE FROM #{table}")
                end

                if File.exists?("#{folder}/data/clear.rb")
                    `ruby "#{folder}/data/clear.rb" #{folder}`
                end
            end

            if setup
                puts("  setup") unless(quiet)
                tables.reverse.each do |table|
                    # Credit: http://www.kadrmasconcepts.com/blog/2013/12/15/copy-millions-of-rows-to-postgresql-with-rails/
                    conn.exec("COPY #{table} FROM STDIN DELIMITER '|' CSV")
                    file = File.open("#{folder}/data/#{table}.txt", "r")
                    while !file.eof?
                        conn.put_copy_data(file.readline)
                    end
                    conn.put_copy_end

                    while res = conn.get_result
                        unless res.error_message == ""
                            puts res.error_message
                        end
                    end

                    if db_name != 'db2'
                        command = "SELECT setval('#{table}_id_seq', (SELECT MAX(id) FROM #{table})+1);"
                        conn.exec(command)
                    end
                end

                if File.exists?("#{folder}/data/setup.rb")
                    `ruby "#{folder}/data/setup.rb" #{folder}`
                end
            end
            disconnect(conn)

        end
    end
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



