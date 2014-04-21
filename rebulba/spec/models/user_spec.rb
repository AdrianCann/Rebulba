require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user)}

  context "validates username and password" do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should ensure_length_of(:password).is_at_least(6) }

    it { should have_many(:posts) }

  end
end


