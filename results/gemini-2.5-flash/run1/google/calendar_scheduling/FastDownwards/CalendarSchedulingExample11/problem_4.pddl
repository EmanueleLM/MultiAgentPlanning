(define (problem calendar_scheduling_example_11)
    (:domain calendar_scheduling)
    (:objects
        t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_slot
    )
    (:init
        ; Alexander's availability derived from "Busy slots (Monday, 30 min increments): 9:30-10:00, 10:30-11:00, 12:30-13:00, 14:30-15:00, 16:00-17:00."
        ; This implies busy slots starting at: T0930, T1030, T1230, T1430, T1600, T1630 (as 16:00-17:00 covers two 30-min increments).
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

        ; Elizabeth's availability derived from "Busy slots (Monday, 30 min increments): 9:00-9:30, 11:30-12:30, 13:00-14:30."
        ; This implies busy slots starting at: T0900, T1130, T1200, T1300, T1330, T1400.
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

        ; Walter's availability derived from "Busy slots (Monday, 30 min increments): 9:00-14:30, 15:30-17:00."
        ; This implies busy slots starting at: T0900, T0930, T1000, T1030, T1100, T1130, T1200, T1230, T1300, T1330, T1400, T1530, T1600, T1630.
        (available walter t1430)
        (available walter t1500)
    )
    (:goal (meeting_found))
)