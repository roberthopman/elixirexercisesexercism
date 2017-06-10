defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
    @earth 31557600

    @planets %{
    earth: @earth,
    neptune: 164.79132 * @earth,
    uranus: 84.016846 * @earth,
    saturn: 29.447498 * @earth,
    jupiter: 11.862615 * @earth,
    mars: 1.8808158 * @earth,
    venus: 0.61519726 * @earth,
    mercury: 0.2408467 * @earth
  }

  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds / @planets[planet]
  end
end
