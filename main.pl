% main.pl
:- consult('knowledge_base.pl').

% Starting point of the program
start :-
    write("Welcome to the Medical Diagnostic Expert System!"), nl,
    write("Please answer the following questions with 'yes.' or 'no.'."), nl,
    diagnose.

% Diagnose the disease based on symptoms
diagnose :-
    disease(Disease),
    format("Based on your symptoms, you might have ~w.", [Disease]), nl,
    halt.

diagnose :-
    write("No disease could be diagnosed with the given symptoms."), nl,
    halt.
