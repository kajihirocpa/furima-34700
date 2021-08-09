require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    
    context "保存できる場合" do
      
      it "name,email.password,password_confirmation,first_name,family_name.read_first,read_family,birth_dayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
  
      it "passwordが6文字以上かつ英数字混合であれば登録できる" do
        @user.password = "123abc"
        @user.password_confirmation = "123abc"
        expect(@user).to be_valid
      end
    end

    context "保存できない場合" do
    
      it "nameが空だと登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailが存在すると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailが@を含んでいないと登録できない" do
        @user.email = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角数字のみでは登録できない" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが半角英字のみでは登録できない" do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが全角では登録できない" do
        @user.password = "１２３ａｂｃ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordとpassword_confirmationの値が一致していないと登録できない" do
        @user.password = "123abc"
        @user.password_confirmation = "abc123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it "passwordが存在しても、password_confirmationが空だと登録できない" do
        @user.password = "123abc"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "first_nameが全角(漢字・ひらがな・カタカナ)でないと登録できない" do
        @user.first_name = "111"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "family_nameが全角(漢字・ひらがな・カタカナ)でないと登録できない" do
        @user.family_name = "111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end

      it "read_firstが空だと登録できない" do
        @user.read_first = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Read first can't be blank")
      end

      it "read_firstが全角(カタカナ)でないと登録できない" do
        @user.read_first = "111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Read first is invalid")
      end

      it "read_familyが空だと登録できない" do
        @user.read_family = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Read family can't be blank")
      end

      it "read_familyが全角(カタカナ)でないと登録できない" do
        @user.read_family = "111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Read family is invalid")
      end

      it "birth_dayが空だと登録できない" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
