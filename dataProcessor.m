%downloading dataset from physionet
wfdb_url='https://physionet.org/files/mitdb/1.0.0/'; % desired database
zipname= 'mit-bih-arrhythmia-database-1.0.0.zip'; % desired name for zip of the database
[filestr,status] = urlwrite(wfdb_url,zipname);

% TODO: implement checker if the file is fully downloaded
unzip(zipname);

% getting name of all the records
filesPath=[zipname(1:end-4) '/'];
recordsNames = [filesPath 'RECORDS'];
files = csvread(recordsNames)';

%creating folder for the processed data, can be changed according to the desire
saveFolder = 'db/';
mkdir(saveFolder)


counter=0; %used to save the .mat files, another logic can be used
sampleSize=18000/300*128; %parameter to set the samples size, remembering the measures are in 128 Hz
%looping though all the files od the database
for fileNum=files
    file = [filesPath num2str(fileNum)]
    r=rdsamp(file); %reading file using provided library

    [measures, columns] = size(r);
    nSamples = floor(measures/sampleSize)
    %looping though all the measures inside each file
    for j = 1:columns
        %looping though all the samples that  are extracted from each measure
        for k=0:(nSamples-1)
            sample= r((k*sampleSize+1):(k+1)*sampleSize,j);
            
            %saving .mat file
            filename = [saveFolder num2str(counter) '.mat'];
            save(filename,'sample')
            counter=counter+1;
        end
    end
end