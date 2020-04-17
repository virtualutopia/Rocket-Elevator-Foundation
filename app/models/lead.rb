class Lead < ActiveRecord::Base

      # validates :full_name, format: { with: /\A[A-Za-z0-9-\/\.\s]*\z/,
      #       message: "accepts only alphanumeric - . space" }
      # validates :business_name, format: { with: /\A[A-Za-z0-9-\/\.\s]*\z/,
      #       message: "accepts only alphanumeric - . space" }
      # validates :project_name, format: { with: /\A[A-Za-z0-9-\/\.\s]*\z/,
      #       message: "accepts only alphanumeric - . space" }
      # validates :project_description, format: { with: /\A[A-Za-z0-9-\/\.\s]*\z/,
      #       message: "accepts only alphanumeric - . space" }
      # validates :message, format: { with: /\A[A-Za-z0-9-\/\.\s]*\z/,
      #       message: "accepts only alphanumeric - . space" }
      # validates :phone, numericality: { only_integer: true ,
      #       message: "accepts only digits" }
end