Before do 
  FakeWeb.register_uri(:any, /(.*)/, body: "Success", status: [204, ''])
end

After do
  FakeWeb.clean_registry
end
