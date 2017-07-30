defmodule OpenSolid.Direction2d do
  alias OpenSolid.Direction2d

  defstruct x: 0.0, y: 0.0

  def positive_x do
    %Direction2d{x: 1.0, y: 0.0}
  end

  def negative_x do
    %Direction2d{x: -1.0, y: 0.0}
  end

  def positive_y do
    %Direction2d{x: 0.0, y: 1.0}
  end

  def negative_y do
    %Direction2d{x: 0.0, y: -1.0}
  end

  def to_json(direction) do
    [direction.x, direction.y]
  end

  def from_json(json) do
    with [x, y] when is_number(x) and is_number(y) <- json do
      {:ok, %Direction2d{x: x, y: y}}
    else
      _ -> {:error, {"Could not decode Direction2d", json}}
    end
  end
end
