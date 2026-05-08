(define (domain scheduling)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        time_point - object
        participant - object
    )
    
    (:functions
        (total-cost) - number
    )

    (:predicates
        ; Temporal structure: t2 is 30 minutes after t1
        (successor ?t1 ?t2 - time_point) 
        
        ; Status flag: t is a valid start time for a 60 min meeting (i.e., t+60 <= T1700)
        (valid_60min_start ?t - time_point) 
        
        ; Availability: Participant p is free during the 30-minute interval [t_start, t_end]
        (is_available_30min ?p - participant ?t_start ?t_end - time_point) 
        
        ; Status flags
        (meeting_scheduled ?t_start ?t_end - time_point)
        (schedule_found)
    )
    
    (:action schedule_meeting
        :parameters (?start ?mid ?end - time_point)
        :precondition (and
            ; 1. Temporal constraints: 60 minutes duration
            (valid_60min_start ?start) 
            (successor ?start ?mid) ; Start + 30 min = Mid
            (successor ?mid ?end)   ; Mid + 30 min = End
            
            ; 2. Availability constraints (First 30 minutes: [Start, Mid])
            (is_available_30min katherine ?start ?mid)
            (is_available_30min nicole ?start ?mid)
            (is_available_30min kevin ?start ?mid)
            
            ; 3. Availability constraints (Second 30 minutes: [Mid, End])
            (is_available_30min katherine ?mid ?end)
            (is_available_30min nicole ?mid ?end)
            (is_available_30min kevin ?mid ?end)
        )
        :effect (and
            (meeting_scheduled ?start ?end)
            (schedule_found)
            (increase (total-cost) 1)
        )
    )