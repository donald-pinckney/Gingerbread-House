clear

s = serial('/dev/cu.usbmodem1411');
set(s,'BaudRate',9600);
fopen(s);

filename = 'phantom.mp3';
[Wave, fs] = audioread(filename);
player = audioplayer(Wave, fs);

T = compute_timings(filename);
led0T = T{1};
led1T = T{2};
led2T = T{3};
led3T = T{4};

timers0 = led_send_blink(s, 0, led0T, 0.1);
timers1 = led_send_blink(s, 1, led1T, 0.1);
timers2 = led_send_blink(s, 2, led2T, 0.1);
timers3 = led_send_blink(s, 3, led3T, 0.1);

play(player);

for t = timers0
   start(t); 
end

for t = timers1
   start(t); 
end

for t = timers2
   start(t); 
end

for t = timers3
   start(t); 
end



