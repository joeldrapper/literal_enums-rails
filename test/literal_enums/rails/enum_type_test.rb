require "test_helper"

module LiteralEnums
  module Rails
    class EnumTypeTest < ActiveSupport::TestCase
      setup do
        @article = Article.create(status: Article::Status::Published).reload
      end

      test "casts to enum constant" do
        assert_equal Article::Status::Published, @article.status
      end

      test "serializes to string" do
        assert_equal "PUBLISHED", @article.attributes_for_database["status"]
      end

      test "lookup" do
        assert_equal Article.find_by(status: Article::Status::Published), @article
      end
    end
  end
end
