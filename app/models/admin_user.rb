class AdminUser < ApplicationRecord
  # configuration if you dont follow rails naming convention
  # self.table_name = "admin_users"

  #relation 
  has_and_belongs_to_many = :pages
end
