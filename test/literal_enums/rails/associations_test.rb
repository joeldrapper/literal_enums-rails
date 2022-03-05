require "test_helper"

module LiteralEnums
  module Rails
    class AssociationsTest < ActiveSupport::TestCase
      def test_simple_association_with_common_namespace
        Article.expects(:where).with(status: Article::Status::Draft).once
        Article.expects(:where).with(article_status: Article::Status::Draft).never

        Article::Status::Draft.articles
      end

      def test_association_without_common_namespace
        ArticleChangeLog.expects(:where).with(article_status: Article::Status::Draft)

        Article::Status::Draft.article_change_logs
      end

      def test_association_with_custom_class_name
        ArticleChangeLog.expects(:where).with(article_status: Article::Status::Draft)

        Article::Status::Draft.changes
      end

      def test_association_with_custom_field_name
        Event.expects(:where).with(introduction_article_status: Article::Status::Draft)
        
        Article::Status::Draft.events
      end
    end
  end
end
