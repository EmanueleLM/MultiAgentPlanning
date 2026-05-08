(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)

    (:types 
        location
    )

    (:predicates
        (at ?l - location)
        (arrived_rh)        
        (ronald_ready)      
        (min_duration_met)  
        (meeting_ended)
        (at_max_time) ; Marker indicating meeting continued until Ronald's departure (T=1290)
    )
    
    (:functions
        (meeting_time) ; Total time spent meeting Ronald (in minutes), used for maximization
    )

    ; 1. Travel Chinatown -> Russian Hill (7 min duration implied by sequence)
    (:action travel_c_rh
        :parameters ()
        :precondition (at chinatown)
        :effect (and
            (not (at chinatown))
            (at russian_hill)
            (arrived_rh)
        )
    ) 

    ; 2. Wait for Ronald (368 min wait implied by sequence timing)
    (:action wait_for_ronald_start
        :parameters ()
        :precondition (and (at russian_hill) (arrived_rh) (not (ronald_ready)))
        :effect (ronald_ready)
    ) 

    ; 3. Meet Mandatory Minimum (105 min contribution to meeting time)
    (:action meet_ronald_min
        :parameters ()
        :precondition (and (at russian_hill) (ronald_ready) (not (min_duration_met)))
        :effect (and
            (min_duration_met)
            (increase (meeting_time) 105)
        )
    ) 

    ; 4. Maximize Meeting Time (Remaining 270 extra minutes)
    ; This action is required by the goal to maximize the metric.
    (:action meet_ronald_extra_max
        :parameters ()
        :precondition (and (at russian_hill) (min_duration_met) (not (at_max_time)))
        :effect (and
            (at_max_time) 
            (increase (meeting_time) 270)
        )
    ) 

    ; 5. End Meeting setup
    (:action end_meeting
        :parameters ()
        :precondition (and (at russian_hill) (at_max_time) (not (meeting_ended)))
        :effect (meeting_ended)
    )

    ; 6. Travel Russian Hill -> Chinatown (9 min duration implied)
    (:action travel_rh_c
        :parameters ()
        :precondition (and (at russian_hill) (meeting_ended))
        :effect (and
            (not (at russian_hill))
            (at chinatown)
        )
    )
)