class PostgreSQL
  def self.connect(database)
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

    puts "DB: #{database}; User: #{user}"
    @@pg = PGconn.connect($POSTGRES_HOST, $POSTGRES_PORT,  '', '', database, user, "lcalpha")
  end

  def self.disconnect
    @@pg.close
  end

  def self.query(sql)
    @@pg.exec(sql)
  end
end
