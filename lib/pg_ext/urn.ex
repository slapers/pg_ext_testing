defmodule PgExt.URN do
  @moduledoc "Represents a URN. See https://tools.ietf.org/html/rfc8141"
  @behaviour Ecto.Type
  defstruct [:nid, :nss]

  def type, do: :urn
  def new(nid, nss), do: {:ok, %__MODULE__{nid: nid, nss: nss}}
  def cast(%__MODULE__{} = urn), do: {:ok, urn}
  def cast({nid, nss}), do: new(nid, nss)
  def load(%__MODULE__{} = urn), do: {:ok, urn}
  def dump(urn), do: {:ok, urn}
end
