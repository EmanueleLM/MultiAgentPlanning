(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)

    (:types
        city - object
        day - object
    )

    (:constants
        amsterdam vilnius bucharest - city
    )

    (:predicates
        (connected ?c1 - city ?c2 - city)
        (at ?c - city)
        (visited ?c - city)
        (meeting_achieved)
        
        (is-day ?d - day) 
        (next-day ?d1 - day ?d2 - day) 
        (meeting-time ?d - day) ; Marker for valid action start days D5 through D10 (Day 6 through Day 11)

        ; Stay Tracking Predicates (A=3, V=2, B=4 required)
        (A-S1) (A-S2) (A-S3)
        (V-S1) (V-S2)
        (B-S1) (B-S2) (B-S3) (B-S4)
    )
    
    (:functions 
        (total-cost) - number ; Tracks trip duration (1 unit per day/step)
    )
    
    ; Action 1: Travel (Consumes 1 day step)
    (:action travel
        :parameters (?from - city ?to - city ?d_start - day ?d_end - day)
        :precondition (and 
            (connected ?from ?to)
            (at ?from)
            (is-day ?d_start)
            (next-day ?d_start ?d_end)
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (visited ?to)
            
            (not (is-day ?d_start))
            (is-day ?d_end)
            (increase (total-cost) 1)
        )
    )

    ; Action 2a: Stay in Amsterdam (3 steps required)
    
    (:action stay_amsterdam_1
        :parameters (?d_start - day ?d_end - day)
        :precondition (and (at amsterdam) (is-day ?d_start) (next-day ?d_start ?d_end) (not (A-S1)))
        :effect (and (A-S1) (not (is-day ?d_start)) (is-day ?d_end) (increase (total-cost) 1))
    )
    (:action stay_amsterdam_2
        :parameters (?d_start - day ?d_end - day)
        :precondition (and (at amsterdam) (is-day ?d_start) (next-day ?d_start ?d_end) (A-S1) (not (A-S2)))
        :effect (and (A-S2) (not (is-day ?d_start)) (is-day ?d_end) (increase (total-cost) 1))
    )
    (:action stay_amsterdam_3
        :parameters (?d_start - day ?d_end - day)
        :precondition (and (at amsterdam) (is-day ?d_start) (next-day ?d_start ?d_end) (A-S2) (not (A-S3)))
        :effect (and (A-S3) (not (is-day ?d_start)) (is-day ?d_end) (increase (total-cost) 1))
    )
    (:action stay_amsterdam_excess
        :parameters (?d_start - day ?d_end - day)
        :precondition (and (at amsterdam) (is-day ?d_start) (next-day ?d_start ?d_end) (A-S3))
        :effect (and (not (is-day ?d_start)) (is-day ?d_end) (increase (total-cost) 1))
    )

    ; Action 2b: Stay in Vilnius (2 steps required)
    
    (:action stay_vilnius_1
        :parameters (?d_start - day ?d_end - day)
        :precondition (and (at vilnius) (is-day ?d_start) (next-day ?d_start ?d_end) (not (V-S1)))
        :effect (and (V-S1) (not (is-day ?d_start)) (is-day ?d_end) (increase (total-cost) 1))
    )
    (:action stay_vilnius_2
        :parameters (?d_start - day ?d_end - day)
        :precondition (and (at vilnius) (is-day ?d_start) (next-day ?d_start ?d_end) (V-S1) (not (V-S2)))
        :effect (and (V-S2) (not (is-day ?d_start)) (is-day ?d_end) (increase (total-cost) 1))
    )
    (:action stay_vilnius_excess
        :parameters (?d_start - day ?d_end - day)
        :precondition (and (at vilnius) (is-day ?d_start) (next-day ?d_start ?d_end) (V-S2))
        :effect (and (not (is-day ?d_start)) (is-day ?d_end) (increase (total-cost) 1))
    )

    ; Action 2c/3/4: Stay in Bucharest (4 steps required, 1 must be meeting D5-D10 start)
    
    ; MEETING ACTIONS (Sets B-SN and meeting_achieved). Used if in time window AND meeting not achieved.
    (:action stay_bucharest_meeting_S1
        :parameters (?d_start - day ?d_end - day)
        :precondition (and (at bucharest) (is-day ?d_start) (next-day ?d_start ?d_end)
                           (not (B-S1)) (meeting-time ?d_start) (not (meeting_achieved)))
        :effect (and (B-S1) (meeting_achieved) (not (is-day ?d_start)) (is-day ?d_end) (increase (total-cost) 1))
    )
    (:action stay_bucharest_meeting_S2
        :parameters (?d_start - day ?d_end - day)
        :precondition (and (at bucharest) (is-day ?d_start) (next-day ?d_start ?d_end)
                           (B-S1) (not (B-S2)) (meeting-time ?d_start) (not (meeting_achieved)))
        :effect (and (B-S2) (meeting_achieved) (not (is-day ?d_start)) (is-day ?d_end) (increase (total-cost) 1))
    )
    (:action stay_bucharest_meeting_S3
        :parameters (?d_start - day ?d_end - day)
        :precondition (and (at bucharest) (is-day ?d_start) (next-day ?d_start ?d_end)
                           (B-S2) (not (B-S3)) (meeting-time ?d_start) (not (meeting_achieved)))
        :effect (and (B-S3) (meeting_achieved) (not (is-day ?d_start)) (is-day ?d_end) (increase (total-cost) 1))
    )
    (:action stay_bucharest_meeting_S4
        :parameters (?d_start - day ?d_end - day)
        :precondition (and (at bucharest) (is-day ?d_start) (next-day ?d_start ?d_end)
                           (B-S3) (not (B-S4)) (meeting-time ?d_start) (not (meeting_achieved)))
        :effect (and (B-S4) (meeting_achieved) (not (is-day ?d_start)) (is-day ?d_end) (increase (total-cost) 1))
    )

    ; REGULAR COUNTED ACTIONS (Sets B-SN). Used if meeting already achieved OR outside time window.
    (:action stay_bucharest_regular_S1
        :parameters (?d_start - day ?d_end - day)
        :precondition (and (at bucharest) (is-day ?d_start) (next-day ?d_start ?d_end)
                           (not (B-S1)) (or (meeting_achieved) (not (meeting-time ?d_start))))
        :effect (and (B-S1) (not (is-day ?d_start)) (is-day ?d_end) (increase (total-cost) 1))
    )
    (:action stay_bucharest_regular_S2
        :parameters (?d_start - day ?d_end - day)
        :precondition (and (at bucharest) (is-day ?d_start) (next-day ?d_start ?d_end)
                           (B-S1) (not (B-S2)) (or (meeting_achieved) (not (meeting-time ?d_start))))
        :effect (and (B-S2) (not (is-day ?d_start)) (is-day ?d_end) (increase (total-cost) 1))
    )
    (:action stay_bucharest_regular_S3
        :parameters (?d_start - day ?d_end - day)
        :precondition (and (at bucharest) (is-day ?d_start) (next-day ?d_start ?d_end)
                           (B-S2) (not (B-S3)) (or (meeting_achieved) (not (meeting-time ?d_start))))
        :effect (and (B-S3) (not (is-day ?d_start)) (is-day ?d_end) (increase (total-cost) 1))
    )
    (:action stay_bucharest_regular_S4
        :parameters (?d_start - day ?d_end - day)
        :precondition (and (at bucharest) (is-day ?d_start) (next-day ?d_start ?d_end)
                           (B-S3) (not (B-S4)) (or (meeting_achieved) (not (meeting-time ?d_start))))
        :effect (and (B-S4) (not (is-day ?d_start)) (is-day ?d_end) (increase (total-cost) 1))
    )
    
    ; EXCESS STAY ACTIONS (B4 achieved)
    
    ; Excess stay used for meeting opportunity
    (:action stay_bucharest_post_4_pre_meeting
        :parameters (?d_start - day ?d_end - day)
        :precondition (and (at bucharest) (is-day ?d_start) (next-day ?d_start ?d_end)
                           (B-S4) (meeting-time ?d_start) (not (meeting_achieved)))
        :effect (and (meeting_achieved) (not (is-day ?d_start)) (is-day ?d_end) (increase (total-cost) 1))
    )

    ; General excess stay (Meeting achieved OR out of window)
    (:action stay_bucharest_post_4_general
        :parameters (?d_start - day ?d_end - day)
        :precondition (and (at bucharest) (is-day ?d_start) (next-day ?d_start ?d_end)
                           (B-S4) (or (meeting_achieved) (not (meeting-time ?d_start))))
        :effect (and (not (is-day ?d_start)) (is-day ?d_end) (increase (total-cost) 1))
    )
)