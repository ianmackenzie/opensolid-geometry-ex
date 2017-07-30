defmodule OpenSolid.Axis2d do
  alias OpenSolid.Axis2d
  alias OpenSolid.Point2d
  alias OpenSolid.Direction2d

  @enforce_keys [:direction]
  defstruct origin_point: Point2d.origin, direction: nil

  def x do
    %Axis2d{origin_point: Point2d.origin, direction: Direction2d.positive_x}
  end

  def to_json(axis) do
    %{"originPoint" => axis.origin_point, "direction" => axis.direction}
  end

  def from_json(json) do
    with %{"originPoint" => origin_point_json, "direction" => direction_json} <- json,
      {:ok, origin_point} <- Point2d.from_json(origin_point_json),
      {:ok, direction} <- Direction2d.from_json(direction_json) do
      {:ok, %Axis2d{origin_point: origin_point, direction: direction}}
    else
      {:error, reason} -> {:error, {"Could not decode Axis2d", reason}}
      ^json -> {:error, {"Could not decode  Axis2d", json}}
    end
  end
end
