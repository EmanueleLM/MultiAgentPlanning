(define (domain calendar_scheduling_orchestrator)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_point
        meeting_start_1hr_slot
    )
    (:constants
        theresa charles betty - person
    )
    (:predicates
        (person_available ?p - person ?tp - time_point)
        (first_half_of_hour ?ms - meeting_start_1hr_slot ?tp1 - time_point)
        (second_half_of_hour ?ms - meeting_start_1hr_slot ?tp2 - time_point)
        (next_hour_slot ?ms1 - meeting_start_1hr_slot ?ms2 - meeting_start_1hr_slot)
        (current_candidate ?ms - meeting_start_1hr_slot)
        (meeting_scheduled_at ?ms - meeting_start_1hr_slot)
        (schedule_found)
    )

    (:action try_schedule_meeting
        :parameters (?ms - meeting_start_1hr_slot
                      ?tp1 - time_point
                      ?tp2 - time_point)
        :precondition (and
            (current_candidate ?ms)
            (first_half_of_hour ?ms ?tp1)
            (second_half_of_hour ?ms ?tp2)
            (person_available theresa ?tp1)
            (person_available theresa ?tp2)
            (person_available charles ?tp1)
            (person_available charles ?tp2)
            (person_available betty ?tp1)
            (person_available betty ?tp2)
        )
        :effect (and
            (meeting_scheduled_at ?ms)
            (schedule_found)
            (not (current_candidate ?ms))
        )
    )

    (:action advance_candidate
        :parameters (?ms_current - meeting_start_1hr_slot
                      ?ms_next - meeting_start_1hr_slot)
        :precondition (and
            (current_candidate ?ms_current)
            (next_hour_slot ?ms_current ?ms_next)
            (not (schedule_found))
        )
        :effect (and
            (not (current_candidate ?ms_current))
            (current_candidate ?ms_next)
        )
    )
)