defmodule OpenSolid.Vector2d do
  alias OpenSolid.Geometry.Types

  @type vector2d :: Types.vector2d
  @type direction2d :: Types.direction2d

  @spec from_components({number, number}) :: vector2d
  def from_components(components) do
    {:vector2d, components}
  end

  @spec from_components(number, number) :: vector2d
  def from_components(x, y) do
    from_components({x, y})
  end

  @spec components(vector2d) :: {number, number}
  def components(vector) do
    {:vector2d, components} = vector
    components
  end

  @spec zero :: vector2d
  def zero do
    from_components({0.0, 0.0})
  end

  @spec in_(direction2d, number) :: vector2d
  def in_(direction, length_) do
    {:direction2d, {dx, dy}} = direction
    from_components(length_ * dx, length_ * dy)
  end

  @spec x_component(vector2d) :: number
  def x_component(vector) do
    elem((components vector), 0)
  end

  @spec y_component(vector2d) :: number
  def y_component(vector) do
    elem((components vector), 1)
  end

  @spec dot(vector2d, vector2d) :: number
  def dot(firstVector, secondVector) do
    {x1, y1} = components(firstVector)
    {x2, y2} = components(secondVector)
    x1 * x2 + y1 * y2
  end

  @spec cross(vector2d, vector2d) :: number
  def cross(firstVector, secondVector) do
    {x1, y1} = components(firstVector)
    {x2, y2} = components(secondVector)
    x1 * y2 - y1 * x2
  end

  @spec squared_length(vector2d) :: number
  def squared_length(vector) do
    {x, y} = components(vector)
    x * x + y * y
  end

  @spec length(vector2d) :: number
  def length(vector) do
    :math.sqrt(squared_length(vector))
  end

  @spec component_in(vector2d, direction2d) :: number
  def component_in(vector, direction) do
    {vx, vy} = components(vector)
    {:direction2d, {dx, dy}} = direction
    vx * dx + vy * dy
  end
end
