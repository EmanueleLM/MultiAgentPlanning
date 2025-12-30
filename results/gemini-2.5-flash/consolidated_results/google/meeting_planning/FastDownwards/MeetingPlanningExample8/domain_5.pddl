(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
        person
        timepoint
        minute-step
    )
    (:predicates
        (at ?l - location)
        (met ?p - person)
        (meeting-ongoing ?p - person)
        (at-time ?t - timepoint)
        (S-met-m ?m - minute-step)
        
        ;; Predicates defining time sequences/jumps
        (is-next-minute ?m1 ?m2 - minute-step)
        (is-12-minutes-after ?t1 ?t2 - timepoint) ; C -> M (12 min)
        (is-16-minutes-after ?t1 ?t2 - timepoint) ; M -> C (16 min)
        (is-1-minute-after ?t1 ?t2 - timepoint) ; Explicit 1 minute progression
        (can-wait-time ?t1 ?t2 - timepoint) ; Large, scheduled time progression
        
        ;; Hard Constraint Enforcement (Feasibility checks)
        (before-t256 ?t - timepoint) ; Time t <= 255 (Latest Start Time for meeting 105 mins before T360)
        (before-t361 ?t - timepoint) ; Time t <= 360 (Deadline)
    )

    ;; Travel Chinatown -> Marina District (12 mins)
    (:action travel_chinatown_to_marina
        :parameters (?t1 ?t12 - timepoint)
        :precondition (and (at chinatown)
                          (at-time ?t1)
                          (not (meeting-ongoing stephanie))
                          (is-12-minutes-after ?t1 ?t12)
                          (before-t361 ?t12)
                        )
        :effect (and (not (at chinatown))
                    (at marinadistrict)
                    (not (at-time ?t1))
                    (at-time ?t12)
        )
    )

    ;; Travel Marina District -> Chinatown (16 mins)
    (:action travel_marina_to_chinatown
        :parameters (?t1 ?t16 - timepoint)
        :precondition (and (at marinadistrict)
                          (at-time ?t1)
                          (not (meeting-ongoing stephanie))
                          (is-16-minutes-after ?t1 ?t16)
                          (before-t361 ?t16)
                        )
        :effect (and (not (at marinadistrict))
                    (at chinatown)
                    (not (at-time ?t1))
                    (at-time ?t16)
        )
    )
    
    ;; Wait action (Used for scheduling flexibility)
    (:action wait_for_schedule
        :parameters (?t1 ?t2 - timepoint ?l - location)
        :precondition (and (at ?l)
                          (at-time ?t1)
                          (not (meeting-ongoing stephanie))
                          (can-wait-time ?t1 ?t2) 
                          (before-t361 ?t2)
                          )
        :effect (and (not (at-time ?t1))
                    (at-time ?t2)
        )
    )

    ;; Start Meeting Stephanie
    (:action start_meeting_stephanie
        :parameters (?t - timepoint)
        :precondition (and (at marinadistrict)
                          (not (met stephanie))
                          (not (meeting-ongoing stephanie))
                          (at-time ?t)
                          (before-t256 ?t) 
                          )
        :effect (and (meeting-ongoing stephanie)
                    (S-met-m m0) 
        )
    )
    
    ;; Required Meeting Increment (1 minute time step)
    (:action meet_stephanie_required_increment
        :parameters (?t1 ?t2 - timepoint ?m1 ?m2 - minute-step)
        :precondition (and (meeting-ongoing stephanie)
                          (at-time ?t1)
                          (S-met-m ?m1)
                          (is-next-minute ?m1 ?m2)
                          (is-1-minute-after ?t1 ?t2) 
                          (before-t361 ?t2)
                          )
        :effect (and (not (S-met-m ?m1))
                    (S-met-m ?m2)
                    (not (at-time ?t1))
                    (at-time ?t2)
        )
    )

    ;; End Meeting Stephanie (Requires m105 reached, 105 min minimum satisfied)
    (:action end_meeting_stephanie
        :parameters (?t - timepoint)
        :precondition (and (meeting-ongoing stephanie)
                          (at-time ?t)
                          (S-met-m m105)
                          )
        :effect (and (not (meeting-ongoing stephanie))
                    (met stephanie)
        )
    )

    ;; Optional continuation after m105 (1 minute extension)
    (:action meet_stephanie_extension
        :parameters (?t1 ?t2 - timepoint)
        :precondition (and (meeting-ongoing stephanie)
                          (S-met-m m105)
                          (at-time ?t1)
                          (is-1-minute-after ?t1 ?t2) 
                          (before-t361 ?t2)
                          )
        :effect (and (not (at-time ?t1))
                    (at-time ?t2)
        )
    )