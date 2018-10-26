require "rails_helper"

RSpec.describe Speech, type: :model do

  describe "Associations" do
    it {is_expected.to belong_to(:user)}
    it {is_expected.to belong_to(:location)}
  end

  describe "Validations" do
    it {is_expected.to validate_presence_of(:title)}
    it {is_expected.to validate_presence_of(:content)}
    it {is_expected.to validate_presence_of(:speaking_day)}
  end
end
