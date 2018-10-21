require_relative '../config/environment'

class SQLRunner
  def initialize(db)
    @db = db
  end

  def execute_schema_sql
    sql = File.read("lib/schema.sql")
    @db.execute_batch(sql)
  end

  def execute_insert_sql
    sql = File.read("lib/insert.sql")
    @db.execute_batch(sql)
  end

end
