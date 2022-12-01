class StudentSerializer < ActiveModel::Serializer
  attributes :name, :age, :major, :instructor_id
  belongs_to :instructor
end
