function askParticipantInfo()

% Ask for user identification:
%
% For our experiments, important information is:
%
% SONA = subject's SONA number, useful for participation administration
% Age = subject's age (for reports)
% Sex = subject's gender (for reports)
%
% All information is combined into one string 'subjInfo' that can be used
% for easy data output
%
global w;
global par;

par.expDate = regexprep(datestr(now),' ','-');
% setNormalFont();

if ~par.debug
  % ### GetEchoString(screen, txt, x, y, txtcolor)
  par.subjSONA = GetEchoString(w,'Please enter your SONA number (and press return):',100,100,par.white);
  % ### Flip front and back display surfaces; return completion timestamps.
  % ### renders in background, flips once done (-> no flickering!)
  Screen('Flip',w);
  par.subjAge = GetEchoString(w,'Please enter your age (and press return):',100,100,par.white);
  Screen('Flip',w);
  par.subjSex = GetEchoString(w,'Please enter your sex: [f,m] (and press return)',100,100,par.white);
  Screen('Flip',w);
else
  % ### set subj for debugging
  par.subjSONA = '123';
  par.subjAge = '32';
  par.subjSex = '1';
end
% ### par.subj set by experimenter, in itsTimeEEG.m
par.subjInfo = [ par.expName ' ' num2str(par.subj) ' ' par.subjSONA ' ' par.subjAge ' ' par.subjSex ' ' par.expDate];
