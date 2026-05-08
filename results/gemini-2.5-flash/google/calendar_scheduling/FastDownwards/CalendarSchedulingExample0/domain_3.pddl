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
        :parameters (?start_slot - time_slot
                     ?second_slot - time_slot)
        :precondition (and
            (next_slot ?start_slot ?second_slot)
            ; All required participants must be available for both 30-minute slots
            (available michelle ?start_slot)
            (available michelle ?second_slot)
            (available steven ?start_slot)
            (available steven ?second_slot)
            (available jerry ?start_slot)
            (available jerry ?second_slot)
            (not (meeting_scheduled)) ; Ensure only one meeting is scheduled
        )
        :effect (and
            (meeting_scheduled)
            (meeting_scheduled_start ?start_slot)
        )
    )
)