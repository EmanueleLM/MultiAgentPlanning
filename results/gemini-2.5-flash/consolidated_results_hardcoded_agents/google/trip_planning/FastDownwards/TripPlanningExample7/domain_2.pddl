(define (domain TripPlanningDomain)
    (:requirements :strips :typing :negative-preconditions)
    (:types city time_point day_count)
    (:predicates
        (at ?c - city)
        (visited ?c - city)
        (direct_flight ?from ?to - city)
        
        ; Time tracking (0 to 11 days elapsed)
        (current_time ?t - time_point)
        (next_time ?t1 ?t2 - time_point)
        
        ; Day tracking for Venice (0 to 6 days required)
        (current_venice_day ?d - day_count)
        (next_venice_day ?d1 ?d2 - day_count) 
        
        ; Day tracking for Dubrovnik (0 to 4 days required)
        (current_dubrovnik_day ?d - day_count)
        (next_dubrovnik_day ?d1 ?d2 - day_count) 
        
        ; Day tracking for Istanbul (0 to 3 days required)
        (current_istanbul_day ?d - day_count)
        (next_istanbul_day ?d1 ?d2 - day_count) 
    )

    ; Flight actions (1 day travel)
    
    (:action fly_dubrovnik_to_istanbul
        :parameters (?t_curr ?t_next - time_point)
        :precondition (and 
            (at dubrovnik) 
            (direct_flight dubrovnik istanbul)
            (current_time ?t_curr)
            (next_time ?t_curr ?t_next)
        )
        :effect (and
            (not (at dubrovnik))
            (at istanbul)
            (visited istanbul)
            (not (current_time ?t_curr))
            (current_time ?t_next)
        )
    )

    (:action fly_dubrovnik_to_venice
        :parameters (?t_curr ?t_next - time_point)
        :precondition (and 
            (at dubrovnik) 
            (direct_flight dubrovnik venice)
            (current_time ?t_curr)
            (next_time ?t_curr ?t_next)
        )
        :effect (and
            (not (at dubrovnik))
            (at venice)
            (visited venice)
            (not (current_time ?t_curr))
            (current_time ?t_next)
        )
    )

    ; Stay Actions (1 day duration, track city stay days)

    (:action stay_venice
        :parameters (?t_curr ?t_next - time_point ?d_curr ?d_next - day_count)
        :precondition (and 
            (at venice)
            (current_time ?t_curr)
            (next_time ?t_curr ?t_next)
            (current_venice_day ?d_curr)
            (next_venice_day ?d_curr ?d_next)
        )
        :effect (and 
            (not (current_time ?t_curr))
            (current_time ?t_next)
            (not (current_venice_day ?d_curr))
            (current_venice_day ?d_next)
        )
    )

    (:action stay_dubrovnik
        :parameters (?t_curr ?t_next - time_point ?d_curr ?d_next - day_count)
        :precondition (and 
            (at dubrovnik)
            (current_time ?t_curr)
            (next_time ?t_curr ?t_next)
            (current_dubrovnik_day ?d_curr)
            (next_dubrovnik_day ?d_curr ?d_next)
        )
        :effect (and 
            (not (current_time ?t_curr))
            (current_time ?t_next)
            (not (current_dubrovnik_day ?d_curr))
            (current_dubrovnik_day ?d_next)
        )
    )
    
    (:action stay_istanbul
        :parameters (?t_curr ?t_next - time_point ?d_curr ?d_next - day_count)
        :precondition (and 
            (at istanbul)
            (current_time ?t_curr)
            (next_time ?t_curr ?t_next)
            (current_istanbul_day ?d_curr)
            (next_istanbul_day ?d_curr ?d_next)
        )
        :effect (and 
            (not (current_time ?t_curr))
            (current_time ?t_next)
            (not (current_istanbul_day ?d_curr))
            (current_istanbul_day ?d_next)
        )
    )
)