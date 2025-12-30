(define (domain scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        time - object
        participant - object
    )
    (:constants
        ralph peter daniel - participant
    )

    (:predicates
        (succeeds ?t1 - time ?t2 - time)
        (is_available ?p - participant ?t - time)
        (is_preferred_by_daniel ?t - time) 
        
        (meeting_scheduled ?t - time)
        (found_schedule)
    )

    (:action schedule_meeting
        :parameters (?t - time)
        :precondition (and 
            (not (found_schedule))
            
            (is_available ralph ?t)
            (is_available peter ?t)
            (is_available daniel ?t)
            
            (is_preferred_by_daniel ?t)
        )
        :effect (and 
            (meeting_scheduled ?t)
            (found_schedule)
        )
    )
)