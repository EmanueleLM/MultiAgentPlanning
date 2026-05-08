(define (problem calendar_scheduling_example_11)
    (:domain calendar_scheduling)
    (:objects
        t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_slot
    )
    (:init
        ; Alexander's availability
        (available alexander t0900)
        (available alexander t1000)
        (available alexander t1100)
        (available alexander t1130)
        (available alexander t1200)
        (available alexander t1300)
        (available alexander t1330)
        (available alexander t1400)
        (available alexander t1500)
        (available alexander t1530)
        (available alexander t1630) ; Corrected based on Alexander's private information

        ; Elizabeth's availability
        (available elizabeth t0930)
        (available elizabeth t1000)
        (available elizabeth t1030)
        (available elizabeth t1100)
        (available elizabeth t1230)
        (available elizabeth t1430)
        (available elizabeth t1500)
        (available elizabeth t1530)
        (available elizabeth t1600)
        (available elizabeth t1630)

        ; Walter's availability
        (available walter t1430)
        (available walter t1500)
    )
    (:goal (exists (?t - time_slot) (meeting_scheduled ?t)))
)