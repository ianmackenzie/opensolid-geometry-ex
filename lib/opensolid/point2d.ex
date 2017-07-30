defmodule OpenSolid.Point2d do
  alias OpenSolid.Point2d

  defstruct x: 0.0, y: 0.0

  def origin do
    %Point2d{x: 0.0, y: 0.0}
  end

  def to_json(point) do
    [point.x, point.y]
  end

  def from_json(json) do
    with [x, y] when is_number(x) and is_number(y) <- json do
      {:ok, %Point2d{x: x, y: y}}
    else
      _ -> {:error, {"Could not decode Point2d", json}}
    end
  end
end
