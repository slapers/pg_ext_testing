defmodule PgExt.URN.PgExtension do
  @moduledoc false

  @behaviour Postgrex.SuperExtension
  import Postgrex.BinaryUtils, warn: false

  def init(_), do: nil
  def format(_), do: :super_binary
  def matching(_), do: [type: "urn", send: "record_send"]

  def oids(%Postgrex.TypeInfo{comp_elems: []}, _), do: nil
  def oids(%Postgrex.TypeInfo{comp_elems: comp_oids}, _), do: comp_oids

  def encode(_) do
    quote do
      %PgExt.URN{nid: nid, nss: nss}, nil, _types ->
        # types and oids we get are not ok, so hardcoded inline

        case encode_tuple({nid, nss}, [1043, 1043], [
               Postgrex.Extensions.Raw,
               Postgrex.Extensions.Raw
             ]) do
          :error ->
            raise DBConnection.EncodeError, "unable to correctly encode urn"

          data ->
            [<<IO.iodata_length(data) + 4::int32, 2::int32>> | data]
        end

      tuple, oids, types when is_tuple(tuple) ->
        # encode_tuple/3 defined by TypeModule
        case encode_tuple(tuple, oids, types) do
          :error ->
            raise DBConnection.EncodeError,
                  "expected a tuple of size #{length(oids)}, got: #{inspect(tuple)}"

          data ->
            [<<IO.iodata_length(data) + 4::int32, tuple_size(tuple)::int32>> | data]
        end

      other, _, _ ->
        raise DBConnection.EncodeError, Postgrex.Utils.encode_msg(other, "a tuple")
    end
  end

  def decode(_) do
    quote do
      any, oids, types -> raise "not implemented"
    end
  end
end
