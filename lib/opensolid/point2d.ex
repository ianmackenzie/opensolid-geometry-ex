defmodule OpenSolid.Point2d do
  alias OpenSolid.Vector2d

  @opaque t :: {:point2d, {float, float}}

  @spec origin :: t
  def origin do
    {:point2d, {0.0, 0.0}}
  end

  @spec from_coordinates({float, float}) :: t
  def from_coordinates({x, y} = coordinates) when is_float(x) and is_float(y) do
    {:point2d, coordinates}
  end

  @spec from_coordinates(float, float) :: t
  def from_coordinates(x, y) when is_float(x) and is_float(y) do
    {:point2d, {x, y}}
  end

  @spec coordinates(t) :: {float, float}
  def coordinates(point) do
    {:point2d, coordinates_} = point
    coordinates_
  end

  @spec vector_to(t, t) :: Vector2d.t
  def vector_to(first_point, second_point) do
    {x1, y1} = coordinates(first_point)
    {x2, y2} = coordinates(second_point)
    Vector2d.from_components(x2 - x1, y2 - y1)
  end

  @spec distance_along(t, term) :: float
  def distance_along(point, axis) do
    {:axis2d, origin_point, direction} = axis
    displacement = vector_to(origin_point, point)
    Vector2d.component_in(displacement, direction)
  end

  @spec to_json(t) :: term
  def to_json(point) do
    {x, y} = coordinates(point)
    [x, y]
  end

  @spec from_json(term) :: t
  def from_json([x, y]) when is_float(x) and is_float(y) do
    {:point2d, {x, y}}
  end
end
