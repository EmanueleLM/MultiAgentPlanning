(define (problem schedule-meeting-problem)
    (:domain calendar-scheduling)
    (:objects
        t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
    )
    (:init
        ; Donna's availability (busy: 14:00-14:30 (t1400), 15:30-16:00 (t1530))
        (available donna t0900)
        (available donna t0930)
        (available donna t1000)
        (available donna t1030)
        (available donna t1100)
        (available donna t1130)
        (available donna t1200)
        (available donna t1230)
        (available donna t1300)
        (available donna t1330)
        ; t1400 is not available for Donna
        (available donna t1430)
        (available donna t1500)
        ; t1530 is not available for Donna
        (available donna t1600)
        (available donna t1630)

        ; John's availability (busy: 11:00-11:30 (t1100), 16:30-17:00 (t1630))
        (available john t0900)
        (available john t0930)
        (available john t1000)
        (available john t1030)
        ; t1100 is not available for John
        (available john t1130)
        (available john t1200)
        (available john t1230)
        (available john t1300)
        (available john t1330)
        (available john t1400)
        (available john t1430)
        (available john t1500)
        (available john t1530)
        (available john t1600)
        ; t1630 is not available for John

        ; Billy's availability (busy: 9:00-10:00 (t0900, t0930), 10:30-14:00 (t1030-t1330), 14:30-17:00 (t1430-t1630))
        ; t0900 is not available for Billy
        ; t0930 is not available for Billy
        (available billy t1000)
        ; t1030, t1100, t1130, t1200, t1230, t1300, t1330 are not available for Billy
        (available billy t1400)
        ; t1430, t1500, t1530, t1600, t1630 are not available for Billy

        (= (total-cost) 0)
    )
    (:goal (meeting-scheduled t1000))
    (:metric minimize (total-cost))
)