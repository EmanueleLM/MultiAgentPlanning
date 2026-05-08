(define (domain calendar-scheduling)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        person
        timeslot
    )
    (:constants margaret donna helen - person)
    (:predicates
        (available ?p - person ?t - timeslot)
        (current_timeslot ?t - timeslot)
        (next_slot ?t1 - timeslot ?t2 - timeslot)
        (meeting_scheduled ?t - timeslot)
        (helen_preference_met ?t - timeslot)
        (meeting_found) ; New predicate to indicate a meeting has been scheduled
    )

    (:functions (total-cost))

    (:action schedule_meeting
        :parameters (?t - timeslot)
        :precondition (and
            (current_timeslot ?t)
            (available margaret ?t)
            (available donna ?t)
            (available helen ?t)
            (helen_preference_met ?t)
        )
        :effect (and
            (meeting_scheduled ?t) ; Keeping this for traceability in the plan output
            (meeting_found)        ; Set this predicate to true to satisfy the goal
        )
    )

    (:action try_next_timeslot
        :parameters (?current_t - timeslot ?next_t - timeslot)
        :precondition (and
            (current_timeslot ?current_t)
            (next_slot ?current_t ?next_t)
            (not (meeting_found)) ; Only advance if a meeting hasn't already been found
        )
        :effect (and
            (not (current_timeslot ?current_t))
            (current_timeslot ?next_t)
            (increase (total-cost) 1) ; Cost 1 for advancing to the next timeslot
        )
    )