require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
  context 'associations' do
    it { should have_many(:votes) }
    it { should have_many(:articles) }
    it { should have_many(:comments) }
  end
end
