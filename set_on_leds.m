function [ ] = set_on_leds( s, L )

for l = 0:3
    if sum(L == l) > 0
        set_led(s, l, 1);
    else
        set_led(s, l, 0);
    end
end

end

