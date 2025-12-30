(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location
        person
    )
    (:predicates
        (at ?l - location)
        (met ?p - person)
        (meeting-ongoing ?p - person)
    )
    (:functions
        (current-time) ; Minutes relative to 9:00 AM
        (meeting-duration ?p - person)
        (total-friends-met)
    )

    ;; Travel Chinatown -> Marina District (12 mins)
    (:action travel_chinatown_to_marina
        :parameters ()
        :precondition (and (at chinatown)
                          (not (meeting-ongoing stephanie))
                          (< (current-time) 360) 
                          )
        :effect (and (not (at chinatown))
                    (at marinadistrict)
                    (increase (current-time) 12)
        )
    )

    ;; Travel Marina District -> Chinatown (16 mins)
    (:action travel_marina_to_chinatown
        :parameters ()
        :precondition (and (at marinadistrict)
                          (not (meeting-ongoing stephanie))
                          (< (current-time) 360) 
                          )
        :effect (and (not (at marinadistrict))
                    (at chinatown)
                    (increase (current-time) 16)
        )
    )

    ;; Start Meeting Stephanie
    ;; Must start by T=255 (360 - 105) to guarantee 105 minutes.
    (:action start_meeting_stephanie
        :parameters ()
        :precondition (and (at marinadistrict)
                          (not (met stephanie))
                          (not (meeting-ongoing stephanie))
                          (<= (current-time) 255) 
                          )
        :effect (meeting-ongoing stephanie)
    )
    
    ;; Continue Meeting Stephanie (1 minute increment)
    ;; Must stop before current time reaches 359, so the next increment doesn't exceed 360.
    (:action meet_stephanie_increment
        :parameters ()
        :precondition (and (meeting-ongoing stephanie)
                          (< (current-time) 359) 
                          )
        :effect (and (increase (current-time) 1)
                    (increase (meeting-duration stephanie) 1)
        )
    )

    ;; End Meeting Stephanie
    ;; Minimum duration 105 minutes required.
    (:action end_meeting_stephanie
        :parameters ()
        :precondition (and (meeting-ongoing stephanie)
                          (>= (meeting-duration stephanie) 105)
                          )
        :effect (and (not (meeting-ongoing stephanie))
                    (met stephanie)
                    (increase (total-friends-met) 1)
        )
    )
)