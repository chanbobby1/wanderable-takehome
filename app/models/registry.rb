class Registry
  attr_accessor :uuid, :couples, :date, :story, :honeymoon_details, :registry_items, :cover_image

  def initialize(couples, date)
    @uuid ||= SecureRandom.uuid
    @couples = couples
    if !(couples.kind_of?(Array) && couples.size >= 2)
      raise Exception.new("couples argument should be an array with at least 2 persons")
    end
    @date = date
    @registry_items = []
    @story = ""
    @honeymoon_details = ""
    @cover_image = ""
  end

  def date_formatted
    if @date.present?
      return @date.strftime("%B %e, %Y")
    else
      return nil
    end
  end

  def as_json(options = {})
    super(options).merge!({:title => title, :date_formatted => date_formatted})
  end

  def title
    return couples.map(&:full_name).join(" & ")
  end

  def add_item(item)
    @registry_items << item
  end

  def remove_item(item)
    @registry_items.delete(item)
  end
end
