class FindArticleJob < ApplicationJob
  def perform(status:)
    Article.where(status: status)
  end
end
