using ArgParse

function parse_commandline()
    s = ArgParseSettings()

    @add_arg_table s begin
        "arg1"
            arg_type = Int
            help = "The integer to calculate primes up to"
            required = true
    end

    return parse_args(s)
end

parsed_args = parse_commandline()

n = parsed_args["arg1"]

primes = [2]
list = 2:n
p = 2

done = false
while ~done
    global list = [x for x in list if x % p != 0]

    if isempty(list)
        global done = true
        break
    end

    global p = first(list)
    push!(primes, p)
end

for num in primes
    println(num)
end
