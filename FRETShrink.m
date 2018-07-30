function varargout = FRETShrink(varargin)
% FRETSHRINK M-file for FRETShrink.fig
%      FRETSHRINK, by itself, creates a new FRETSHRINK or raises the existing
%      singleton*.
%
%      H = FRETSHRINK returns the handle to a new FRETSHRINK or the handle to
%      the existing singleton*.
%
%      FRETSHRINK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FRETSHRINK.M with the given input arguments.
%
%      FRETSHRINK('Property','Value',...) creates a new FRETSHRINK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FRETShrink_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FRETShrink_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FRETShrink

% Last Modified by GUIDE v2.5 15-May-2010 15:40:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FRETShrink_OpeningFcn, ...
                   'gui_OutputFcn',  @FRETShrink_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before FRETShrink is made visible.
function FRETShrink_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FRETShrink (see VARARGIN)

% Choose default command line output for FRETShrink
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

set(gcf,'CurrentAxes',findobj('Tag','logoax'));                             % plot logo on gui
load('lgo.mat'); image(lgo);
set(gca,'Visible','off','XTick',[],'YTick',[])

% UIWAIT makes FRETShrink wait for user response (see UIRESUME)
% uiwait(handles.FRETShrink);


% --- Outputs from this function are returned to the command line.
function varargout = FRETShrink_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in run_button.
function run_button_Callback(hObject, eventdata, handles)
% hObject    handle to run_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get program directory & call load script
thisfile = 'FRETShrink.m';
programdir = which(thisfile);
programdir = programdir(1:(numel(programdir)-numel(thisfile)));
addpath(programdir);
cd(programdir);
load_files(programdir)


