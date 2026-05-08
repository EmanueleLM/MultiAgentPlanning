(define (domain calendar_scheduling_example0)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_slot
    )
    (:predicates
        (available ?p - person ?s - time_slot)
        (next_slot ?s1 - time_slot ?s2 - time_slot)
        (meeting_scheduled) ; A flag to indicate a meeting has been scheduled
        (meeting_scheduled_start ?s - time_slot) ; To record the start slot of the meeting
    )
    (:action schedule_meeting
        :parameters (?p1 ?p2 ?p3 - person
                     ?start_slot - time_slot
                     ?second_slot - time_slot)
        :precondition (and
            (next_slot ?start_slot ?second_slot)
            (available ?p1 ?start_slot)
            (available ?p1 ?second_slot)
            (available ?p2 ?start_slot)
            (available ?p2 ?second_slot)
            (available ?p3 ?start_slot)
            (available ?p3 ?second_slot)
            (not (meeting_scheduled)) ; Ensure only one meeting is scheduled
        )
        :effect (and
            (meeting_scheduled)
            (meeting_scheduled_start ?start_slot)
        )
    )
)