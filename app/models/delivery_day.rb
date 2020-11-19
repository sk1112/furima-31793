class DeliveryDay < ActiveHash::Base
  self.data = [
    {id: 1, name: '--'}, {id: 2, name: '1〜2日で発想'}, {id: 3, name: '2〜3日で発想'},
    {id: 4, name: '4〜7日で発想'}
]

  include ActiveHash::Associations
  has_many :items

end
