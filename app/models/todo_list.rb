class TodoList
  include Mongoid::Document
  has_many :todo_items

  field :title, type: String
  field :description, type: String
  field :owner, type: String
end
