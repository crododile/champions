defmodule Champions.Champion do
  use Champions.Web, :model

  schema "champions" do
    field :str, :integer
    field :agi, :integer
    field :int, :integer
    field :cha, :integer
    field :sta, :integer
    field :wis, :integer

    timestamps
  end

  @required_fields ~w(str agi int cha sta wis)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
