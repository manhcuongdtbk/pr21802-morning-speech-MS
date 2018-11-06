json.speeches do
  json.array!(@speeches) do |speech|
    json.title speech.title
    json.url speech_path(speech)
  end
end
