(define (domain calendar_scheduling_orchestrator)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_point ; Represents a 30-minute time interval (e.g., 9:00-9:30)
        meeting_start_1hr_slot ; Represents the start time of a potential 1-hour meeting (e.g., 9:00)
    )

    (:predicates
        (person_available ?p - person ?tp - time_point) ; True if person is available for this 30-min time point
        (is_first_30min_of_1hr ?ms - meeting_start_1hr_slot ?tp1 - time_point) ; ?ms is the start of a 1-hour meeting, ?tp1 is its first 30-min slot
        (is_second_30min_of_1hr ?ms - meeting_start_1hr_slot ?tp2 - time_point) ; ?ms is the start of a 1-hour meeting, ?tp2 is its second 30-min slot
        (next_meeting_start_1hr_slot ?ms1 - meeting_start_1hr_slot ?ms2 - meeting_start_1hr_slot) ; Defines sequential order of 1-hour meeting start slots
        (current_meeting_candidate ?ms - meeting_start_1hr_slot) ; The 1-hour slot currently being evaluated for scheduling
        (meeting_scheduled_at ?ms - meeting_start_1hr_slot) ; Goal predicate: a 1-hour meeting is successfully scheduled at ?ms
    )

    (:action try_schedule_meeting_at_candidate_slot)
        (:parameters (?ms - meeting_start_1hr_slot
                      ?tp1 - time_point
                      ?tp2 - time_point
                      ?p_theresa - person
                      ?p_charles - person
                      ?p_betty - person
                     )
        (:precondition (and
            (current_meeting_candidate ?ms) ; Ensure we are only trying to schedule the current earliest candidate
            (is_first_30min_of_1hr ?ms ?tp1)
            (is_second_30min_of_1hr ?ms ?tp2)
            (person_available ?p_theresa ?tp1)
            (person_available ?p_theresa ?tp2)
            (person_available ?p_charles ?tp1)
            (person_available ?p_charles ?tp2)
            (person_available ?p_betty ?tp1)
            (person_available ?p_betty ?tp2)
        ))
        (:effect (and
            (meeting_scheduled_at ?ms)
        ))
    )

    (:action advance_meeting_candidate_time)
        (:parameters (?ms_current - meeting_start_1hr_slot
                      ?ms_next - meeting_start_1hr_slot)
        (:precondition (and
            (current_meeting_candidate ?ms_current)
            (next_meeting_start_1hr_slot ?ms_current ?ms_next)
            (not (meeting_scheduled_at ?ms_current)) ; Only advance if a meeting was NOT scheduled at the current time
        ))
        (:effect (and
            (not (current_meeting_candidate ?ms_current))
            (current_meeting_candidate ?ms_next)
        ))
    )
)