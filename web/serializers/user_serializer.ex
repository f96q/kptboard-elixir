defmodule Kptboard.UserSerializer do
  use Kptboard.Web, :model

  def serialize(user) do
    Map.take(user, [:id, :name])
  end
end
