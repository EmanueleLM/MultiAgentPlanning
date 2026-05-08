(define (problem calendar_scheduling_27_problem)
    (:domain calendar_scheduling_example_27)
    (:objects
        t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
        t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_slot
    )
    (:init
        ; These are the audited_combined_slots: ["9:00", "9:30", "11:00", "12:30", "13:00", "14:30", "16:30"]
        (is_available t0900)
        (is_available t0930)
        (is_available t1100)
        (is_available t1230)
        (is_available t1300)
        (is_available t1430)
        (is_available t1630)
    )
    (:goal (meeting_scheduled t0900)) ; Goal is to schedule at the earliest available slot, which is t0900
)