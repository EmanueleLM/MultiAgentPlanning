(define (problem calendar_scheduling_example31_problem)
    (:domain calendar_scheduling_example31)
    (:objects
        richard - person
        martha - person
        kimberly - person
        s_0900 s_0930 s_1000 s_1030 s_1100 s_1130 s_1200 s_1230 s_1300 s_1330 s_1400 s_1430 s_1500 s_1530 s_1600 s_1630 - time_slot
    )
    (:init
        ; Richard's availability (busy 13:30 to 14:00, 15:00 to 15:30)
        (available richard s_0900)
        (available richard s_0930)
        (available richard s_1000)
        (available richard s_1030)
        (available richard s_1100)
        (available richard s_1130)
        (available richard s_1200)
        (available richard s_1230)
        (available richard s_1300)
        ; s_1330 (13:30-14:00) - busy, so not available
        (available richard s_1400)
        (available richard s_1430)
        ; s_1500 (15:00-15:30) - busy, so not available
        (available richard s_1530)
        (available richard s_1600)
        (available richard s_1630)

        ; Martha's availability (busy 9:00 to 9:30, 13:00 to 13:30)
        ; s_0900 (9:00-9:30) - busy, so not available
        (available martha s_0930)
        (available martha s_1000)
        (available martha s_1030)
        (available martha s_1100)
        (available martha s_1130)
        (available martha s_1200)
        (available martha s_1230)
        ; s_1300 (13:00-13:30) - busy, so not available
        (available martha s_1330)
        (available martha s_1400)
        (available martha s_1430)
        (available martha s_1500)
        (available martha s_1530)
        (available martha s_1600)
        (available martha s_1630)

        ; Kimberly's availability (busy 9:00 to 11:00, 11:30 to 12:00, 12:30 to 13:00, 14:00 to 16:00)
        ; s_0900-s_1030 (9:00-11:00) - busy, so not available
        (available kimberly s_1100) ; 11:00-11:30
        ; s_1130 (11:30-12:00) - busy, so not available
        (available kimberly s_1200) ; 12:00-12:30
        ; s_1230 (12:30-13:00) - busy, so not available
        (available kimberly s_1300) ; 13:00-13:30
        (available kimberly s_1330) ; 13:30-14:00
        ; s_1400-s_1530 (14:00-16:00) - busy, so not available
        (available kimberly s_1600) ; 16:00-16:30
        (available kimberly s_1630) ; 16:30-17:00

        ; Martha's preference: no meeting before 14:00 (slots starting 14:00 or later)
        (slot_ok_for_martha s_1400)
        (slot_ok_for_martha s_1430)
        (slot_ok_for_martha s_1500)
        (slot_ok_for_martha s_1530)
        (slot_ok_for_martha s_1600)
        (slot_ok_for_martha s_1630)
    )
    (:goal (meeting_scheduled_overall))
)