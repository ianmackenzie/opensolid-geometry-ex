defmodule OpenSolid.Axis2d do
  alias OpenSolid.Point2d
  alias OpenSolid.Direction2d

  @opaque t :: {:axis2d, Point2d.t(), Direction2d.t()}

  @spec x :: t
  def x do
    {:axis2d, Point2d.origin(), Direction2d.x()}
  end

  @spec y :: t
  def y do
    {:axis2d, Point2d.origin(), Direction2d.y()}
  end

  @spec origin_point(t) :: Point2d.t()
  def origin_point(axis) do
    {:axis2d, origin_point_, _} = axis
    origin_point_
  end

  @spec direction(t) :: Direction2d.t()
  def direction(axis) do
    {:axis2d, _, direction_} = axis
    direction_
  end

  @spec to_json(t) :: term
  def to_json(axis) do
    origin_point_json = Point2d.to_json(origin_point(axis))
    direction_json = Direction2d.to_json(direction(axis))
    %{"originPoint" => origin_point_json, "direction" => direction_json}
  end

  @spec from_json(term) :: t
  def from_json(json) do
    %{"originPoint" => origin_point_json, "direction" => direction_json} = json
    origin_point = Point2d.from_json(origin_point_json)
    direction = Direction2d.from_json(direction_json)
    {:axis2d, origin_point, direction}
  end
end
