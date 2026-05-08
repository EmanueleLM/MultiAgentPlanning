(define (domain meeting-planning-domain)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location
        person
    )
    (:predicates
        (at ?l - location)
        (T-at-794) ; Ready to depart A (9:00 AM + 254 min = 1:14 PM)
        (T-at-810) ; Arrived at S, meeting window start (1:30 PM)
        (T-at-825) ; Minimum meeting duration satisfied (1:45 PM)
        (meeting-started)
        (met ?p - person)
    )

    (:functions
        (current-time)
    )

    ; 1. Wait/Idle at Alamo Square (540 -> 794: duration 254 min)
    (:action wait-for-departure-window
        :parameters ()
        :preconditions (and (at alamo-square)
                            (not (T-at-794))
                       )
        :effect (and (T-at-794)
                     (increase (current-time) 254)
                )
    )
    
    ; 2. Travel A -> S (794 -> 810: duration 16 min)
    (:action travel-A-S
        :parameters ()
        :preconditions (and (at alamo-square)
                            (T-at-794)
                            (not (T-at-810))
                       )
        :effect (and (not (at alamo-square))
                     (at sunset-district)
                     (not (T-at-794))
                     (T-at-810)
                     (increase (current-time) 16)
                )
    )
    
    ; 3. Start Meeting (At T=810, 1:30 PM)
    (:action start-meeting
        :parameters (?p - person)
        :preconditions (and (at sunset-district)
                            (T-at-810)
                            (not (meeting-started))
                       )
        :effect (and (meeting-started)
                )
    )

    ; 4. Meet (Minimum 15 minutes) (810 -> 825, 1:45 PM)
    (:action meet-matthew
        :parameters (?p - person)
        :preconditions (and (at sunset-district)
                            (meeting-started)
                            (not (T-at-825))
                       )
        :effect (and (met ?p)
                     (not (meeting-started)) 
                     (not (T-at-810))
                     (T-at-825)
                     (increase (current-time) 15)
                )
    )
    
    ; 5. Travel S -> A (825 -> 842: duration 17 min)
    (:action travel-S-A
        :parameters ()
        :preconditions (and (at sunset-district)
                            (T-at-825)
                            (met matthew)
                       )
        :effect (and (not (at sunset-district))
                     (at alamo-square)
                     (increase (current-time) 17)
                )
    )

)