(define (domain calendar_scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_point
    )
    (:predicates
        (person_free ?p - person ?t - time_point)
        (next_time ?t1 - time_point ?t2 - time_point)
        (meeting_scheduled ?start_t - time_point ?end_t - time_point)
    )

    (:action schedule_one_hour_meeting
        :parameters (?start_slot_1 - time_point ?start_slot_2 - time_point ?end_slot - time_point)
        :precondition (and
            ;; Ensure the slots are consecutive and form a 60-minute duration
            (next_time ?start_slot_1 ?start_slot_2)
            (next_time ?start_slot_2 ?end_slot)

            ;; All participants must be free for the first 30-minute segment
            (person_free katherine ?start_slot_1)
            (person_free nicole ?start_slot_1)
            (person_free kevin ?start_slot_1)

            ;; All participants must be free for the second 30-minute segment
            (person_free katherine ?start_slot_2)
            (person_free nicole ?start_slot_2)
            (person_free kevin ?start_slot_2)
        )
        :effect (and
            (meeting_scheduled ?start_slot_1 ?end_slot)
        )
    )
)