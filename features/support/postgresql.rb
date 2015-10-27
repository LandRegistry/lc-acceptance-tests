class PostgreSQL
  def self.connect(database)
    @@pg = PGconn.connect($POSTGRES_HOST, $POSTGRES_PORT,  '', '', database, $POSTGRES_USER, $POSTGRES_PASSWORD)
  end
  
  def self.disconnect
    @@pg.close
  end
  
  def self.query(sql)
    @@pg.exec(sql)
  end
end