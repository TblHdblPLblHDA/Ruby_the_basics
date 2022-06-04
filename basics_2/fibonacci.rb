arr = [0, 5]

while arr[-1] <= 100
  arr.push (arr[-1] + arr[-2])
end

arr.delete_at(-1)

puts arr
