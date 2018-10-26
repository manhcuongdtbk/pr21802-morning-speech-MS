require "rails_helper"

RSpec.describe User, type: :model do

  describe "Associations" do
    it {is_expected.to belong_to(:location)}
  end

  describe "Validations" do
    it {is_expected.to validate_presence_of(:email)}
    it {is_expected.to validate_presence_of(:password)}
    it {is_expected.to validate_confirmation_of(:password)}
    it {is_expected.to validate_length_of(:password).is_at_least(6)}
  end
end
