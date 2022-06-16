files = [16265,16272,16273,16420,16483,16539,16773,16786,16795,17052,17453,18177,18184,19088,19090,19093,19140,19830];

counter=0;
sampleSize=18000/300*128;
for fileNum=files
    file = ['mit-bih-normal-sinus-rhythm-database-1.0.0/' num2str(fileNum)]
    r=rdsamp(file);

    [measures, columns] = size(r);
    nSamples = floor(measures/sampleSize)
    for j = 1:columns
        for k=0:(nSamples-1)
            sample= r((k*sampleSize+1):(k+1)*sampleSize,j);
            
            filename = ['db/' num2str(counter) '.mat'];
            save(filename,'sample')
            counter=counter+1;
        end
    end
end