class RegistryItem
  attr_accessor :uuid, :title, :price, :qty, :image, :description, :unit_name

  def initialize(title, price, qty, description, image, unit_name = nil)
    @uuid ||= SecureRandom.uuid
    @title = title
    @price = price.round(2)
    @qty = qty.to_i
    @image = image
    @description = description
    @unit_name = unit_name
  end

  def as_json(options = {})
    super(options).merge!({
      :price_humanized => price_humanized,
      :qty_humanized => qty_humanized
    })
  end

  def price_humanized
    if @unit_name.blank?
      return price
    else
      return "#{price} a #{unit_name}"
    end
  end

  def qty_humanized
    if @unit_name.blank?
      return qty
    else
      return "#{qty} #{unit_name.pluralize(qty)}"
    end
  end

  def can_gift?
    return @qty > 0
  end

  def gift
    # Stubbed
  end

end
