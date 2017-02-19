class ChangeBeerStyle < ActiveRecord::Migration
  def change
    add_column :beers, :style_id, :integer
    Beer.all.each do |b|
      if b.style=="Lager"
        b.style_id=1
      end
      if b.style=="Weizen"
        b.style_id=2
      end
      if b.style=="IPA"
        b.style_id=3
      else
        b.style_id=4
      end
      b.save
    end
    remove_column :beers, :style, :string
  end
end
