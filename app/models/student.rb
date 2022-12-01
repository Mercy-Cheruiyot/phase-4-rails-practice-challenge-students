class Student < ApplicationRecord
    validates :name ,presence:true
    validates :major ,presence:true
    validates :age ,presence:true,numericality: {minimum: 18}
    belongs_to :instructor
end
