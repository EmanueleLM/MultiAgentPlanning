(define (domain scheduling_meeting)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        time_point
        participant
    )

    (:predicates
        (next_slot ?t1 - time_point ?t2 - time_point)
        (available ?p - participant ?t - time_point) ; True if P is free in the 30 min slot starting at T
        (meeting_scheduled)
    )

    (:action schedule_1_hour_meeting
        :parameters (?p1 - participant ?p2 - participant ?p3 - participant 
                     ?t_start - time_point ?t_mid - time_point ?t_end - time_point)
        :precondition (and
            ; 1. Time progression: defines the 1-hour contiguous duration
            (next_slot ?t_start ?t_mid)
            (next_slot ?t_mid ?t_end) 

            ; 2. Availability check: Slot 1 (?t_start)
            (available ?p1 ?t_start)
            (available ?p2 ?t_start)
            (available ?p3 ?t_start)

            ; 3. Availability check: Slot 2 (?t_mid)
            (available ?p1 ?t_mid)
            (available ?p2 ?t_mid)
            (available ?p3 ?t_mid)

            ; 4. Goal constraint
            (not (meeting_scheduled))
        )
        :effect (meeting_scheduled)
    )
)