defmodule OpenSolid.Point2d do
  alias OpenSolid.Vector2d

  @opaque t :: {:point2d, {number, number}}

  @spec origin :: t
  def origin do
    {:point2d, {0.0, 0.0}}
  end

  @spec from_coordinates({number, number}) :: t
  def from_coordinates(coordinates) do
    {:point2d, coordinates}
  end

  @spec from_coordinates(number, number) :: t
  def from_coordinates(x, y) do
    {:point2d, {x, y}}
  end

  @spec coordinates(t) :: {number, number}
  def coordinates(point) do
    {:point2d, coordinates_} = point
    coordinates_
  end

  @spec from_coordinates_in_frame(number, number, term) :: t
  def from_coordinates_in_frame(x, y, frame) do
    {:frame2d, origin_point, x_direction, y_direction} = frame
    {x0, y0} = coordinates(origin_point)
    {:direction2d, {x1, y1}} = x_direction
    {:direction2d, {x2, y2}} = y_direction
    {:point2d, {x0 + x * x1 + y * x2, y0 + x * y1 + y * y2}}
  end

  @spec from_coordinates_in_frame({number, number}, term) :: t
  def from_coordinates_in_frame(coordinates, frame) do
    {x, y} = coordinates
    from_coordinates_in_frame(x, y, frame)
  end

  @spec vector_to(t, t) :: Vector2d.t()
  def vector_to(first_point, second_point) do
    {x1, y1} = coordinates(first_point)
    {x2, y2} = coordinates(second_point)
    Vector2d.from_components(x2 - x1, y2 - y1)
  end

  @spec distance_along(t, term) :: number
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
  def from_json([x, y]) when is_number(x) and is_number(y) do
    {:point2d, {x, y}}
  end
end
