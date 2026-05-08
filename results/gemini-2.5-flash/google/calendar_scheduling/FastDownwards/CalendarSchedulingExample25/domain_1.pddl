(define (domain calendar_scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_point
    )
    (:predicates
        (is_30min_slot ?tp - time_point) ; Marks a valid 30-minute interval start
        (next_30min_slot ?tp1 ?tp2 - time_point) ; ?tp2 is 30 minutes after ?tp1
        (available ?p - person ?tp - time_point) ; ?p is free for the 30-min slot starting at ?tp
        (pamela_prefers_meeting_start_at ?tp - time_point) ; Pamela's preference: a 1-hour meeting can start at ?tp
        (meeting_scheduled ?tp_start ?tp_end - time_point) ; Goal predicate: a 1-hour meeting is scheduled
    )

    (:action schedule_1hour_meeting
        :parameters (?start_slot - time_point ?middle_slot - time_point)
        :precondition (and
            (is_30min_slot ?start_slot)
            (is_30min_slot ?middle_slot)
            (next_30min_slot ?start_slot ?middle_slot)

            ; Anthony's availability for the 1-hour slot (spanning ?start_slot and ?middle_slot)
            (available anthony ?start_slot)
            (available anthony ?middle_slot)

            ; Pamela's availability for the 1-hour slot (spanning ?start_slot and ?middle_slot)
            (available pamela ?start_slot)
            (available pamela ?middle_slot)
            (pamela_prefers_meeting_start_at ?start_slot) ; Pamela's preference constraint

            ; Zachary's availability for the 1-hour slot (spanning ?start_slot and ?middle_slot)
            (available zachary ?start_slot)
            (available zachary ?middle_slot)
        )
        :effect (and
            (meeting_scheduled ?start_slot ?middle_slot)
        )
    )
)