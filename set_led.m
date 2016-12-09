function [ ] = set_led( s, p, v )

fwrite(s, p);
if v
    fwrite(s, 72);
else
    fwrite(s, 76);
end

end

