function out = getConfig(conffile)

    f = fopen(conffile);
    
    l = fgetl(f);
    while ischar(l)
        disp(l);
        l = fgetl(f);
        
        if strfind(l, ' = ')
            data = strsplit(l, ' = ');
            key = data(1);
            key = key{1};
            value = data(2);
            value = value{1};
            [num, stat] = str2num(value);
            
            if stat == 1
                value = num;
            end
            
            out.(key) = value;
        end
        
    end

end