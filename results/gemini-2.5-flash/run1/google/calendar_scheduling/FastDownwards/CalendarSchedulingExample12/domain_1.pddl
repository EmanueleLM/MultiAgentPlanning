(define (domain calendar_scheduling_example_12)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_slot
    )
    (:predicates
        (is_available ?p - person ?s - time_slot)
        (next_slot ?s1 - time_slot ?s2 - time_slot) ; s2 immediately follows s1 (30 min interval)
        (meeting_scheduled ?s1 - time_slot ?s2 - time_slot) ; a 1-hour meeting scheduled from s1 to s2
    )
    (:action schedule_meeting_one_hour
        :parameters (?s1 - time_slot ?s2 - time_slot)
        :precondition (and
            (next_slot ?s1 ?s2) ; Ensure s2 is the slot immediately after s1 (for 1 hour duration)
            (is_available david ?s1)
            (is_available david ?s2)
            (is_available debra ?s1)
            (is_available debra ?s2)
            (is_available kevin ?s1)
            (is_available kevin ?s2)
        )
        :effect (meeting_scheduled ?s1 ?s2)
    )
)