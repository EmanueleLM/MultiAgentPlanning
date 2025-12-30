(define (domain TripPlanningDomain)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        city time_step stay_count
    )
    (:constants
        venice dubrovnik istanbul - city
        T0 T1 T2 T3 T4 T5 T6 T7 T8 T9 T10 T11 - time_step
        S0 S1 S2 S3 S4 S5 S6 - stay_count 
    )
    (:predicates
        (at ?c - city)
        (visited ?c - city)
        (direct_flight ?from ?to - city)
        (current_time ?t - time_step)
        (next_time ?t1 ?t2 - time_step)
        
        ; Stay count tracking
        (days_venice ?s - stay_count)
        (days_dubrovnik ?s - stay_count)
        (days_istanbul ?s - stay_count)
        (next_stay ?s1 ?s2 - stay_count)
    )
    
    (:functions
        (total-cost) - number
    )
    
    ; Flight Action (1 day travel, high cost 10)
    (:action fly
        :parameters (?from ?to - city ?t_now ?t_next - time_step)
        :precondition (and 
            (at ?from) 
            (direct_flight ?from ?to)
            (current_time ?t_now)
            (next_time ?t_now ?t_next) 
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (visited ?to)
            (not (current_time ?t_now))
            (current_time ?t_next)
            (increase (total-cost) 10) 
        )
    )

    ; 1. Stay Venice (Max 6 days enforced by blocking transition past S6)
    (:action stay_venice
        :parameters (?t_now ?t_next - time_step ?s_now ?s_next - stay_count)
        :precondition (and 
            (at venice)
            (current_time ?t_now)
            (next_time ?t_now ?t_next) 
            (days_venice ?s_now)
            (next_stay ?s_now ?s_next)
            ; Block if S6 has already been achieved (6 days)
            (not (days_venice S6)) 
        )
        :effect (and 
            (not (current_time ?t_now))
            (current_time ?t_next)
            (not (days_venice ?s_now))
            (days_venice ?s_next)
            (increase (total-cost) 1) 
        )
    )

    ; 2. Stay Dubrovnik (Max 4 days enforced by blocking transition past S4)
    (:action stay_dubrovnik
        :parameters (?t_now ?t_next - time_step ?s_now ?s_next - stay_count)
        :precondition (and 
            (at dubrovnik)
            (current_time ?t_now)
            (next_time ?t_now ?t_next) 
            (days_dubrovnik ?s_now)
            (next_stay ?s_now ?s_next)
            ; Block if S4 has already been achieved (4 days)
            (not (days_dubrovnik S4)) 
        )
        :effect (and 
            (not (current_time ?t_now))
            (current_time ?t_next)
            (not (days_dubrovnik ?s_now))
            (days_dubrovnik ?s_next)
            (increase (total-cost) 1) 
        )
    )

    ; 3. Stay Istanbul (Max 3 days enforced by blocking transition past S3)
    (:action stay_istanbul
        :parameters (?t_now ?t_next - time_step ?s_now ?s_next - stay_count)
        :precondition (and 
            (at istanbul)
            (current_time ?t_now)
            (next_time ?t_now ?t_next) 
            (days_istanbul ?s_now)
            (next_stay ?s_now ?s_next)
            ; Block if S3 has already been achieved (3 days)
            (not (days_istanbul S3)) 
        )
        :effect (and 
            (not (current_time ?t_now))
            (current_time ?t_next)
            (not (days_istanbul ?s_now))
            (days_istanbul ?s_next)
            (increase (total-cost) 1) 
        )
    )
)