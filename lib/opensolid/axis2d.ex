defmodule OpenSolid.Axis2d do
    alias OpenSolid.Geometry.Types

    @type point2d :: Types.point2d
    @type direction2d :: Types.direction2d
    @type axis2d :: Types.axis2d

    @spec new(origin_point: point2d, direction: direction2d) :: axis2d
    def new(origin_point: origin_point, direction: direction) do
        {:axis2d, origin_point, direction}
    end

    @spec origin_point(axis2d) :: point2d
    def origin_point(axis) do
        {:axis2d, origin_point, _} = axis
        origin_point
    end

    @spec direction(axis2d) :: point2d
    def direction(axis) do
        {:axis2d, _, direction} = axis
        direction
    end
end
