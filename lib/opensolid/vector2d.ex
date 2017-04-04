defmodule OpenSolid.Vector2d do
  def from_components components do
    {:vector2d, components}
  end

  def components {:vector2d, components} do
    components
  end

  def zero do
    from_components {0.0, 0.0}
  end

  def x_component vector do
    elem (components vector), 0
  end

  def y_component vector do
    elem (components vector), 1
  end

  def dot v1, v2 do
    {x1, y1} = components v1
    {x2, y2} = components v2
    x1 * x2 + y1 * y2
  end

  def cross v1, v2 do
    {x1, y1} = components v1
    {x2, y2} = components v2
    x1 * y2 - y1 * x2
  end

  def squared_length vector do
    {x, y} = components vector
    x * x + y * y
  end

  def length vector do
    :math.sqrt (squared_length vector)
  end

  def component_in vector, {:direction2d, {dx, dy}} do
    {vx, vy} = components vector
    vx * dx + vy * dy
  end
end
