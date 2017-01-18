defmodule PipeOperatorWhile do

  # funcs = list of function/1 with return type boolean
  # TODO how to test in "when" clause or by compiler
  def apply_while(funcs, enumerable) when is_list(funcs) and is_list(enumerable) do
    _apply_while(funcs, enumerable, {:cont, []})
  end

  defp _apply_while([], _, {_, ran}) do
    ran
  end

  defp _apply_while(_, _, {:halt, ran}) do
    ran
  end

  defp _apply_while funcs=[head={_,func}|tail], enumerable, {:cont, ran} do
    case func.(enumerable) do
      true  -> _apply_while(tail, enumerable, {:cont, [head|ran]})
      false -> _apply_while(funcs, enumerable, {:halt, ran})
    end
  end

end


defmodule EnumAppendix do

  def take_while(enumerable, func) when is_list(enumerable) and is_function(func,1) do
    _take_while(enumerable, {:cont, []}, func)
  end

  defp _take_while([], {:cont, taken}, _func) do
    taken
  end

  defp _take_while(_, {:halt, taken}, _func) do
    taken
  end

  defp _take_while(not_taken=[head|tail], {:cont, taken}, func) do
    case func.(head) do
      true  -> _take_while(tail, {:cont, [head|taken]}, func)
      false -> _take_while(not_taken, {:halt, taken}, func)
    end
  end
 
end


defmodule Main do
  data = [3, 5, 1, 7, 9]
  funcs = [ {:has_one, fn x -> x |> Enum.any?(fn y -> y == 1 end) end},
            {:is_empty, fn x -> x |> Enum.empty?() end } ]

  IO.inspect PipeOperatorMatch.apply_while funcs, data
  IO.inspect EnumAppendix.take_while data, fn x -> x < 6 end
  
end
