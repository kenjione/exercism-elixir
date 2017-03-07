defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune

  @planets %{
              earth: 31_557_600,
              mercury: 0.2408467,
              venus: 0.61519726,
              mars: 1.8808158,
              jupiter: 11.862615,
              saturn: 29.447498,
              uranus: 84.016846,
              neptune: 164.79132
            }

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    case planet do
      :earth -> seconds / @planets[:earth]
      ______ -> (1 / @planets[planet]) * (seconds / @planets[:earth])
    end
  end
end
