(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city - object
        day - object
    )
    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (next ?d1 - day ?d2 - day)
        (connected ?c1 - city ?c2 - city)
        
        ; Tracking stay completion for required durations (H=1, B=5, F=6)
        (stay_in_H_complete)
        (stay_in_B_complete)
        (stay_in_F_complete)
        
        ; Day constraints enforcing the fixed schedule timing: H(D1), T1(D2), B(D3-D7), T2(D8), F(D9-D14)
        (day_type_H ?d - day) 
        (day_type_T1 ?d - day) 
        (day_type_B ?d - day) 
        (day_type_T2 ?d - day) 
        (day_type_F ?d - day) 
        
        ; Tracking progress through phases
        (on_schedule_phase_1_H) ; D1
        (on_schedule_phase_2_T1) ; D2
        (on_schedule_phase_3_B) ; D3-D7
        (on_schedule_phase_4_T2) ; D8
        (on_schedule_phase_5_F) ; D9-D14
    )

    ; PHASE 1: H Stay (1 day) - D1 -> D2
    (:action stay_H_Day1
        :parameters (?d1 - day ?d2 - day)
        :precondition (and 
            (current_day ?d1) (next ?d1 ?d2) (at H) 
            (day_type_H ?d1) (on_schedule_phase_1_H)
        )
        :effect (and 
            (not (current_day ?d1)) (current_day ?d2) 
            (stay_in_H_complete) 
            (not (on_schedule_phase_1_H))
            (on_schedule_phase_2_T1)
        )
    )
    
    ; PHASE 2: Travel H->B (1 day) - D2 -> D3
    (:action travel_H_B_Day2
        :parameters (?d2 - day ?d3 - day)
        :precondition (and 
            (current_day ?d2) (next ?d2 ?d3) (at H) (connected H B) 
            (day_type_T1 ?d2) (on_schedule_phase_2_T1)
        )
        :effect (and 
            (not (current_day ?d2)) (current_day ?d3) 
            (not (at H)) (at B) 
            (not (on_schedule_phase_2_T1))
            (on_schedule_phase_3_B)
        )
    )

    ; PHASE 3: B Stay (5 days: D3, D4, D5, D6, D7)
    
    ; Stays D3, D4, D5, D6 (Transition to D4, D5, D6, D7)
    (:action stay_B_advance
        :parameters (?d1 - day ?d2 - day)
        :precondition (and 
            (current_day ?d1) (next ?d1 ?d2) (at B) 
            (day_type_B ?d1) (on_schedule_phase_3_B)
            (day_type_B ?d2) 
        )
        :effect (and (not (current_day ?d1)) (current_day ?d2))
    )
    
    ; Last B Stay day D7 -> D8 transition (start travel phase 4)
    (:action stay_B_Day7_to_T2
        :parameters (?d7 - day ?d8 - day)
        :precondition (and 
            (current_day ?d7) (next ?d7 ?d8) (at B) 
            (day_type_B ?d7) (on_schedule_phase_3_B)
            (day_type_T2 ?d8)
        )
        :effect (and 
            (not (current_day ?d7)) (current_day ?d8) 
            (stay_in_B_complete)
            (not (on_schedule_phase_3_B))
            (on_schedule_phase_4_T2)
        )
    )

    ; PHASE 4: Travel B->F (1 day) - D8 -> D9
    (:action travel_B_F_Day8
        :parameters (?d8 - day ?d9 - day)
        :precondition (and 
            (current_day ?d8) (next ?d8 ?d9) (at B) (connected B F) 
            (day_type_T2 ?d8) (on_schedule_phase_4_T2)
        )
        :effect (and 
            (not (current_day ?d8)) (current_day ?d9) 
            (not (at B)) (at F) 
            (not (on_schedule_phase_4_T2))
            (on_schedule_phase_5_F)
        )
    )

    ; PHASE 5: F Stay (6 days: D9 to D14)
    
    ; Stays D9, D10, D11, D12, D13 (Transition to D10, D11, D12, D13, D14)
    (:action stay_F_advance
        :parameters (?d1 - day ?d2 - day)
        :precondition (and 
            (current_day ?d1) (next ?d1 ?d2) (at F) 
            (day_type_F ?d1) (on_schedule_phase_5_F)
        )
        :effect (and (not (current_day ?d1)) (current_day ?d2))
    )
    
    ; Last F Stay day D14 (achieving goal requirements)
    (:action complete_F_Stay_Day14
        :parameters (?d14 - day)
        :precondition (and 
            (current_day ?d14) (at F) 
            (day_type_F ?d14) (on_schedule_phase_5_F)
        )
        :effect (stay_in_F_complete)
    )
)