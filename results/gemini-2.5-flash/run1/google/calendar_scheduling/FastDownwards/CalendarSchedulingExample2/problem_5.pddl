(define (problem calendar_scheduling_problem_example2)
    (:domain calendar_scheduling_domain)
    (:objects
        t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430
        t1500 t1530 t1600 t1630 - timeslot
    )
    (:init
        ; Roy's availability (all slots except 9:00, 10:00, 11:00, 12:30)
        (available_roy t0930)
        (available_roy t1030)
        (available_roy t1130)
        (available_roy t1200)
        (available_roy t1300)
        (available_roy t1330)
        (available_roy t1400)
        (available_roy t1430)
        (available_roy t1500)
        (available_roy t1530)
        (available_roy t1600)
        (available_roy t1630)

        ; Kathryn's availability (all slots except 9:30, 16:30)
        (available_kathryn t0900)
        (available_kathryn t1000)
        (available_kathryn t1030)
        (available_kathryn t1100)
        (available_kathryn t1130)
        (available_kathryn t1200)
        (available_kathryn t1230)
        (available_kathryn t1300)
        (available_kathryn t1330)
        (available_kathryn t1400)
        (available_kathryn t1430)
        (available_kathryn t1500)
        (available_kathryn t1530)
        (available_kathryn t1600)

        ; Amy's availability (all slots except 9:00-14:00, 15:00, 15:30, 16:30)
        ; Blocked: T0900, T0930, T1000, T1030, T1100, T1130, T1200, T1230, T1300, T1330, T1400, T1500, T1530, T1630
        ; Available: T1430, T1600
        (available_amy t1430)
        (available_amy t1600)

        ; Amy's preferences (meeting start time should be 15:30 or earlier)
        (preferred_amy t0900)
        (preferred_amy t0930)
        (preferred_amy t1000)
        (preferred_amy t1030)
        (preferred_amy t1100)
        (preferred_amy t1130)
        (preferred_amy t1200)
        (preferred_amy t1230)
        (preferred_amy t1300)
        (preferred_amy t1330)
        (preferred_amy t1400)
        (preferred_amy t1430)
        (preferred_amy t1500)
        (preferred_amy t1530)

        ; Initial state for scheduling flag and cost
        (= (total-cost) 0)
        (status_seeking_preferred)      ; Initially, we seek a preferred slot
        ; (not (status_seeking_non_preferred)) is implicit in PDDL.
    )
    (:goal (has_scheduled_meeting))
    (:metric minimize (total-cost))
)