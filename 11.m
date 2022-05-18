1.
t=0:0.1:400;
y= sawtooth(0.1*t,0.5);%T=2pi/a
x=1.5*y+1.5;
Fs=50;
N=length(x);
y0 = abs(fft(x)); 
f = (0:N-1)*Fs/N;
plot(f,y0);
xlabel('Frequency'); 
ylabel('Amplitude');


2.
Uw=10;
Wc=300000*2*pi;Ww=1;
t=0:1:500;
y= sawtooth(0.1*t,0.5);%T=2pi/a
x=1.5*y+1.5;
uw=x;%调制信号
uc=cos(Wc.*t);%载波信号
uDSB=uw.*uc;%DSB已调信号
subplot(2,1,1);plot(t,uDSB);xlabel('t');ylabel('uDSB');title('已调信号');
Fs=50;
N=length(x);
y0 = abs(fft(x)); 
f = (0:N-1)*Fs/N;
subplot(2,1,2);
plot(f,y0);
xlabel('Frequency'); 
ylabel('Amplitude');


3.
t=0:0.1:400;
y= sawtooth(0.1*t,0.5);%T=2pi/a
x=1.5*y+1.5;
y=x;
yh = hilbert(y);     % matlab函数得到信号是合成的复信号
yi =  imag (yh);       % 虚部为书上定义的Hilbert变换
figure
subplot (211)
plot (t, yi)
title ( 'Hilbert变换信号' )
ylim ([-1,1])
y1 = abs(fft(yi)); 
subplot (212)
plot(t,y1);
title ( '频域' )




4.
dt=0.005;   %设定步长
t=0:dt:3;
am=5;
%调制信号幅度
fm=5;
%调制信号频率
y= sawtooth(0.1*t,0.5);%T=2pi/a
x=1.5*y+1.5;
mt=1.5*y+1.5;
%生成调制信号
j_mt(1)=0;
for i=1:length(t)-1
%对调制信号求积分
j_mt(i+1)=j_mt(i)+mt(i)*dt;
end
fc=25;
ct=cos(2*pi*fc*t) ;
%生成载波
kf=10;
%调频灵敏度
sft=cos(2*pi*fc*t+kf*j_mt) ;
subplot(211);
plot(t,sft) ;
title('已调信号时域图');
Fs=50;
N=length(x);
y2 = abs(fft(x)); 
f = (0:N-1)*Fs/N;
subplot(212);
plot(f,y2);
title('已调信号频域图');


2.
(a)
If H(ω) is aliked with a period of K2pi/T and the resulting spectrum is constant (a straight line), then H(ω) is intersymbol crosstalk free
(b)
