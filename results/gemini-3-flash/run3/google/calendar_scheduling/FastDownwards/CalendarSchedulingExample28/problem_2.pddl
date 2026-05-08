(define (problem calendarschedulingexample28)
  (:domain calendar_scheduling)
  (:objects
    brittany emily doris - person
    time_0900 time_0930 time_1000 time_1030 time_1100 time_1130 time_1200 time_1230 time_1300 time_1330 time_1400 time_1430 time_1500 time_1530 time_1600 time_1630 - slot
  )
  (:init
    (at_slot time_0900)
    (person_brittany brittany)
    (person_emily emily)
    (person_doris doris)

    ;; Adjacency structure for time progression
    (next_slot time_0900 time_0930)
    (next_slot time_0930 time_1000)
    (next_slot time_1000 time_1030)
    (next_slot time_1030 time_1100)
    (next_slot time_1100 time_1130)
    (next_slot time_1130 time_1200)
    (next_slot time_1200 time_1230)
    (next_slot time_1230 time_1300)
    (next_slot time_1300 time_1330)
    (next_slot time_1330 time_1400)
    (next_slot time_1400 time_1430)
    (next_slot time_1430 time_1500)
    (next_slot time_1500 time_1530)
    (next_slot time_1530 time_1600)
    (next_slot time_1600 time_1630)

    ;; Emily is free the entire day (09:00 - 17:00)
    (free emily time_0900) (free emily time_0930) (free emily time_1000) (free emily time_1030)
    (free emily time_1100) (free emily time_1130) (free emily time_1200) (free emily time_1230)
    (free emily time_1300) (free emily time_1330) (free emily time_1400) (free emily time_1430)
    (free emily time_1500) (free emily time_1530) (free emily time_1600) (free emily time_1630)

    ;; Brittany has meetings 13:00 to 13:30 (time_1300) and 16:00 to 16:30 (time_1600)
    (free brittany time_0900) (free brittany time_0930) (free brittany time_1000) (free brittany time_1030)
    (free brittany time_1100) (free brittany time_1130) (free brittany time_1200) (free brittany time_1230)
    ;; 13:00 busy
    (free brittany time_1330) (free brittany time_1400) (free brittany time_1430) (free brittany time_1500) (free brittany time_1530)
    ;; 16:00 busy
    (free brittany time_1630)

    ;; Doris is busy 9:00-11:00 (0900, 0930, 1000, 1030), 11:30-14:30 (1130, 1200, 1230, 1300, 1330, 1400), 15:00-17:00 (1500, 1530, 1600, 1630)
    ;; 09:00 to 11:00 busy
    (free doris time_1100) ;; FREE
    ;; 11:30 to 14:30 busy
    (free doris time_1430) ;; FREE
    ;; 15:00 to 17:00 busy
  )
  (:goal (scheduled))
)