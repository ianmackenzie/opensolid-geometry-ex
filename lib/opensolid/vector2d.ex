defmodule OpenSolid.Vector2d do
  alias OpenSolid.Vector2d

  defstruct x: 0.0, y: 0.0

  def zero do
    %Vector2d{x: 0.0, y: 0.0}
  end

  def in_(direction, length_) do
    %Vector2d{x: length_ * direction.x, y: length_ * direction.y}
  end

  def dot(first_vector, second_vector) do
    first_vector.x * second_vector.x + first_vector.y * second_vector.y
  end

  def cross(first_vector, second_vector) do
    first_vector.x * second_vector.y - first_vector.y * second_vector.x
  end

  def squared_length(vector) do
    vector.x * vector.x + vector.y * vector.y
  end

  def length(vector) do
    :math.sqrt(squared_length(vector))
  end

  def component_in(vector, direction) do
    vector.x * direction.x + vector.y * direction.y
  end

  def to_json(vector) do
    [vector.x, vector.y]
  end

  def from_json(json) do
    with [x, y] when is_number(x) and is_number(y) <- json do
      {:ok, %Vector2d{x: x, y: y}}
    else
      _ -> {:error, {"Could not decode Vector2d", json}}
    end
  end
end
