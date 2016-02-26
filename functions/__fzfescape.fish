function __fzfescape
  while read item
    echo -n (echo -n "$item" | sed -E 's/([ "$~'\''([{<>})&])/\\\\\\1/g')' '
  end
end