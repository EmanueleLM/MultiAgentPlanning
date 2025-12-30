(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions)
    
    (:types location time-point)
    
    (:predicates
        (at ?l - location)
        (current-time ?t - time-point)
        (met-james)
        (james-at ?l - location)

        ; Specific travel transitions enforcing fixed durations
        (time-GGP-MD ?t_start ?t_end) ; 16 min required
        (time-MD-GGP ?t_start ?t_end) ; 18 min required
        
        ; Waiting transitions (used for arbitrary positive time intervals at a location)
        (time-wait ?t_start ?t_end)
        
        ; Meeting specific transition: 15 min duration, within [T75, T270].
        (meeting-transition ?t_start ?t_end) 
    )
    
    (:constants
        GGP - location 
        MD - location
    )

    (:action travel_GGP_MD
        :parameters (?t_start ?t_end - time-point)
        :precondition (and 
            (at GGP)
            (current-time ?t_start)
            (time-GGP-MD ?t_start ?t_end) ; Must be 16 min transition
        )
        :effect (and
            (not (at GGP)) (at MD)
            (not (current-time ?t_start)) (current-time ?t_end)
        )
    )
    
    (:action travel_MD_GGP
        :parameters (?t_start ?t_end - time-point)
        :precondition (and 
            (at MD)
            (current-time ?t_start)
            (time-MD-GGP ?t_start ?t_end) ; Must be 18 min transition
        )
        :effect (and
            (not (at MD)) (at GGP)
            (not (current-time ?t_start)) (current-time ?t_end)
        )
    )
    
    (:action wait_at_location
        :parameters (?l - location ?t_current ?t_meeting - time-point)
        :precondition (and 
            (at ?l)
            (not (met-james))
            (current-time ?t_current)
            (time-wait ?t_current ?t_meeting) 
        )
        :effect (and
            (not (current-time ?t_current))
            (current-time ?t_meeting)
        )
    )

    (:action meet_james
        :parameters (?t_start ?t_end - time-point)
        :precondition (and
            (at MD)
            (james-at MD)
            (not (met-james))
            (current-time ?t_start)
            (meeting-transition ?t_start ?t_end) 
        )
        :effect (and
            (met-james)
            (not (current-time ?t_start))
            (current-time ?t_end)
        )
    )