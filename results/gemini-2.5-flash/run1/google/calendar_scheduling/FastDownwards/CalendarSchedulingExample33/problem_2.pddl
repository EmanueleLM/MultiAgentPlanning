(define (problem calendar_scheduling_problem)
    (:domain calendar_scheduling_domain)
    (:objects
        ; Constants are defined in the domain, no need to repeat here
    )
    (:init
        (unassigned_meeting meeting1)
        (total_cost 0)

        ; Lisa's existing schedule (busy times)
        (person_at_time lisa t0900) ; 9:00-10:00
        (person_at_time lisa t0930) ; 9:00-10:00
        (person_at_time lisa t1030) ; 10:30-11:30
        (person_at_time lisa t1100) ; 10:30-11:30
        (person_at_time lisa t1230) ; 12:30-13:00
        (person_at_time lisa t1600) ; 16:00-16:30

        ; Bobby's existing schedule (busy times)
        (person_at_time bobby t0900) ; 9:00-9:30
        (person_at_time bobby t1000) ; 10:00-10:30
        (person_at_time bobby t1130) ; 11:30-12:00
        (person_at_time bobby t1500) ; 15:00-15:30

        ; Randy's existing schedule (busy times)
        (person_at_time randy t0930) ; 9:30-10:00
        (person_at_time randy t1030) ; 10:30-11:00
        (person_at_time randy t1130) ; 11:30-12:30
        (person_at_time randy t1200) ; 11:30-12:30
        (person_at_time randy t1300) ; 13:00-13:30
        (person_at_time randy t1430) ; 14:30-15:30
        (person_at_time randy t1500) ; 14:30-15:30
        (person_at_time randy t1600) ; 16:00-16:30

        ; Bobby's preferences: avoid meetings after 15:00
        ; This means time slots starting at 15:00, 15:30, 16:00, 16:30
        (prefers_to_avoid bobby t1500)
        (prefers_to_avoid bobby t1530)
        (prefers_to_avoid bobby t1600)
        (prefers_to_avoid bobby t1630)
    )
    (:goal (exists (?t - time_slot) (meeting_at_time meeting1 ?t)))
    (:metric minimize (total_cost))
)