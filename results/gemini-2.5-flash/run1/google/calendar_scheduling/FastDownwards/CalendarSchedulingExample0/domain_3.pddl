(define (domain calendar_scheduling_example0)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_slot
    )
    (:predicates
        (blocked ?p - person ?t - time_slot)
        (next_slot ?t1 - time_slot ?t2 - time_slot)
        (meeting_scheduled)
    )

    (:action schedule_meeting
        :parameters (?s1 ?s2 - time_slot) ; Removed specific person parameters
        :precondition (and
            (next_slot ?s1 ?s2)
            (not (blocked michelle ?s1)) ; Hardcoded specific person objects
            (not (blocked michelle ?s2))
            (not (blocked steven ?s1))   ; Hardcoded specific person objects
            (not (blocked steven ?s2))
            (not (blocked jerry ?s1))    ; Hardcoded specific person objects
            (not (blocked jerry ?s2))
        )
        :effect (meeting_scheduled)
    )