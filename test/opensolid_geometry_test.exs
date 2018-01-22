defmodule OpenSolid.Geometry.Test do
  use ExUnit.Case

  alias OpenSolid.Vector2d

  doctest OpenSolid.Vector2d

  test "simple" do
    assert Vector2d.zero() == Vector2d.from_components({0, 0})
    {x, y} = Vector2d.components(Vector2d.zero())
    assert x == 0
    assert y == 0
    vector = Vector2d.from_components({2, 3})
    assert Vector2d.x_component(vector) == 2
  end
end
