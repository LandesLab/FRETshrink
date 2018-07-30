function run_control(filelist,datadir,fret_shrink,programdir)
%-------------------------------------------------------------------------%
% run_control.m
% 
% this file gets input from the GUI window and calls the necessary
% scripts.  Little computation is done here. 
%
%-------------------------------------------------------------------------%

% Get option values from GUI
cspin = get(findobj(fret_shrink.cspin_on),'Value');
time_local = get(findobj(fret_shrink.adaptive),'Value');
firm = get(findobj(fret_shrink.firm),'Value');
soft = get(findobj(fret_shrink.soft),'Value');
hard = get(findobj(fret_shrink.hard),'Value');

% Determine if there is more than one file
if iscell(filelist)
    numfiles = numel(filelist);
else
    numfiles = 1;
end

% Load, denoise each column, and save each denosied result 
for n = 1:numfiles
    cd(datadir);
    if numfiles == 1
        filename = filelist;
    else
        filename = filelist{n};
    end
    traj = load(filename);
    cols = size(traj,2);
    traj_den = zeros(size(traj));
    for k = 1:cols
        cd(programdir)
        S = traj(:,k);
        S = S';
        N = numel(S);       % Number of samples in signal
        uS = mean(S);       % Mean of signal
        Ns = 2^nextpow2(N);
        pad = uS*ones(1,(Ns-N));    % Pad signal with mean to next power of 2
        S_pad = [S pad];
        level = nextpow2(N) - 2;    % determine highest level of decomposition
        if cspin
            R = zeros(2^level,Ns);
            for s = 1:2^level
                S_c = circshift(S_pad,[0 s-1]);
                R_c = denoise(S_c,level,time_local,soft,firm);      % call denoise.m for each time shift 
                R(s,:) = circshift(R_c,[0 1-s]);                    % remove the time shift
            end
            R = mean(R(:,1:N));                                     % average the cycle-spun results and remove the pad
        else
            R = denoise(S_pad,level,time_local,soft,firm);          % call denoise.m without cycle-spinning
            R = R(1:N);                                             % remove pad
        end
        traj_den(:,k) = R';                             % store denoised result in output array
    end
    savename = [filename(1:(end-4)) '_den' filename((end-3):end)];
    cd(datadir);
    save(savename,'traj_den','-ascii')
end

% Plot the last file in the GUI window
t = 1:size(traj,1);
maxcounts = max([traj(:,cols); traj(:,cols-1)]);

set(gcf,'CurrentAxes',fret_shrink.plot_box)
cla

hold on;
plot(t,traj(:,cols),'c',t,traj(:,cols-1),'m','LineWidth',1);
plot(t,traj_den(:,cols),'b',t,traj_den(:,cols-1),'r','LineWidth',2);
set(gca,'xtick',100:100:t(end),'ytick',0.1*round(10*linspace(0,maxcounts,4)),'Color','k')
axis([0 t(end) 0 maxcounts]);
xlabel('Time Step'); ylabel('Photons')
