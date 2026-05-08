(define (problem calendar_scheduling_problem)
    (:domain calendar_scheduling)
    (:objects
        bobby scott kimberly - person
        t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 t1700 - time
    )
    (:init
        ;; Connectivity of time points
        (next t0900 t0930)
        (next t0930 t1000)
        (next t1000 t1030)
        (next t1030 t1100)
        (next t1100 t1130)
        (next t1130 t1200)
        (next t1200 t1230)
        (next t1230 t1300)
        (next t1300 t1330)
        (next t1330 t1400)
        (next t1400 t1430)
        (next t1430 t1500)
        (next t1500 t1530)
        (next t1530 t1600)
        (next t1600 t1630)
        (next t1630 t1700)

        ;; Bobby's calendar: wide open the entire day
        (free bobby t0900 t0930)
        (free bobby t0930 t1000)
        (free bobby t1000 t1030)
        (free bobby t1030 t1100)
        (free bobby t1100 t1130)
        (free bobby t1130 t1200)
        (free bobby t1200 t1230)
        (free bobby t1230 t1300)
        (free bobby t1300 t1330)
        (free bobby t1330 t1400)
        (free bobby t1400 t1430)
        (free bobby t1430 t1500)
        (free bobby t1500 t1530)
        (free bobby t1530 t1600)
        (free bobby t1600 t1630)
        (free bobby t1630 t1700)

        ;; Scott's calendar: busy 11:30-12:00, 15:30-16:00
        (free scott t0900 t0930)
        (free scott t0930 t1000)
        (free scott t1000 t1030)
        (free scott t1030 t1100)
        (free scott t1100 t1130)
        ;; 11:30-12:00 busy
        (free scott t1200 t1230)
        (free scott t1230 t1300)
        (free scott t1300 t1330)
        (free scott t1330 t1400)
        (free scott t1400 t1430)
        (free scott t1430 t1500)
        (free scott t1500 t1530)
        ;; 15:30-16:00 busy
        (free scott t1600 t1630)
        (free scott t1630 t1700)

        ;; Kimberly's calendar: busy 11:00-12:00, 12:30-13:00, 13:30-14:00, 14:30-15:00, 15:30-17:00
        (free kimberly t0900 t0930)
        (free kimberly t0930 t1000)
        (free kimberly t1000 t1030)
        (free kimberly t1030 t1100)
        ;; 11:00-12:00 busy (two slots)
        (free kimberly t1200 t1230)
        ;; 12:30-13:00 busy
        (free kimberly t1300 t1330)
        ;; 13:30-14:00 busy
        (free kimberly t1400 t1430)
        ;; 14:30-15:00 busy
        (free kimberly t1500 t1530)
        ;; 15:30-17:00 busy (three slots)
    )
    (:goal (meeting_scheduled))
)