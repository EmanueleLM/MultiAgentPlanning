(define (domain calendar-scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_slot
    )
    (:predicates
        (person_available ?p - person ?s - time_slot)
        (next_slot ?s1 ?s2 - time_slot)
        (meeting_scheduled_at ?s - time_slot)
        (current_consideration_slot ?s - time_slot)
    )
    (:action advance_consideration
        :parameters (?s1 - time_slot ?s2 - time_slot)
        :precondition (and
            (current_consideration_slot ?s1)
            (next_slot ?s1 ?s2)
            (not (meeting_scheduled_at ?s1)) ; Only advance if no meeting has been scheduled at s1
        )
        :effect (and
            (not (current_consideration_slot ?s1))
            (current_consideration_slot ?s2)
        )
    )
    (:action schedule_meeting
        :parameters (?s - time_slot)
        :precondition (and
            (current_consideration_slot ?s)
            (person_available margaret ?s)
            (person_available donna ?s)
            (person_available helen ?s)
        )
        :effect (meeting_scheduled_at ?s)
    )
)