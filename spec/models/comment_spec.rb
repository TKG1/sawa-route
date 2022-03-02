require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validation' do
    it 'is valid with all attributes' do
      comment = build(:comment)
      expect(comment).to be_valid
      expect(comment.errors).to be_empty
    end

    it 'is invalid without a text' do
      comment_without_text = build(:comment, text: '')
      expect(comment_without_text).to be_invalid
      expect(comment_without_text.errors[:text]).to include('を入力してください')
    end

    context 'when the number of characters is 65535 or less' do
      it 'is valid' do
        comment_with_text_65_535_characters_or_less = build(:comment, text: ('a' * rand(0..65_535)))
        expect(comment_with_text_65_535_characters_or_less).to be_valid
        expect(comment_with_text_65_535_characters_or_less.errors).to be_empty
      end
    end

    context 'when the number of characters is just 65535' do
      it 'is valid' do
        comment_with_text_65_535_characters = build(:comment, text: 'a' * 65_535)
        expect(comment_with_text_65_535_characters).to be_valid
        expect(comment_with_text_65_535_characters.errors).to be_empty
      end
    end

    context 'when the number of characters is more than 65535' do
      it 'is invalid' do
        comment_with_text_more_than_65_535_characters =
          build(:comment, text: ('a' * rand(65_536..75_536)))
        expect(comment_with_text_more_than_65_535_characters).to be_invalid
        expect(comment_with_text_more_than_65_535_characters.errors[:text]).to include(
          'は65535文字以内で入力してください'
        )
      end
    end
  end
end
