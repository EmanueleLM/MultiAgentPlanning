(define (problem calendarschedulingexample28)
  (:domain calendar_scheduling)
  (:objects
    brittany emily doris - person
    time_0900 time_0930 time_1000 time_1030 time_1100 time_1130 time_1200 time_1230 time_1300 time_1330 time_1400 time_1430 time_1500 time_1530 time_1600 time_1630 - slot
  )
  (:init
    (at_slot time_0900)
    
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

    ;; Emily is free the entire day
    (free emily time_0900)
    (free emily time_0930)
    (free emily time_1000)
    (free emily time_1030)
    (free emily time_1100)
    (free emily time_1130)
    (free emily time_1200)
    (free emily time_1230)
    (free emily time_1300)
    (free emily time_1330)
    (free emily time_1400)
    (free emily time_1430)
    (free emily time_1500)
    (free emily time_1530)
    (free emily time_1600)
    (free emily time_1630)

    ;; Brittany is busy 13:00-13:30 (time_1300) and 16:00-16:30 (time_1600)
    (free brittany time_0900)
    (free brittany time_0930)
    (free brittany time_1000)
    (free brittany time_1030)
    (free brittany time_1100)
    (free brittany time_1130)
    (free brittany time_1200)
    (free brittany time_1230)
    ;; time_1300 is busy
    (free brittany time_1330)
    (free brittany time_1400)
    (free brittany time_1430)
    (free brittany time_1500)
    (free brittany time_1530)
    ;; time_1600 is busy
    (free brittany time_1630)

    ;; Doris is busy 9:00-11:00 (time_0900-1030), 11:30-14:30 (time_1130-1400), and 15:00-17:00 (time_1500-1630)
    ;; time_0900 to time_1030 are busy
    (free doris time_1100) ;; FREE
    ;; time_1130 to time_1400 are busy
    (free doris time_1430) ;; FREE
    ;; time_1500 to time_1630 are busy
  )
  (:goal (done))
)