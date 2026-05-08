(define (problem calendar-scheduling-11)
    (:domain calendar-scheduling)
    (:objects
        T0900 T0930 T1000 T1030 T1100 T1130 T1200 T1230 T1300 T1330 T1400 T1430 T1500 T1530 T1600 T1630 - time-slot
        Alexander Elizabeth Walter - participant
    )
    (:init
        ; Availability for Alexander
        (free T0900 Alexander)
        (free T1000 Alexander)
        (free T1100 Alexander)
        (free T1130 Alexander)
        (free T1200 Alexander)
        (free T1300 Alexander)
        (free T1330 Alexander)
        (free T1400 Alexander)
        (free T1500 Alexander)
        (free T1530 Alexander)

        ; Availability for Elizabeth
        (free T0930 Elizabeth)
        (free T1000 Elizabeth)
        (free T1030 Elizabeth)
        (free T1100 Elizabeth)
        (free T1230 Elizabeth)
        (free T1430 Elizabeth)
        (free T1500 Elizabeth)
        (free T1530 Elizabeth)
        (free T1600 Elizabeth)
        (free T1630 Elizabeth)

        ; Availability for Walter
        (free T1430 Walter)
        (free T1500 Walter)
    )
    (:goal (overall_goal_met))
)