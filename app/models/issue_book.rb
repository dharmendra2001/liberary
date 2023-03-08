class IssueBook < ApplicationRecord
    belongs_to :user
    belongs_to :book
end
