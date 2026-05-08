(define (problem calendar_scheduling_example23)
    (:domain calendar_scheduling)
    (:objects
        billy maria william - person
        t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 - one_hour_start_time
    )
    (:init
        ; Billy's available 1-hour slots (derived from busy schedule)
        (is_available billy t0900)
        (is_available billy t0930)
        (is_available billy t1000)
        (is_available billy t1030)
        (is_available billy t1200)
        (is_available billy t1500)

        ; Maria's available 1-hour slots (derived from busy schedule)
        (is_available maria t1030)
        (is_available maria t1100)
        (is_available maria t1130)
        (is_available maria t1200)
        (is_available maria t1430)
        (is_available maria t1500)
        (is_available maria t1530)
        (is_available maria t1600)

        ; William's available 1-hour slots (derived from busy schedule)
        (is_available william t1000)
        (is_available william t1030)
        (is_available william t1100)
        (is_available william t1230)
    )
    (:goal (exists (?s - one_hour_start_time) (meeting_scheduled ?s)))
)