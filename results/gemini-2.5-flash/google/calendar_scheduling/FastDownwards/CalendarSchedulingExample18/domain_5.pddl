(define (domain calendar_scheduling_example_18)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        time_slot
        person
    )
    (:constants
        brian - person
        billy - person
        patricia - person
    )
    (:predicates
        (person_available ?p - person ?s - time_slot)
        (meeting_scheduled ?s - time_slot)
        (billy_avoids_after_1530 ?s - time_slot)
        (meeting_scheduled_overall)
    )
    (:functions (total-cost))

    ;; Action for scheduling a meeting in a slot Billy does NOT avoid
    (:action schedule_meeting_preferred_slot
        :parameters (?s - time_slot)
        :precondition (and
            (person_available brian ?s)
            (person_available billy ?s)
            (person_available patricia ?s)
            (not (meeting_scheduled ?s))
            (not (billy_avoids_after_1530 ?s)) ; Billy does NOT avoid this slot
            (not (meeting_scheduled_overall)) ; Ensure only one meeting is scheduled
        )
        :effect (and
            (meeting_scheduled ?s)
            (meeting_scheduled_overall) ; Set the overall goal predicate
            (increase (total-cost) 0) ; No cost for preferred slots
        )
    )

    ;; Action for scheduling a meeting in a slot Billy DOES avoid
    (:action schedule_meeting_avoided_slot
        :parameters (?s - time_slot)
        :precondition (and
            (person_available brian ?s)
            (person_available billy ?s)
            (person_available patricia ?s)
            (not (meeting_scheduled ?s))
            (billy_avoids_after_1530 ?s) ; Billy DOES avoid this slot
            (not (meeting_scheduled_overall)) ; Ensure only one meeting is scheduled
        )
        :effect (and
            (meeting_scheduled ?s)
            (meeting_scheduled_overall) ; Set the overall goal predicate
            (increase (total-cost) 1) ; Cost of 1 for avoided slots
        )
    )