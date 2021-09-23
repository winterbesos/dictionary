class Noun < ApplicationRecord
  has_many :records, -> {order(created_at: :desc)}
  has_one :search_counter, as: :countable
  has_many :reference_relations, as: :quoter

  validates :name, :s_name, :en_name, :en_s_name, uniqueness: true
  validates :name, :s_name, :en_name, :en_s_name, :description, presence: true

  after_create do |noun|
    noun.records.create(operation: '新增词条', content: noun.record_format)
    noun.create_search_counter(count: 0) if noun.search_counter.nil?
  end

  after_update do |noun|
    noun.records.create(operation: '更新词条', content: noun.record_format)
  end

  def record_format
    "简称 => #{s_name} 描述 => #{description} 英文名 => #{en_name} 英文简称 => #{en_s_name}"
  end

  def counter_increase
    create_search_counter(count: 0) if search_counter.nil?
    search_counter.update(count: search_counter.count + 1)
  end
  
end
