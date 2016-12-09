function [] = delete_all( a, s )

for i = 1:length(a)
    delete(a(i));
end

end

