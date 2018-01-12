defmodule OpenSolid.Direction2d do
  @opaque t :: {:direction2d, {float, float}}

  @spec positive_x :: t
  def positive_x do
    {:direction2d, {1.0, 0.0}}
  end

  @spec negative_x :: t
  def negative_x do
    {:direction2d, {-1.0, 0.0}}
  end

  @spec positive_y :: t
  def positive_y do
    {:direction2d, {0.0, 1.0}}
  end

  @spec negative_y :: t
  def negative_y do
    {:direction2d, {0.0, -1.0}}
  end

  @spec x :: t
  def x do
    positive_x()
  end

  @spec y :: t
  def y do
    positive_y()
  end

  @spec components(t) :: {float, float}
  def components(direction) do
    {:direction2d, components_} = direction
    components_
  end

  @spec rotate_by(t, float) :: t
  def rotate_by(direction, angle) do
    {x, y} = components(direction)
    cos_angle = :math.cos(angle)
    sin_angle = :math.sin(angle)
    {:direction2d, {x * cos_angle - y * sin_angle, y * cos_angle + x * sin_angle}}
  end

  @spec to_json(t) :: term
  def to_json(direction) do
    {x, y} = components(direction)
    [x, y]
  end

  @spec from_json(term) :: t
  def from_json([x, y]) when is_float(x) and is_float(y) do
    {:direction2d, {x, y}}
  end
end
