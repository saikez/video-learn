require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '.count' do
    it 'counts two comments' do
      create_pair(:comment)
      expect(Comment.count).to eq(2)
    end
  end
end
