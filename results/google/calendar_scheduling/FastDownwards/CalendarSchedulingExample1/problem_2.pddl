(define (problem calendar-scheduling-example1)
    (:domain calendar-scheduling)
    (:objects
        RAYMOND BILLY DONALD - participant
        T900 T930 T1000 T1030 T1100 T1130 T1200 T1230 T1300 T1330 T1400 T1430 T1500 T1530 T1600 T1630 - time-slot
    )

    (:init
        ;; R Availability (Blocked: T900, T1130, T1300, T1500)
        (available RAYMOND T930) (available RAYMOND T1000) (available RAYMOND T1030) (available RAYMOND T1100)
        (available RAYMOND T1200) (available RAYMOND T1230)
        (available RAYMOND T1330) (available RAYMOND T1400) (available RAYMOND T1430)
        (available RAYMOND T1530) (available RAYMOND T1600) (available RAYMOND T1630)

        ;; B Availability (Hard constraints + Preference filter applied. Excludes T1500, T1530, T1600, T1630)
        (available BILLY T900) (available BILLY T930) (available BILLY T1030) (available BILLY T1100) 
        (available BILLY T1130) 
        (available BILLY T1300) (available BILLY T1330) (available BILLY T1400) (available BILLY T1430)

        ;; D Availability (Blocked: T900, T1000, T1030, T1200, T1230, T1400, T1600, T1630)
        (available DONALD T930) (available DONALD T1100) (available DONALD T1130)
        (available DONALD T1300) (available DONALD T1330)
        (available DONALD T1430) (available DONALD T1500) (available DONALD T1530)

        (not (found-solution))
    )

    (:goal (found-solution))
)