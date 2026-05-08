(define (problem schedule_meeting_problem)
    (:domain schedule_meeting)
    (:objects
        albert gregory benjamin - participant
        time_0900 time_0930 time_1000 time_1030 time_1100 time_1130 
        time_1200 time_1230 time_1300 time_1330 time_1400 time_1430 
        time_1500 time_1530 time_1600 time_1630 time_1700 - time
    )
    (:init
        (next time_0900 time_0930)
        (next time_0930 time_1000)
        (next time_1000 time_1030)
        (next time_1030 time_1100)
        (next time_1100 time_1130)
        (next time_1130 time_1200)
        (next time_1200 time_1230)
        (next time_1230 time_1300)
        (next time_1300 time_1330)
        (next time_1330 time_1400)
        (next time_1400 time_1430)
        (next time_1430 time_1500)
        (next time_1500 time_1530)
        (next time_1530 time_1600)
        (next time_1600 time_1630)
        (next time_1630 time_1700)

        (available albert time_0900 time_0930)
        (available albert time_1000 time_1030)
        (available albert time_1100 time_1130)
        (available albert time_1230 time_1300)
        (available albert time_1330 time_1400)
        (available albert time_1430 time_1500)
        (available albert time_1530 time_1600)
        
        (available gregory time_0900 time_0930)
        (available gregory time_1000 time_1030)
        (available gregory time_1130 time_1200)
        (available gregory time_1300 time_1330)
        (available gregory time_1400 time_1430)
        (available gregory time_1500 time_1530)
        (available gregory time_1600 time_1630)
        (available gregory time_1630 time_1700)
        
        (available benjamin time_0900 time_0930)
        (available benjamin time_1000 time_1030)
        (available benjamin time_1300 time_1330)
        (available benjamin time_1430 time_1500)
    )
    (:goal
        (exists (?t1 - time ?t2 - time) (meeting_scheduled ?t1 ?t2))
    )
)