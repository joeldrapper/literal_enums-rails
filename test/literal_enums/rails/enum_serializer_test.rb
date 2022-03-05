require "test_helper"

module LiteralEnums
  module Rails
    class EnumSerializerTest < ActiveSupport::TestCase
      include ActiveJob::TestHelper

      test "serializes" do
        expected = {
          "_aj_serialized" => "LiteralEnums::Rails::EnumSerializer",
          "class" => "Article::Status",
          "value" => "PUBLISHED"
        }

        assert_equal expected, EnumSerializer.serialize(Article::Status::Published)
      end

      test "deserializes" do
        assert_equal Article::Status::Published, EnumSerializer.deserialize(
          EnumSerializer.serialize(Article::Status::Published)
        )
      end

      test "runs in a real job" do
        perform_enqueued_jobs do
          FindArticleJob.perform_later(
            status: Article::Status::Published
          )
        end
      end
    end
  end
end
