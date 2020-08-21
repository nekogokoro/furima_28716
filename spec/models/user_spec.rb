require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  
  
  describe '#create' do

    
    it 'is invalid without a nick_name' do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("can't be blank")
    end

    it 'is invalid without a email' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("can't be blank")
    end

    it 'is invalid without a password' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("can't be blank")
    end

    it 'email need to @' do
      @user.email='asdasdasd'
      @user.valid?
      expect(@user.errors.full_messages).to include('is invalid')
    end

    it 'email is only one' do
      @user
      user_2 = build(:user)
      user_2.valid?
      expect(user_2.errors.full_messages).to include
    end

    it 'パスワードは6文字以上である事' do
      @user.password = '12qw', @user.password_confirmation = '12qw'
      @user.valid?
      expect(@user.errors.full_messages).to include('is too short (minimum is 6 characters)')
    end

    it 'パスワードは半角英数字混合である事' do
      @user.password  ='123456', @user.password_confirmation  = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('need 1~9&a~z')
    end

    it 'パスワードは確認用m含め2回記述する事' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("doesn't match Password")
    end

    it '名前を入力していないと登録できない事' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("can't be blank")
    end

    it '苗字を入力していないと登録できない事' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("can't be blank")
    end

    it '名前（読み）を入力していないと登録できない事' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("can't be blank")
    end

    it '苗字(読み)を入力していないと登録できない事' do
      @user = build.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("can't be blank")
    end

    it '名前は平仮名、片仮名、漢字いずれかで入力する必要がある事' do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('is invalid')
    end

    it '苗字は平仮名、片仮名、漢字いずれかで入力する必要がある事' do
      @user.last_name = 'zzz'
      @user.valid?
      expect(@user.errors.full_messages).to include('is invalid')
    end

    it '名前（読み）はカタカナで入力する必要がある事' do
      @user.first_name_kana = 'ああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('is invalid')
    end

    it '苗字(読み)はカタカナで入力する必要がある事' do
      @user.last_name_kana = 'いい'
      @user.valid?
      expect(@user.errors.full_messages).to include('is invalid')
    end

    it '生年月日の年が入力されている事' do
      @user.birthday = '0'
      @user.valid?
      expect(@user.errors.full_messages).to include('is invalid')
    end

    it '生年月日の月が入力されている事' do
      @user.birthday = '0'
      @user.valid?
      expect(@user.errors.full_messages).to include('is invalid')
    end

    it '生年月日の日が入力されている事' do
      @user.birthday  ='0'
      @user.valid?
      expect(@user.errors.full_messages).to include('is invalid')
    end
  end
end