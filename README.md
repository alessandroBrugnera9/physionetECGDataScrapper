# Physionet ECG Data Scrapper and Organizer
Scripts for downloading and organizing ECG data from physionet databases for posterior analysis.

There are 2 scripts, one to install the library to handle data in physionet format, and another to download the desired physionet database, and break it down to the desired sample size.

The installation script, will download the [library](https://www.physionet.org/content/wfdb-matlab/0.10.0/) provided by physionet for MATLAB and add it to MATLAB path.

The dataProcessor script will:
<ol>
  <li>
    Download desired database as zip, the URL can be changed in the script, default is <a href="https://physionet.org/content/mitdb/1.0.0/">MIT-BIH Arrhythmia Database</a>
  </li>
  <li>
    Create folder for saving output data.
  </li>
  <li>
    Set each Sample size.
  </li>
  <li>
    Loop though all the possible samples sizes inside each measure. The last piece of measure (size smaller than sample size) will be discarded.
  </li>
</ol>



<h4>
TODOs:
</h4>
<ol>
  <li>
    Get lat piece of data padding zeros, or replicating data at the end.
  </li>
  <li>
    Check if the files were downloaded correctly before unziping
  </li>
</ol>