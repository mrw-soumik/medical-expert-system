% knowledge_base.pl content

% Define symptoms for common diseases
symptom(fever, flu).
symptom(cough, flu).
symptom(sore_throat, flu).
symptom(headache, flu).
symptom(fatigue, flu).

symptom(fever, malaria).
symptom(chills, malaria).
symptom(sweating, malaria).
symptom(headache, malaria).
symptom(nausea, malaria).

symptom(fever, typhoid).
symptom(headache, typhoid).
symptom(diarrhea, typhoid).
symptom(abdominal_pain, typhoid).
symptom(fatigue, typhoid).

symptom(fever, covid).
symptom(cough, covid).
symptom(sore_throat, covid).
symptom(loss_of_taste_or_smell, covid).
symptom(shortness_of_breath, covid).

symptom(skin_rash, measles).
symptom(fever, measles).
symptom(cough, measles).
symptom(runny_nose, measles).
symptom(red_eyes, measles).

% Rule to determine a possible disease based on symptoms
disease(Disease) :-
    findall(Symptom, symptom(Symptom, Disease), Symptoms),
    check_symptoms(Symptoms),
    !. % This cut operator prevents backtracking once a diagnosis is found.

% Rule to iterate through symptoms and ask the user about each one
check_symptoms([]).
check_symptoms([Symptom | Rest]) :-
    format("Do you have ~w? (yes/no): ", [Symptom]),
    read(Response),
    (Response == yes -> check_symptoms(Rest) ; fail).
