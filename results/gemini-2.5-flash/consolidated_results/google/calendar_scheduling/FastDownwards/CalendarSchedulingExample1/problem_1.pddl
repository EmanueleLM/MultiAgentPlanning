(define (problem calendar-scheduling-example1)
    (:domain calendar-scheduling)
    (:objects
        raymond billy donald - participant
        T900 T930 T1000 T1030 T1100 T1130 T1200 T1230 T1300 T1330 T1400 T1430 T1500 T1530 T1600 T1630 - time-slot
    )

    (:init
        ;; R Availability (Blocked: T900, T1130, T1300, T1500)
        (available raymond T930) (available raymond T1000) (available raymond T1030) (available raymond T1100)
        (available raymond T1200) (available raymond T1230)
        (available raymond T1330) (available raymond T1400) (available raymond T1430)
        (available raymond T1530) (available raymond T1600) (available raymond T1630)

        ;; B Availability (Hard constraints + Preference filter applied. Excludes T1500, T1530, T1600, T1630)
        (available billy T900) (available billy T930) (available billy T1030) (available billy T1100) 
        (available billy T1130) 
        (available billy T1300) (available billy T1330) (available billy T1400) (available billy T1430)

        ;; D Availability (Blocked: T900, T1000, T1030, T1200, T1230, T1400, T1600, T1630)
        (available donald T930) (available donald T1100) (available donald T1130)
        (available donald T1300) (available donald T1330)
        (available donald T1430) (available donald T1500) (available donald T1530)

        (not (found-solution))
    )

    (:goal (found-solution))
)