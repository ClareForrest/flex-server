class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name
      t.integer :cost

      t.timestamps
    end
  end
end

# note - to add the relevant services you go to rails console and just do something like:
# Service.create () etc. This is acceptable for the project - however in a live business
# environment a form needs to be developed to allow a layperson (the business-owner) to add/remove relevant services.