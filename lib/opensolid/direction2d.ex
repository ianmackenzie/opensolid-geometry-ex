defmodule OpenSolid.Direction2d do
  def from_components components do
    {:direction2d, components}
  end

  def components {:direction2d, components} do
    components
  end

  def x do
    from_components {1.0, 0.0}
  end

  def y do
    from_components {0.0, 1.0}
  end

  def x_component direction do
    elem (components direction), 0
  end

  def y_component direction do
    elem (components direction), 1
  end
end
