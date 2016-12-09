function [timers] = led_send_blink( s, p, T, w )

round(T, 3);

for n=1:length(T)
    tim = timer;
    t = T(n);
    tim.StartDelay = t;
    tim.TimerFcn = @(~,~) send_pulse(s, p, w);
    
    timers(n)= tim;
end

end

