(define (domain CALENDAR-SCHEDULER)
    (:requirements :strips :typing :negative-preconditions)
    (:types time_point slot - object)
    (:predicates
        ; Common temporal structure
        (is-successor ?t1 - time_point ?t2 - time_point)
        (slot-starts-at ?s - slot ?t_start - time_point)
        
        ; Anthony's constraints and availability
        (busy-Anthony ?p - time_point) 
        (available-Anthony ?s - slot)
        
        ; Pamela's constraints and availability (includes preference)
        (busy-Pamela ?p - time_point) 
        (slot-ends-at ?s - slot ?t_end - time_point)
        (too-late-end ?t - time_point) ; t > 14:30 (T11)
        (available-Pamela ?s - slot)
        
        ; Zachary's constraints and availability
        (busy-Zachary ?p - time_point) 
        (available-Zachary ?s - slot)
        
        ; Terminal condition
        (meeting-scheduled ?s - slot)
        (goal-achieved)
    )

    ; 1. Check Anthony's availability (A 1-hour slot starting at T_start requires T_start and T_mid to be free segments)
    (:action check_Anthony_availability
        :parameters (?s - slot ?t_start - time_point ?t_mid - time_point)
        :precondition (and
            (slot-starts-at ?s ?t_start)
            (is-successor ?t_start ?t_mid)
            (not (busy-Anthony ?t_start))
            (not (busy-Anthony ?t_mid))
        )
        :effect (available-Anthony ?s)
    )

    ; 2. Check Pamela's availability (Includes preference constraint against ending too late)
    (:action check_Pamela_availability
        :parameters (?s - slot ?t_start - time_point ?t_mid - time_point ?t_end - time_point)
        :precondition (and
            (slot-starts-at ?s ?t_start)
            (slot-ends-at ?s ?t_end)
            (is-successor ?t_start ?t_mid)
            (not (busy-Pamela ?t_start))
            (not (busy-Pamela ?t_mid))
            (not (too-late-end ?t_end)) 
        )
        :effect (available-Pamela ?s)
    )
    
    ; 3. Check Zachary's availability
    (:action check_Zachary_availability
        :parameters (?s - slot ?t_start - time_point ?t_mid - time_point)
        :precondition (and
            (slot-starts-at ?s ?t_start)
            (is-successor ?t_start ?t_mid)
            (not (busy-Zachary ?t_start))
            (not (busy-Zachary ?t_mid))
        )
        :effect (available-Zachary ?s)
    )

    ; 4. Final scheduling action
    (:action schedule_meeting
        :parameters (?s - slot)
        :precondition (and
            (available-Anthony ?s)
            (available-Pamela ?s)
            (available-Zachary ?s)
        )
        :effect (and
            (meeting-scheduled ?s)
            (goal-achieved)
        )
    )
)