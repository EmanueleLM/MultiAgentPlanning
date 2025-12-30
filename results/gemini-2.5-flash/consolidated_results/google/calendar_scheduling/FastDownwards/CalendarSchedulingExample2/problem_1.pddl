(define (problem calendar_scheduling_instance)
    (:domain calendar_scheduling)
    (:objects
        T0900 T0930 T1000 T1030 T1100 T1130 T1200 T1230 T1300 T1330 T1400 T1430 T1500 T1530 T1600 T1630 - timeslot
    )
    (:init
        (= (total-cost) 0)

        ; --- Roy's Availability (Blocked: T0900, T1000, T1100, T1230)
        (available_roy T0930) (available_roy T1030) (available_roy T1130)
        (available_roy T1200) (available_roy T1300) (available_roy T1330)
        (available_roy T1400) (available_roy T1430) (available_roy T1500)
        (available_roy T1530) (available_roy T1600) (available_roy T1630)

        ; --- Kathryn's Availability (Blocked: T0930, T1630)
        (available_kathryn T0900) (available_kathryn T1000) (available_kathryn T1030)
        (available_kathryn T1100) (available_kathryn T1130) (available_kathryn T1200)
        (available_kathryn T1230) (available_kathryn T1300) (available_kathryn T1330)
        (available_kathryn T1400) (available_kathryn T1430) (available_kathryn T1500)
        (available_kathryn T1530) (available_kathryn T1600)

        ; --- Amy's Availability (Available: T1430, T1600)
        (available_amy T1430)
        (available_amy T1600)

        ; --- Amy's Preference (Preferred: T0900 up to T1530)
        (preferred T0900) (preferred T0930) (preferred T1000) (preferred T1030)
        (preferred T1100) (preferred T1130) (preferred T1200) (preferred T1230)
        (preferred T1300) (preferred T1330) (preferred T1400) (preferred T1430)
        (preferred T1500) (preferred T1530)
    )
    (:goal (meeting_scheduled))
    (:metric minimize (total-cost))
)