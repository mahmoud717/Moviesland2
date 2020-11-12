require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'validations' do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:title) }
  end
  context 'associations' do
    it { should have_many(:votes) }
    it { should belong_to(:category) }
    it { should belong_to(:user) }
    it { should have_many(:comments) }
  end
end
