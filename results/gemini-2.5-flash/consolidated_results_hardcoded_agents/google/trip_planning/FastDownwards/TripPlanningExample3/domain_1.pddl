(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
    )
    (:constants
        berlin warsaw bucharest - city
        d1 d2 d3 d4 d5 d6 - day
    )

    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (direct_flight ?c1 - city ?c2 - city)
        
        ; Tracking stay status for 2 days requirement
        (stayed_berlin_1) 
        (stayed_berlin_2) 
        (stayed_warsaw_1) 
        (stayed_warsaw_2) 
        (stayed_bucharest_1) 
        (stayed_bucharest_2) 
        
        ; Mandatory constraint
        (friend_met)
    )

    ; --- Stay Actions (Berlin Days 1 & 2) ---

    ; Day 1 in Berlin -> Advance to Day 2
    (
        :action stay_d1_berlin
        :precondition (and (current_day d1) (at berlin) (not (stayed_berlin_1)))
        :effect (and 
            (not (current_day d1)) 
            (current_day d2) 
            (stayed_berlin_1)
        )
    )
    
    ; Day 2 in Berlin -> Advance to Day 3. Completion of Berlin stay.
    (
        :action stay_d2_berlin
        :precondition (and 
            (current_day d2) 
            (at berlin) 
            (stayed_berlin_1) 
            (not (stayed_berlin_2))
        )
        :effect (and 
            (not (current_day d2)) 
            (current_day d3) 
            (stayed_berlin_2)
        )
    )

    ; --- Travel B -> W (Day 3) ---
    ; Must happen at the beginning of Day 3, after 2 days in Berlin.
    (
        :action travel_b_to_w_d3
        :precondition (and
            (current_day d3)
            (at berlin)
            (stayed_berlin_2) 
            (direct_flight berlin warsaw)
        )
        :effect (and
            (not (at berlin))
            (at warsaw)
        )
    )
    
    ; --- Stay Actions (Warsaw Days 3 & 4) ---
    
    ; Day 3 in Warsaw -> Advance to Day 4
    (
        :action stay_d3_warsaw
        :precondition (and 
            (current_day d3) 
            (at warsaw)
            (not (stayed_warsaw_1))
        )
        :effect (and 
            (not (current_day d3)) 
            (current_day d4) 
            (stayed_warsaw_1)
        )
    )
    
    ; Day 4 in Warsaw -> Advance to Day 5. Completion of Warsaw stay.
    (
        :action stay_d4_warsaw
        :precondition (and 
            (current_day d4) 
            (at warsaw)
            (stayed_warsaw_1)
            (not (stayed_warsaw_2))
        )
        :effect (and 
            (not (current_day d4)) 
            (current_day d5) 
            (stayed_warsaw_2)
        )
    )

    ; --- Travel W -> R (Day 5) ---
    ; Must happen at the beginning of Day 5, after 2 days in Warsaw.
    (
        :action travel_w_to_r_d5
        :precondition (and
            (current_day d5)
            (at warsaw)
            (stayed_warsaw_2) 
            (direct_flight warsaw bucharest)
        )
        :effect (and
            (not (at warsaw))
            (at bucharest)
        )
    )
    
    ; --- Stay Actions (Bucharest Days 5 & 6) and Friend Meeting ---
    
    ; Friend meeting (Day 5 or 6, in Bucharest)
    (
        :action meet_friend
        :precondition (and
            (at bucharest)
            (not (friend_met))
            (or (current_day d5) (current_day d6))
        )
        :effect (friend_met)
    )

    ; Day 5 in Bucharest -> Advance to Day 6
    (
        :action stay_d5_bucharest
        :precondition (and 
            (current_day d5) 
            (at bucharest)
            (not (stayed_bucharest_1))
        )
        :effect (and 
            (not (current_day d5)) 
            (current_day d6) 
            (stayed_bucharest_1)
        )
    )
    
    ; Final Stay (Day 6). Completes Bucharest stay duration.
    (
        :action stay_d6_bucharest
        :precondition (and 
            (current_day d6) 
            (at bucharest)
            (stayed_bucharest_1)
            (not (stayed_bucharest_2))
        )
        :effect (stayed_bucharest_2)
    )
)