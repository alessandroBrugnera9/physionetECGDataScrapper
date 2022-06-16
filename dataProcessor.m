wfdb_url='https://physionet.org/files/mitdb/1.0.0/';
zipname= 'mit-bih-arrhythmia-database-1.0.0.zip';
[filestr,status] = urlwrite(wfdb_url,zipname);

% TODO: implement checker if the file is fully downloaded
unzip(zipname);

% getting name of all the records
filesPath=[zipname(1:end-4) '/'];
recordsNames = [filesPath 'RECORDS'];
files = csvread(recordsNames)';


saveFolder = 'db';
mkdir(saveFolder)


counter=0;
sampleSize=18000/300*128;
for fileNum=files
    file = [filesPath num2str(fileNum)]
    r=rdsamp(file);

    [measures, columns] = size(r);
    nSamples = floor(measures/sampleSize)
    for j = 1:columns
        for k=0:(nSamples-1)
            sample= r((k*sampleSize+1):(k+1)*sampleSize,j);
            
            filename = [saveFolder num2str(counter) '.mat'];
            save(filename,'sample')
            counter=counter+1;
        end
    end
end