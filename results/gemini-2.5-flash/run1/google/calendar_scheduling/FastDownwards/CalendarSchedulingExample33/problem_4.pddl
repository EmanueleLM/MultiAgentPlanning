(define (problem calendar_scheduling_problem)
    (:domain calendar_scheduling_domain)
    (:objects
        ; Constants are defined in the domain, no need to repeat here
    )
    (:init
        (meeting_unscheduled meeting1)
        (= (total-cost) 0)

        ; Lisa's existing schedule (busy times)
        (person_busy lisa t0900) ; 9:00-10:00 (covers 9:00-9:30)
        (person_busy lisa t0930) ; 9:00-10:00 (covers 9:30-10:00)
        (person_busy lisa t1030) ; 10:30-11:30 (covers 10:30-11:00)
        (person_busy lisa t1100) ; 10:30-11:30 (covers 11:00-11:30)
        (person_busy lisa t1230) ; 12:30-13:00
        (person_busy lisa t1600) ; 16:00-16:30

        ; Bobby's existing schedule (busy times)
        (person_busy bobby t0900) ; 9:00-9:30
        (person_busy bobby t1000) ; 10:00-10:30
        (person_busy bobby t1130) ; 11:30-12:00
        (person_busy bobby t1500) ; 15:00-15:30

        ; Randy's existing schedule (busy times)
        (person_busy randy t0930) ; 9:30-10:00
        (person_busy randy t1030) ; 10:30-11:00
        (person_busy randy t1130) ; 11:30-12:30 (covers 11:30-12:00)
        (person_busy randy t1200) ; 11:30-12:30 (covers 12:00-12:30)
        (person_busy randy t1300) ; 13:00-13:30
        (person_busy randy t1430) ; 14:30-15:30 (covers 14:30-15:00)
        (person_busy randy t1500) ; 14:30-15:30 (covers 15:00-15:30)
        (person_busy randy t1600) ; 16:00-16:30

        ; Bobby's preferences: avoid meetings after 15:00
        ; This means time slots starting at 15:00, 15:30, 16:00, 16:30
        (person_prefers_to_avoid bobby t1500)
        (person_prefers_to_avoid bobby t1530)
        (person_prefers_to_avoid bobby t1600)
        (person_prefers_to_avoid bobby t1630)
    )
    (:goal (not (meeting_unscheduled meeting1)))
    (:metric minimize (total-cost))
)