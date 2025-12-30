(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions :durative-actions :action-costs)

    (:types 
        location
    )

    (:predicates
        (at ?l - location)
        (arrived_rh)        
        (ronald_ready)      
        (min_duration_met)  
        (meeting_ended)
        (at_max_time)
    )
    
    (:functions
        (meeting_time)
    )

    ; 1. Travel Chinatown -> Russian Hill (7 min duration)
    (:durative-action travel_c_rh
        :parameters ()
        :duration (= ?duration 7)
        :condition (at start (at chinatown))
        :effect (and
            (at end (not (at chinatown)))
            (at end (at russian_hill))
            (at end (arrived_rh))
        )
    ) 

    ; 2. Wait for Ronald (428 min duration: 9:07 AM -> 3:15 PM)
    ; Arrival 547 min, Ronald ready 975 min. 975 - 547 = 428 min wait.
    (:durative-action wait_for_ronald_start
        :parameters ()
        :duration (= ?duration 428)
        :condition (and 
            (at start (at russian_hill)) 
            (at start (arrived_rh))
            (at start (not (ronald_ready)))
        )
        :effect (at end (ronald_ready))
    ) 

    ; 3. Meet Mandatory Minimum (105 min contribution to meeting time)
    (:durative-action meet_ronald_min
        :parameters ()
        :duration (= ?duration 105)
        :condition (and 
            (at start (at russian_hill)) 
            (at start (ronald_ready)) 
            (at start (not (min_duration_met)))
        )
        :effect (and
            (at end (min_duration_met))
            (at end (increase (meeting_time) 105))
        )
    ) 

    ; 4. Maximize Meeting Time (Remaining 270 extra minutes)
    ; Total meeting time max 375 min (105 + 270).
    (:durative-action meet_ronald_extra_max
        :parameters ()
        :duration (= ?duration 270)
        :condition (and 
            (at start (at russian_hill)) 
            (at start (min_duration_met))
            (at start (not (at_max_time)))
        )
        :effect (and
            (at end (at_max_time)) 
            (at end (increase (meeting_time) 270))
        )
    ) 

    ; 5. Travel Russian Hill -> Chinatown (9 min duration)
    (:durative-action travel_rh_c
        :parameters ()
        :duration (= ?duration 9)
        :condition (and (at start (at russian_hill)) (at start (at_max_time)))
        :effect (and
            (at end (not (at russian_hill)))
            (at end (at chinatown))
            (at end (meeting_ended)) 
        )
    )
)