(define (domain TripPlanningDomain)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        city time_step stay_count
    )
    (:constants
        venice dubrovnik istanbul - city
        
        ; Total Time Steps (0 to 11 days total)
        T0 T1 T2 T3 T4 T5 T6 T7 T8 T9 T10 T11 - time_step
        
        ; Stay Counts (S0 through S6 needed for Venice max 6 days)
        S0 S1 S2 S3 S4 S5 S6 - stay_count 
    )
    (:predicates
        (at ?c - city)
        (visited ?c - city)
        (direct_flight ?from ?to - city)
        
        ; Total time tracking
        (current_time ?t - time_step)
        (next_time ?t1 ?t2 - time_step)
        
        ; Stay tracking for each city 
        (days_venice ?s - stay_count)
        (days_dubrovnik ?s - stay_count)
        (days_istanbul ?s - stay_count)
        
        ; Ordering for stay counts
        (next_stay ?s1 ?s2 - stay_count)
    )
    
    (:functions
        (total-cost) - number
    )
    
    ; Flight Action (1 day travel, high penalty cost 10)
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

    ; Stay Actions (1 day duration, low penalty cost 1, favors stays over flights)

    ; 1. Stay Venice (Max 6 days, S0 -> S6)
    (:action stay_venice
        :parameters (?t_now ?t_next - time_step ?s_now ?s_next - stay_count)
        :precondition (and 
            (at venice)
            (current_time ?t_now)
            (next_time ?t_now ?t_next) 
            (days_venice ?s_now)
            (next_stay ?s_now ?s_next)
            (not (days_venice S6)) ; Limit 6 days reached
        )
        :effect (and 
            (not (current_time ?t_now))
            (current_time ?t_next)
            (not (days_venice ?s_now))
            (days_venice ?s_next)
            (increase (total-cost) 1) 
        )
    )

    ; 2. Stay Dubrovnik (Max 4 days, S0 -> S4)
    (:action stay_dubrovnik
        :parameters (?t_now ?t_next - time_step ?s_now ?s_next - stay_count)
        :precondition (and 
            (at dubrovnik)
            (current_time ?t_now)
            (next_time ?t_now ?t_next) 
            (days_dubrovnik ?s_now)
            (next_stay ?s_now ?s_next)
            (not (days_dubrovnik S4)) ; Limit 4 days reached
        )
        :effect (and 
            (not (current_time ?t_now))
            (current_time ?t_next)
            (not (days_dubrovnik ?s_now))
            (days_dubrovnik ?s_next)
            (increase (total-cost) 1) 
        )
    )

    ; 3. Stay Istanbul (Max 3 days, S0 -> S3)
    (:action stay_istanbul
        :parameters (?t_now ?t_next - time_step ?s_now ?s_next - stay_count)
        :precondition (and 
            (at istanbul)
            (current_time ?t_now)
            (next_time ?t_now ?t_next) 
            (days_istanbul ?s_now)
            (next_stay ?s_now ?s_next)
            (not (days_istanbul S3)) ; Limit 3 days reached
        )
        :effect (and 
            (not (current_time ?t_now))
            (current_time ?t_next)
            (not (days_istanbul ?s_now))
            (days_istanbul ?s_next)
            (increase (total-cost) 1) 
        )
    )