(define (problem calendar-scheduling-11)
    (:domain calendar-scheduling)
    (:objects
        T0900 T0930 T1000 T1030 T1100 T1130 T1200 T1230 T1300 T1330 T1400 T1430 T1500 T1530 T1600 T1630 - time-slot
        ALEXANDER ELIZABETH WALTER - participant ; Corrected capitalization
    )
    (:init
        ; Availability for ALEXANDER
        (free T0900 ALEXANDER)
        (free T1000 ALEXANDER)
        (free T1100 ALEXANDER)
        (free T1130 ALEXANDER)
        (free T1200 ALEXANDER)
        (free T1300 ALEXANDER)
        (free T1330 ALEXANDER)
        (free T1400 ALEXANDER)
        (free T1500 ALEXANDER)
        (free T1530 ALEXANDER)

        ; Availability for ELIZABETH
        (free T0930 ELIZABETH)
        (free T1000 ELIZABETH)
        (free T1030 ELIZABETH)
        (free T1100 ELIZABETH)
        (free T1230 ELIZABETH)
        (free T1430 ELIZABETH)
        (free T1500 ELIZABETH)
        (free T1530 ELIZABETH)
        (free T1600 ELIZABETH)
        (free T1630 ELIZABETH)

        ; Availability for WALTER
        (free T1430 WALTER)
        (free T1500 WALTER)
    )
    (:goal (overall_goal_met))
)