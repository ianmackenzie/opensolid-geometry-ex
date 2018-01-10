defmodule OpenSolid.Vector2d do
  @opaque t :: {:vector2d, {float, float}}

  @spec zero :: t
  def zero do
    {:vector2d, {0.0, 0.0}}
  end

  @spec from_components({float, float}) :: t
  def from_components({x, y} = components) when is_float(x) and is_float(y) do
    {:vector2d, components}
  end

  @spec from_components(float, float) :: t
  def from_components(x, y) when is_float(x) and is_float(y) do
    {:vector2d, {x, y}}
  end

  @spec from_length_and_direction(float, term) :: t
  def from_length_and_direction(length_, direction) do
    {:direction2d, {dx, dy}} = direction
    {:vector2d, {length_ * dx, length_ * dy}}
  end

  @spec components(t) :: {float, float}
  def components(vector) do
    {:vector2d, components_} = vector
    components_
  end

  @spec dot_product(t, t) :: float
  def dot_product(first_vector, second_vector) do
    {x1, y1} = components(first_vector)
    {x2, y2} = components(second_vector)
    x1 * x2 + y1 * y2
  end

  @spec cross_product(t, t) :: float
  def cross_product(first_vector, second_vector) do
    {x1, y1} = components(first_vector)
    {x2, y2} = components(second_vector)
    x1 * y2 - y1 * x2
  end

  @spec squared_length(t) :: float
  def squared_length(vector) do
    {x, y} = components(vector)
    x * x + y * y
  end

  @spec length(t) :: float
  def length(vector) do
    :math.sqrt(squared_length(vector))
  end

  @spec component_in(t, term) :: float
  def component_in(vector, direction) do
    {vx, vy} = components(vector)
    {:direction2d, {dx, dy}} = direction
    vx * dx + vy * dy
  end

  @spec to_json(t) :: term
  def to_json(vector) do
    {x, y} = components(vector)
    [x, y]
  end

  @spec from_json(term) :: t
  def from_json([x, y]) when is_float(x) and is_float(y) do
    {:vector2d, {x, y}}
  end
end
