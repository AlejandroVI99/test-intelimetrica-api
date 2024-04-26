json.statistics do
  json.restaurants @statistics[:count]
  json.avg @statistics[:avg]
  json.std @statistics[:std]
end
