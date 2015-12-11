defmodule Champions.Battle do
  use Champions.Web, :model

  schema "battles" do
    field :title, :string
    field :description, :string
    belongs_to :attacker, Champions.Attacker
    belongs_to :defender, Champions.Defender
    belongs_to :victor, Champions.Victor

    timestamps
  end

  @required_fields ~w(title description)
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
