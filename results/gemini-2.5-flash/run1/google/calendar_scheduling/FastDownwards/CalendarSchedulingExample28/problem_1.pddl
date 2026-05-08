(define (problem calendar_scheduling_example_28)
    (:domain calendar_scheduling)
    (:objects
        brittany emily doris - person
        t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_slot
    )
    (:init
        ; Temporal ordering of time slots (not directly used by action, but for completeness)
        (earlier t0900 t0930)
        (earlier t0930 t1000)
        (earlier t1000 t1030)
        (earlier t1030 t1100)
        (earlier t1100 t1130)
        (earlier t1130 t1200)
        (earlier t1200 t1230)
        (earlier t1230 t1300)
        (earlier t1300 t1330)
        (earlier t1330 t1400)
        (earlier t1400 t1430)
        (earlier t1430 t1500)
        (earlier t1500 t1530)
        (earlier t1530 t1600)
        (earlier t1600 t1630)

        ; Emily's schedule: free the entire day (9:00 to 17:00)
        (available emily t0900)
        (available emily t0930)
        (available emily t1000)
        (available emily t1030)
        (available emily t1100)
        (available emily t1130)
        (available emily t1200)
        (available emily t1230)
        (available emily t1300)
        (available emily t1330)
        (available emily t1400)
        (available emily t1430)
        (available emily t1500)
        (available emily t1530)
        (available emily t1600)
        (available emily t1630)

        ; Brittany's schedule: busy 13:00-13:30, 16:00-16:30
        (available brittany t0900)
        (available brittany t0930)
        (available brittany t1000)
        (available brittany t1030)
        (available brittany t1100)
        (available brittany t1130)
        (available brittany t1200)
        (available brittany t1230)
        ; (not (available brittany t1300)) ; 13:00-13:30 busy
        (available brittany t1330)
        (available brittany t1400)
        (available brittany t1430)
        (available brittany t1500)
        (available brittany t1530)
        ; (not (available brittany t1600)) ; 16:00-16:30 busy
        (available brittany t1630)

        ; Doris's schedule: busy 9:00-11:00, 11:30-14:30, 15:00-17:00
        ; Busy slots for Doris:
        ; t0900, t0930, t1000, t1030 (9:00-11:00)
        ; t1130, t1200, t1230, t1300, t1330, t1400 (11:30-14:30)
        ; t1500, t1530, t1600, t1630 (15:00-17:00)
        ; Available slots for Doris:
        (available doris t1100) ; 11:00-11:30
        (available doris t1430) ; 14:30-15:00

        ; Initial state: no meeting found
        ; (not (meeting_found)) is implicit for predicates not in init
    )
    (:goal (meeting_found))
)