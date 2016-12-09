function [] = send_pulse( s, p, width )

set_led(s, p, 1);

offTimer = timer;
offTimer.StartDelay = width;
offTimer.TimerFcn = @(~, ~) set_led(s, p, 0);
start(offTimer)

end

