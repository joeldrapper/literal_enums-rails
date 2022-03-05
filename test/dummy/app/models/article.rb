class Article < ApplicationRecord
  class Status < Enum
    Draft("DRAFT")
    Published("PUBLISHED")

    has_many :articles
    has_many :article_change_logs
    has_many :changes, class_name: "ArticleChangeLog"
    has_many :events, as: :introduction_article_status
  end
  
  attribute :status, Enum[Article::Status]
end
