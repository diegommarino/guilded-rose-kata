class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    if @name == "Aged Brie"
      aged_brie
    elsif @name == "Backstage passes to a TAFKAL80ETC concert"
      backstage
    elsif @name == "Sulfuras, Hand of Ragnaros"
      return
    else
      other_itens
    end
  end

  private

  def other_itens
    if @quality > 0
      @quality -= 1
    end

    @days_remaining -= 1

    if @days_remaining < 0 && @quality > 0
      @quality -= 1
    end
  end

  def aged_brie
    if @quality < 50
      @quality += 1
    end

    @days_remaining -= 1

    if @days_remaining < 0 && @quality < 50
      @quality += 1
    end
  end

  def backstage
    if @quality < 50
      @quality += 1
      if @days_remaining < 11
        @quality += 1
      end
      if @days_remaining < 6
        @quality += 1
      end
    end

    @days_remaining -= 1

    if @days_remaining < 0
      @quality = 0
    end
  end
end
