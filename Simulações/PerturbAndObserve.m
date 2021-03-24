function D = PandO(Vpv,Ipv)

persistent Dprev Pprev Vprev

if isempty(Dprev)
    Dprev=0.7;
    Vprev=190;
    Pprev=2000;
end


deltaD = 125e-6;

%Calculate measured array power
Ppv=Vpv*Ipv;

%Increase or decrease duty cycle based on conditions
if(Ppv-Pprev) ~= 0
    if(Ppv-Pprev)>0
        if(Vpv-Vprev)>0
            D = Dprev-deltaD;
        else
            D = Dprev+deltaD;
        end
    else
        if(Vpv-Vprev)>0
            D = Dprev+deltaD;
        else
            D = Dprev-deltaD;
        end
    end
else
    D = Dprev;
end

%Update internal values
Dprev = D;
Vprev = Vpv;
Pprev = Ppv;

