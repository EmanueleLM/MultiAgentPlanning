(define (domain calendar-scheduling)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        person
        timeslot
    )
    (:predicates
        (available ?p - person ?t - timeslot)
        (current_timeslot ?t - timeslot)
        (next_slot ?t1 - timeslot ?t2 - timeslot)
        (meeting_scheduled ?t - timeslot)
        (helen_preference_met ?t - timeslot) ; True if Helen's preference allows meeting at this slot
    )

    (:functions (total-cost))

    (:action schedule_meeting)
        :parameters (?t - timeslot)
        :precondition (and
            (current_timeslot ?t)
            (available margaret ?t)
            (available donna ?t)
            (available helen ?t)
            (helen_preference_met ?t)
        )
        :effect (and
            (meeting_scheduled ?t)
            ; This action has an implicit cost of 0 by not increasing total-cost
        )

    (:action try_next_timeslot)
        :parameters (?current_t - timeslot ?next_t - timeslot)
        :precondition (and
            (current_timeslot ?current_t)
            (next_slot ?current_t ?next_t)
            (not (meeting_scheduled ?current_t)) ; Only advance if no meeting is scheduled at current_t
        )
        :effect (and
            (not (current_timeslot ?current_t))
            (current_timeslot ?next_t)
            (increase (total-cost) 1) ; Cost 1 for advancing to the next timeslot
        )
)