(define (problem schedule_meeting_4)
    (:domain calendar_scheduling_example4)
    (:objects
        donna john billy - person
        t0900_0930 t0930_1000 t1000_1030 t1030_1100
        t1100_1130 t1130_1200 t1200_1230 t1230_1300
        t1300_1330 t1330_1400 t1400_1430 t1430_1500
        t1500_1530 t1530_1600 t1600_1630 t1630_1700 - time_slot
    )
    (:init
        ;; Donna's availability (busy: 14:00-14:30, 15:30-16:00)
        (available donna t0900_0930)
        (available donna t0930_1000)
        (available donna t1000_1030)
        (available donna t1030_1100)
        (available donna t1100_1130)
        (available donna t1130_1200)
        (available donna t1200_1230)
        (available donna t1230_1300)
        (available donna t1300_1330)
        (available donna t1330_1400)
        (available donna t1430_1500)
        (available donna t1500_1530)
        (available donna t1600_1630)
        (available donna t1630_1700)

        ;; John's availability (busy: 11:00-11:30, 16:30-17:00)
        (available john t0900_0930)
        (available john t0930_1000)
        (available john t1000_1030)
        (available john t1030_1100)
        (available john t1130_1200)
        (available john t1200_1230)
        (available john t1230_1300)
        (available john t1300_1330)
        (available john t1330_1400)
        (available john t1400_1430)
        (available john t1430_1500)
        (available john t1500_1530)
        (available john t1530_1600)
        (available john t1600_1630)

        ;; Billy's availability (busy: 9:00-10:00, 10:30-14:00, 14:30-17:00)
        (available billy t1000_1030)
        (available billy t1400_1430)
    )
    (:goal (and
        (meeting_scheduled t1000_1030)
    ))
)