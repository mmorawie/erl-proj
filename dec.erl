%% mikolaj morawiec
%% WIEiT AGH
-module(dec).
-export([polonium216/1]).
-export([start/2]).



start(0,_)-> ok;

start(N,Isotope)->
	spawn(dec,Isotope,[100]),
	start(N-1,Isotope).
	

thalium208(Time)->
	timer:sleep(Time),
	random:seed(now()),
	Tmp = random:uniform(),
	Lam = 0.9,
	if 
		Tmp > Lam -> ok;% lead208
		true -> thalium208(Time)
	end.

polonium212(Time)->
	timer:sleep(Time),
	random:seed(now()),
	Tmp = random:uniform(),
	Lam = 0.00001,
	if 
		Tmp > Lam -> ok;% lead208
		true -> polonium212(Time)
	end.

bizmuth212(Time)->
	timer:sleep(Time),
	random:seed(now()),
	Tmp = random:uniform(),
	Lam = 0.999,
	if 
		Tmp > Lam -> 
			if Tmp > Lam + (1-Lam)*0.68 -> polonium212(Time);
				true ->	thalium208(Time)
			end;
		true -> bizmuth212(Time)
	end.

lead212(Time)->
	timer:sleep(Time),
	random:seed(now()),
	Tmp = random:uniform(),
	Lam = 0.9999,
	if 
		Tmp > Lam -> bizmuth212(Time);
		true -> lead212(Time)
	end.

polonium216 (Time)->
	timer:sleep(Time),
	random:seed(now()),
	Tmp = random:uniform(),
	Lam = 0.4765,
	if 
		Tmp > Lam -> lead212(Time);
		true -> polonium216(Time)
	end.


