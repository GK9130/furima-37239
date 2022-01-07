require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    
    context '新規登録が可能な条件' do
      it '全項目が存在すれば登録が可能' do
        expect(@user).to be_valid
      end
    end

    context '新規登録/ユーザー情報の実装条件' do
      it 'ニックネームが必須であること' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが必須であること' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'メールアドレスに@を含む必要があること' do
        @user.email = 'abc.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'パスワードが必要があること' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが6字以上での入力が必須であること' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it 'パスワードが数字のみで入力すると登録できないこと' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードが英字のみで入力すると登録できないこと' do
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    context '新規登録/本人情報確認の実装条件' do
      it 'お名前(全角)は、名字が必須であること' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
      end
      it 'お名前(全角)は、名前が必須であること' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it 'お名前(全角)の名字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.family_name = 'natume'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
      end
      it 'お名前(全角)の名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name = 'souseki'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it 'お名前カナ(全角)の名字は、名字が必須であること' do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana カタカナを使用してください")
      end
      it 'お名前カナ(全角)の名前は、名前が必須であること' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana カタカナを使用してください")
      end
      it 'お名前カナ(全角)の名字は、全角（カタカナ）のフリガナの入力が必須であること' do
        @user.family_name_kana = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana カタカナを使用してください")
      end
      it 'お名前カナ(全角)の名前は、全角（カタカナ）のフリガナの入力が必須であること' do
        @user.first_name_kana = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana カタカナを使用してください")
      end
      it '生年月日が必須であること' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
