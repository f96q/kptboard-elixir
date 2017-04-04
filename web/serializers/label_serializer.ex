defmodule Kptboard.LabelSerializer do
  use Kptboard.Web, :model

  def serialize(label) do
    Map.take(label, [:id, :description, :position, :inserted_at])
  end
end
