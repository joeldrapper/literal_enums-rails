module LiteralEnums
  module Rails
    class Railtie < ::Rails::Railtie
      initializer "literal_enums.configure_active_job_serializers" do
        ::Rails.application.config.active_job.custom_serializers << EnumSerializer
      end
    end
  end
end
