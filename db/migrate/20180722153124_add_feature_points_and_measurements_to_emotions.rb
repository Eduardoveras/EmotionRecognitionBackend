class AddFeaturePointsAndMeasurementsToEmotions < ActiveRecord::Migration[5.2]
  def change
    add_column :emotions, :measurements, :jsonb
    add_column :emotions, :featurePoints, :jsonb
  end
end
