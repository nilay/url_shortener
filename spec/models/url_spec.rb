require 'rails_helper'

RSpec.describe Url, type: :model do
  it 'is not valid with missing attributes' do
    expect(Url.new).to_not be_valid
  end
  it 'is not valid without a url' do
    url = Url.new(url: nil)
    expect(url).to_not be_valid
  end
  it 'is valid with a valid attributes' do
    url = Url.new(url: 'http://someurl.com')
    expect(url).to be_valid
  end
  it 'generate unique slug before save' do
    u = Url.create(url: 'http://somewhere.com')
    u.slug.should_not be_blank
  end
end
