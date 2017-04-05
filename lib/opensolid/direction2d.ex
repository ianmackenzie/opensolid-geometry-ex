defmodule OpenSolid.Direction2d do
  alias OpenSolid.Geometry.Types

  @type direction2d :: Types.direction2d

  @spec from_components({number, number}) :: direction2d
  def from_components(components) do
    {:direction2d, components}
  end

  @spec from_components(number, number) :: direction2d
  def from_components(x, y) do
    from_components({x, y})
  end

  @spec components(direction2d) :: {number, number}
  def components(direction) do
    {:direction2d, components} = direction
    components
  end

  @spec x :: direction2d
  def x do
    from_components(1.0, 0.0)
  end

  @spec y :: direction2d
  def y do
    from_components(0.0, 1.0)
  end

  @spec x_component(direction2d) :: number
  def x_component(direction) do
    elem((components direction), 0)
  end

  @spec y_component(direction2d) :: number
  def y_component(direction) do
    elem((components direction), 1)
  end
end
