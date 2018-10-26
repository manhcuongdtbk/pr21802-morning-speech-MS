require "rails_helper"

RSpec.describe SpeechTheme, type: :model do

  describe "Associations" do
    it {is_expected.to belong_to(:speech)}
    it {is_expected.to belong_to(:theme)}
  end
end
