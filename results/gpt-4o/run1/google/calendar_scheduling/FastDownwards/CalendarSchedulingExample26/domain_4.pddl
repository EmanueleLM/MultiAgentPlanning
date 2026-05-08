(define (domain schedule_meeting)
    (:requirements :strips :typing :negative-preconditions)
    (:types participant time_slot)

    (:predicates
        ; Participants' availability during time slots
        (is_free ?p - participant ?t - time_slot)
        ; Check if a meeting can be scheduled in a time slot
        (meeting_possible ?t - time_slot)
        ; Meeting has been scheduled for the participant
        (meeting_scheduled ?p - participant ?t - time_slot)
        ; Time slots are in sequence
        (adjacent ?t1 - time_slot ?t2 - time_slot)
    )

    ; Action to schedule a meeting
    (:action schedule_meeting
        :parameters (?t - time_slot)
        :precondition
        (and
            (meeting_possible ?t)
            (is_free katherine ?t)
            (is_free nicole ?t)
            (is_free kevin ?t)
        )
        :effect
        (and
            (meeting_scheduled katherine ?t)
            (meeting_scheduled nicole ?t)
            (meeting_scheduled kevin ?t)
        )
    )
)