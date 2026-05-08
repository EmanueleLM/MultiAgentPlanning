(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)

    (:types 
        location
    )

    (:predicates
        (at ?l - location)
        
        ; Tracking sequential progress
        (travel_c_rh_complete) 
        (ronald_ready)      ; State reached after mandatory wait period (9:07 AM -> 3:15 PM)
        (min_duration_met)  ; 105 minutes minimum duration met
        (max_meeting_time_achieved) ; 9:30 PM deadline reached
        (travel_rh_c_complete)
    )
    
    (:functions
        (meeting_time)
    )

    ; 1. Travel Chinatown -> Russian Hill (7 min implicit)
    (:action travel_c_rh
        :parameters ()
        :precondition (at chinatown)
        :effect (and
            (not (at chinatown))
            (at russian_hill)
            (travel_c_rh_complete)
        )
    ) 

    ; 2. Wait for Ronald (428 min implicit wait)
    (:action wait_for_ronald
        :parameters ()
        :precondition (and 
            (at russian_hill) 
            (travel_c_rh_complete)
            (not (ronald_ready))
        )
        :effect (ronald_ready) ; Ronald is available at 3:15 PM
    ) 

    ; 3. Meet Mandatory Minimum (105 min meeting contribution)
    (:action meet_ronald_min
        :parameters ()
        :precondition (and 
            (at russian_hill) 
            (ronald_ready) 
            (not (min_duration_met))
        )
        :effect (and
            (min_duration_met)
            (increase (meeting_time) 105)
        )
    ) 

    ; 4. Maximize Meeting Time (Remaining 270 minutes, up to 9:30 PM deadline)
    (:action meet_ronald_extra_max
        :parameters ()
        :precondition (and 
            (at russian_hill) 
            (min_duration_met)
            (not (max_meeting_time_achieved))
        )
        :effect (and
            (max_meeting_time_achieved) 
            (increase (meeting_time) 270)
        )
    ) 

    ; 5. Travel Russian Hill -> Chinatown (9 min implicit)
    (:action travel_rh_c
        :parameters ()
        :precondition (and 
            (at russian_hill) 
            (max_meeting_time_achieved) ; Ensures maximization goal is pursued before leaving
        )
        :effect (and
            (not (at russian_hill))
            (at chinatown)
            (travel_rh_c_complete)
        )
    )
)