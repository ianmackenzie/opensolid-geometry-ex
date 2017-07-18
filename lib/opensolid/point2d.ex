defmodule OpenSolid.Point2d do
  alias OpenSolid.Geometry.Types

  @type vector2d :: Types.vector2d
  @type direction2d :: Types.direction2d
  @type point2d :: Types.point2d

  @spec from_coordinates({number, number}) :: point2d
  def from_coordinates(coordinates) do
    {:point2d, coordinates}
  end

  @spec from_coordinates(number, number) :: point2d
  def from_coordinates(x, y) do
    from_coordinates({x, y})
  end

  @spec coordinates(point2d) :: {number, number}
  def coordinates(point) do
    {:point2d, coordinates} = point
    coordinates
  end

  @spec origin :: point2d
  def origin do
    from_coordinates({0.0, 0.0})
  end

  @spec x_coordinate(point2d) :: number
  def x_coordinate(point) do
    elem((coordinates point), 0)
  end

  @spec y_coordinate(point2d) :: number
  def y_coordinate(point) do
    elem((coordinates point), 1)
  end
end
