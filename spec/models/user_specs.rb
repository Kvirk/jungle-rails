require "rails_helper"

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'False if password less than 4' do
      user = (User.create(name: "who",
        last_name: 'what',
        email: "sdfsads@sadasd.com",
        password: "hlo",
        password_confirmation: "hlo"))
      expect(user.persisted?).to be_falsey
    end
    it 'No save if password and conifrmation are different' do
      expect {(User.create(name: "who",
        last_name: 'what',
        email: "sdfsads@sadasd.com",
        password: "hello",
        password_confirmation: "hell"))}.to raise_error(UncaughtThrowError)
    end
    it 'Save if password and conifrmation are the same' do
      expect {(User.create(name: "who",
        last_name: "what",
        email: "sdfsads@sadasd.com",
        password: "hello",
        password_confirmation: "hello"))}.to_not raise_error(UncaughtThrowError)
    end
    it 'No save if password isnt there' do
      user = (User.create(name: "who",
        last_name: 'what',
        email: "sdfsads@sadasd.com"))
      expect(user.persisted?).to be_falsey
    end
    it 'No save if last name isnt there' do
      user = (User.create(name: "who",
        email: "sdfsads@sadasd.com",
        password: "hello",
        password_confirmation: "hello"))
      expect(user.persisted?).to be_falsey
    end
    it 'No save if first name isnt there' do
      user = (User.create(last_name: "who",
        email: "sdfsASAs@sadasd.com",
        password: "hello",
        password_confirmation: "hello"))
      expect(user.persisted?).to be_falsey
    end
    it 'Save if with needed details isnt there' do
      user = (User.create(name: "asdas",
        last_name: "who",
        email: "sdfsASAs@sadasd.com",
        password: "hello",
        password_confirmation: "hello"))
      expect(user.persisted?).to be_truthy
    end
    it 'No save if creating the same email isnt there' do
      user = (User.create(name: "who",
        last_name: "asdsa",
        email: "sdfsads@sadasd.com",
        password: "hello",
        password_confirmation: "hello"))
      user2 = (User.create(name: "sdsa",
        last_name: "what",
        email: "sdfsads@sadasd.com",
        password: "helllo",
        password_confirmation: "helllo"))
      expect(user2.persisted?).to be_falsey
    end
     it 'No save if creating the same email isnt there (capitalize)' do
      user = (User.create(name: "who",
        last_name: "asdsa",
        email: "sDfsads@sadasd.com",
        password: "hello",
        password_confirmation: "hello"))
      user2 = (User.create(name: "sdsa",
        last_name: "what",
        email: "sdfSads@sadasd.com",
        password: "helllo",
        password_confirmation: "helllo"))
      expect(user2.persisted?).to be_falsey
    end
  end

  describe '.authenticate_with_credentials' do
    it 'Should return true if user has right info to logged in (wrong case for email)' do
      user = (User.create!(name: "who",
        last_name: "asdsa",
        email: "sdFsads@sadasd.com",
        password: "hello",
        password_confirmation: "hello"))
      user_read = User.authenticate_with_credentials("sdfsads@sadasd.com", "hello")
      expect(user_read).to_not be_nil
    end
    it 'Should return nil with wrong info' do
      user = (User.create!(name: "who",
        last_name: "asdsa",
        email: "sdFsads@sadasd.com",
        password: "hello",
        password_confirmation: "hello"))
      user_read = User.authenticate_with_credentials("sdfsads@sadasd.com", "hllo")
      expect(user_read).to be_nil
    end
    it 'email with spaces. Should return true' do
      user = (User.create!(name: "Iam",
        last_name: "asdsa",
        email: "sdFsads@sadasd.com",
        password: "hello",
        password_confirmation: "hello"))
      user_read = User.authenticate_with_credentials("sdfsads@sadasd.com ", "hello")
      expect(user_read).to_not be_nil
    end
  end
end