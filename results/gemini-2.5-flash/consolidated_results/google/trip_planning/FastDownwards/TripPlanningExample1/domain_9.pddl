(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    
    (:types city duration - object) 
    
    (:predicates
        (at ?c - city)
        (visited ?c - city)
        (direct-flight ?from - city ?to - city)
        
        ; Total Time tracking (up to D15)
        (total-time-is ?d - duration)
        (next-total ?d1 ?d2 - duration)
        
        ; Riga Time tracking (up to D7, requirement 7)
        (riga-time-is ?d - duration)
        (next-riga ?d1 ?d2 - duration)

        ; Manchester Time tracking (up to D4, requirement 4)
        (manchester-time-is ?d - duration)
        (next-manchester ?d1 ?d2 - duration)

        ; Split Time tracking (up to D6, requirement 6)
        (split-time-is ?d - duration)
        (next-split ?d1 ?d2 - duration)
    )

    (:functions
        (total-cost)
    )

    ;; Action 1: Travel between cities (0 time cost)
    (:action travel
        :parameters (?from - city ?to - city)
        :precondition (and
            (at ?from)
            (direct-flight ?from ?to)
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (visited ?to)
        )
    )

    ; --- RIGA Actions (Required: 7 days) ---
    
    ; 1a. Gain utility (Time < 7)
    (:action spend_day_riga_gain
        :parameters (?d_total_curr - duration ?d_total_next - duration
                    ?d_riga_curr - duration ?d_riga_next - duration)
        :precondition (and
            (at riga)
            (total-time-is ?d_total_curr)
            (next-total ?d_total_curr ?d_total_next)
            
            (riga-time-is ?d_riga_curr)
            (next-riga ?d_riga_curr ?d_riga_next) ; Counter advances up to D7_R
        )
        :effect (and
            (not (total-time-is ?d_total_curr))
            (total-time-is ?d_total_next)
            
            (not (riga-time-is ?d_riga_curr))
            (riga-time-is ?d_riga_next)
            
            (increase (total-cost) -1) ; Gain 1 utility
        )
    )
    
    ; 1b. Sustain duration (Time >= 7)
    (:action spend_day_riga_sustain
        :parameters (?d_total_curr - duration ?d_total_next - duration)
        :precondition (and
            (at riga)
            (total-time-is ?d_total_curr)
            (next-total ?d_total_curr ?d_total_next)
            
            (riga-time-is D7_R) ; Already reached maximum utility
        )
        :effect (and
            (not (total-time-is ?d_total_curr))
            (total-time-is ?d_total_next)
            
            ; riga-time-is remains D7_R
        )
    )

    ; --- MANCHESTER Actions (Required: 4 days) ---

    ; 2a. Gain utility (Time < 4)
    (:action spend_day_manchester_gain
        :parameters (?d_total_curr - duration ?d_total_next - duration
                    ?d_m_curr - duration ?d_m_next - duration)
        :precondition (and
            (at manchester)
            (total-time-is ?d_total_curr)
            (next-total ?d_total_curr ?d_total_next)
            
            (manchester-time-is ?d_m_curr)
            (next-manchester ?d_m_curr ?d_m_next) ; Counter advances up to D4_M
        )
        :effect (and
            (not (total-time-is ?d_total_curr))
            (total-time-is ?d_total_next)
            
            (not (manchester-time-is ?d_m_curr))
            (manchester-time-is ?d_m_next)
            
            (increase (total-cost) -1)
        )
    )
    
    ; 2b. Sustain duration (Time >= 4)
    (:action spend_day_manchester_sustain
        :parameters (?d_total_curr - duration ?d_total_next - duration)
        :precondition (and
            (at manchester)
            (total-time-is ?d_total_curr)
            (next-total ?d_total_curr ?d_total_next)
            
            (manchester-time-is D4_M) ; Already reached maximum utility
        )
        :effect (and
            (not (total-time-is ?d_total_curr))
            (total-time-is ?d_total_next)
            
            ; manchester-time-is remains D4_M
        )
    )
    
    ; --- SPLIT Actions (Required: 6 days) ---

    ; 3a. Gain utility (Time < 6)
    (:action spend_day_split_gain
        :parameters (?d_total_curr - duration ?d_total_next - duration
                    ?d_s_curr - duration ?d_s_next - duration)
        :precondition (and
            (at split)
            (total-time-is ?d_total_curr)
            (next-total ?d_total_curr ?d_total_next)
            
            (split-time-is ?d_s_curr)
            (next-split ?d_s_curr ?d_s_next) ; Counter advances up to D6_S
        )
        :effect (and
            (not (total-time-is ?d_total_curr))
            (total-time-is ?d_total_next)
            
            (not (split-time-is ?d_s_curr))
            (split-time-is ?d_s_next)
            
            (increase (total-cost) -1)
        )
    )
    
    ; 3b. Sustain duration (Time >= 6)
    (:action spend_day_split_sustain
        :parameters (?d_total_curr - duration ?d_total_next - duration)
        :precondition (and
            (at split)
            (total-time-is ?d_total_curr)
            (next-total ?d_total_curr ?d_total_next)
            
            (split-time-is D6_S) ; Already reached maximum utility
        )
        :effect (and
            (not (total-time-is ?d_total_curr))
            (total-time-is ?d_total_next)
            
            ; split-time-is remains D6_S
        )
    )

)