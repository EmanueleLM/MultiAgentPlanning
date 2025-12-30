(define (problem calendar-scheduling-24)
    (:domain calendar-scheduling)
    (:objects
        T0900 T0930 T1000 T1030 T1100 T1130 T1200 T1230 T1300 T1330 T1400 T1430 T1500 T1530 T1600 T1630 - time-slot
    )

    (:init
        (= (total-cost) 0)

        ; --- Common Availability Slots (H & B & R) ---
        (is-available T0900)
        (is-available T1000)
        (is-available T1030)
        (is-available T1100)
        (is-available T1230)
        (is-available T1300)
        (is-available T1330)
        (is-available T1630)

        ; --- Benjamin's Preference: preferred slots are 9:00 and 9:30 ---
        (is-preferred T0900)
        (is-preferred T0930)
    )

    (:goal (exists (?t - time-slot) (meeting-scheduled ?t)))

    (:metric minimize (total-cost))
)