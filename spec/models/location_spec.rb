require "rails_helper"

RSpec.describe Location, type: :model do

  describe "Associations" do
    it {is_expected.to have_many(:speeches)}
    it {is_expected.to have_many(:users)}
  end

  describe "Validations" do
    it {is_expected.to validate_presence_of(:name)}
  end
end
