(define (problem calendar-scheduling-example1)
    (:domain calendar-scheduling)
    (:objects
        Raymond Billy Donald - participant
        T900 T930 T1000 T1030 T1100 T1130 T1200 T1230 T1300 T1330 T1400 T1430 T1500 T1530 T1600 T1630 - time-slot
    )

    (:init
        ;; R Availability (Blocked: T900, T1130, T1300, T1500)
        (available Raymond T930) (available Raymond T1000) (available Raymond T1030) (available Raymond T1100)
        (available Raymond T1200) (available Raymond T1230)
        (available Raymond T1330) (available Raymond T1400) (available Raymond T1430)
        (available Raymond T1530) (available Raymond T1600) (available Raymond T1630)

        ;; B Availability (Hard constraints + Preference filter applied. Excludes T1500, T1530, T1600, T1630)
        (available Billy T900) (available Billy T930) (available Billy T1030) (available Billy T1100) 
        (available Billy T1130) 
        (available Billy T1300) (available Billy T1330) (available Billy T1400) (available Billy T1430)

        ;; D Availability (Blocked: T900, T1000, T1030, T1200, T1230, T1400, T1600, T1630)
        (available Donald T930) (available Donald T1100) (available Donald T1130)
        (available Donald T1300) (available Donald T1330)
        (available Donald T1430) (available Donald T1500) (available Donald T1530)

        (not (found-solution))
    )

    (:goal (found-solution))
)