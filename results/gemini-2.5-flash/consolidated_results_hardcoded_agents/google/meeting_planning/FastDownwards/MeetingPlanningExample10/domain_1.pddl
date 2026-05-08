(define (domain meeting-planning-propositional)
    (:requirements :strips :typing :negative-preconditions)
    
    (:types location time-point)
    
    (:predicates
        (at ?l - location)
        (current-time ?t - time-point)
        (met-james)
        (james-at ?l - location)

        ; Time transitions: Defines if transition from T_start to T_end matches a specific required duration (travel or wait duration).
        (time-transition ?t_start ?t_end)
        
        ; Meeting specific transition: Ensures 15 minute duration, T_start >= 75 min, T_end <= 270 min.
        (meeting-transition ?t_start ?t_end) 
    )

    (:constants
        GGP - location 
        MD - location
    )

    (:action travel
        :parameters (?from ?to - location ?t_start ?t_end - time-point)
        :precondition (and 
            (at ?from)
            (current-time ?t_start)
            (time-transition ?t_start ?t_end)
        )
        :effect (and
            (not (at ?from)) (at ?to)
            (not (current-time ?t_start)) (current-time ?t_end)
        )
    )
    
    (:action wait_at_location
        :parameters (?l - location ?t_current ?t_meeting - time-point)
        :precondition (and 
            (at ?l)
            (not (met-james))
            (current-time ?t_current)
            (time-transition ?t_current ?t_meeting) 
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
)