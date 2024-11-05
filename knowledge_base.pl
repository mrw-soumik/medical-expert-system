% knowledge_base.pl

% Define symptoms for common diseases
symptom(fever, flu).
symptom(cough, flu).
symptom(sore_throat, flu).

symptom(fever, malaria).
symptom(chills, malaria).
symptom(sweating, malaria).

symptom(fever, typhoid).
symptom(headache, typhoid).
symptom(diarrhea, typhoid).

% Rules to determine a possible disease based on symptoms
disease(Disease) :-
    findall(Symptom, symptom(Symptom, Disease), Symptoms),
    check_symptoms(Symptoms).

check_symptoms([]).
check_symptoms([Symptom | Rest]) :-
    format("Do you have ~w? (yes/no): ", [Symptom]),
    read(Response),
    Response == yes,
    check_symptoms(Rest).
