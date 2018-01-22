defmodule OpenSolid.Frame2d do
  alias OpenSolid.Point2d
  alias OpenSolid.Direction2d

  @opaque t :: {:frame2d, Point2d.t(), Direction2d.t(), Direction2d.t()}

  @spec xy :: t
  def xy do
    {:frame2d, Point2d.origin(), Direction2d.x(), Direction2d.y()}
  end

  @spec at_point(Point2d.t()) :: t
  def at_point(point) do
    {:frame2d, point, Direction2d.x(), Direction2d.y()}
  end

  @spec origin_point(t) :: Point2d.t()
  def origin_point(frame) do
    {:frame2d, origin_point_, _, _} = frame
    origin_point_
  end

  @spec x_direction(t) :: Direction2d.t()
  def x_direction(frame) do
    {:frame2d, _, x_direction_, _} = frame
    x_direction_
  end

  @spec y_direction(t) :: Direction2d.t()
  def y_direction(frame) do
    {:frame2d, _, _, y_direction_} = frame
    y_direction_
  end

  @spec rotate_by(t, float) :: t
  def rotate_by(frame, angle) do
    {
      :frame2d,
      origin_point(frame),
      Direction2d.rotate_by(x_direction(frame), angle),
      Direction2d.rotate_by(y_direction(frame), angle)
    }
  end

  @spec to_json(t) :: term
  def to_json(frame) do
    origin_point_json = Point2d.to_json(origin_point(frame))
    x_direction_json = Direction2d.to_json(x_direction(frame))
    y_direction_json = Direction2d.to_json(y_direction(frame))

    %{
      "originPoint" => origin_point_json,
      "xDirection" => x_direction_json,
      "yDirection" => y_direction_json
    }
  end

  @spec from_json(term) :: t
  def from_json(json) do
    %{
      "originPoint" => origin_point_json,
      "xDirection" => x_direction_json,
      "yDirection" => y_direction_json
    } = json

    origin_point = Point2d.from_json(origin_point_json)
    x_direction = Direction2d.from_json(x_direction_json)
    y_direction = Direction2d.from_json(y_direction_json)
    {:frame2d, origin_point, x_direction, y_direction}
  end
end
