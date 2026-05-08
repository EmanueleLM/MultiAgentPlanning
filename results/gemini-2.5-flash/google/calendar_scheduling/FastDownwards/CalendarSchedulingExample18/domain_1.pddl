(define (domain calendar_scheduling_example_18)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        person
        time_slot
    )
    (:predicates
        (person_available ?p - person ?s - time_slot)
        (meeting_scheduled ?s - time_slot)
        (billy_avoids_after_1530 ?s - time_slot)
    )
    (:functions (total-cost))

    (:action schedule_meeting
        :parameters (?s - time_slot)
        :precondition (and
            (person_available brian ?s)
            (person_available billy ?s)
            (person_available patricia ?s)
            (not (meeting_scheduled ?s))
        )
        :effect (and
            (meeting_scheduled ?s)
            (increase (total-cost)
                (when (billy_avoids_after_1530 ?s) 1)
            )
        )
    )
)