require 'listen_sql/version'

require 'shellwords'
require 'coderay'

module ListenSql
  module_function

  def exec_sql(db_name, file, color: true)
    puts "File: #{file}"
    puts "Time: #{Time.now}"

    # Show original SQL
    puts "SQL: "
    sql = File.read(file)
    puts(color ? CodeRay.scan(sql, :sql).terminal : sql)

    # Show Resultset
    puts "Rows: "
    system(%(psql #{db_name} < #{Shellwords.escape file}))
  end
end
