(define (problem calendar_scheduling_example32_problem)
    (:domain calendar_scheduling_example32)
    (:objects
        emily melissa frank - person
        t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_slot
    )
    (:init
        ;; Frank's preference: do not want to meet on Monday after 9:30 (start time)
        (is_frank_preferred_slot t0900)
        (is_frank_preferred_slot t0930)

        ;; Emily's busy schedule
        (is_busy emily t1000)
        (is_busy emily t1130)
        (is_busy emily t1200)
        (is_busy emily t1400)
        (is_busy emily t1430)
        (is_busy emily t1600)

        ;; Melissa's busy schedule
        (is_busy melissa t0930)
        (is_busy melissa t1430)

        ;; Frank's busy schedule
        (is_busy frank t1000)
        (is_busy frank t1100)
        (is_busy frank t1230)
        (is_busy frank t1330)
        (is_busy frank t1400)
        (is_busy frank t1500)
        (is_busy frank t1530)
        (is_busy frank t1630)
    )
    (:goal (exists (?s - time_slot) (meeting_scheduled ?s)))
)