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
        :parameters (?s1 ?s2 - time_slot)
        :precondition (and
            (next_slot ?s1 ?s2)
            (not (blocked michelle ?s1))
            (not (blocked michelle ?s2))
            (not (blocked steven ?s1))
            (not (blocked steven ?s2))
            (not (blocked jerry ?s1))
            (not (blocked jerry ?s2))
        )
        :effect (and (meeting_scheduled)
                     ; The actual effect might be to mark slots as occupied,
                     ; but for this task, simply asserting meeting_scheduled is enough.
        )
    )
)