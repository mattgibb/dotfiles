# ActiveRecord sql helper
def sql(query)
    ActiveRecord::Base.connection.select_rows(query)
end
