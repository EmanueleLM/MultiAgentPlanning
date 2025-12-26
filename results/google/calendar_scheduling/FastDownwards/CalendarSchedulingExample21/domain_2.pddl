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
        :parameters (?t_start - time_point ?t_mid - time_point ?t_end - time_point)
        :precondition (and
            ; 1. Time progression: defines the 1-hour contiguous duration
            (next_slot ?t_start ?t_mid)
            (next_slot ?t_mid ?t_end) 

            ; 2. Availability check: Slot 1 (?t_start)
            (available bobby ?t_start)
            (available scott ?t_start)
            (available kimberly ?t_start)

            ; 3. Availability check: Slot 2 (?t_mid)
            (available bobby ?t_mid)
            (available scott ?t_mid)
            (available kimberly ?t_mid)

            ; 4. Goal constraint: ensure meeting hasn't been scheduled yet
            (not (meeting_scheduled))
        )
        :effect (meeting_scheduled)
    )