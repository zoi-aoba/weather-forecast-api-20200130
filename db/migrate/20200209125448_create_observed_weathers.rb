class CreateObservedWeathers < ActiveRecord::Migration[5.2]
  def change
    create_table :observed_weathers do |t|

      t.timestamps
    end
  end
end
