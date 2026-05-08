(define (problem scheduling-instance)
  (:domain scheduling)
  
  (:objects
    joyce christine alexander - participant
    time_0900 time_0930 time_1000 time_1030 time_1100
    time_1130 time_1200 time_1230 time_1300 time_1330
    time_1400 time_1430 time_1500 time_1530 time_1600
    time_1630 time_1700 - time
  )
  
  (:init
    (available joyce time_0900 time_0930)
    (available joyce time_0930 time_1000)
    (available joyce time_1000 time_1030)
    (available joyce time_1030 time_1100)
    (available joyce time_1130 time_1200)
    (available joyce time_1200 time_1230)
    (available joyce time_1230 time_1300)
    (available joyce time_1400 time_1430)
    (available joyce time_1430 time_1500)
    (available joyce time_1500 time_1530)
    (available joyce time_1600 time_1630)
    (available christine time_1200 time_1230)
    (available christine time_1230 time_1300)
    (available christine time_1300 time_1330)
    (available christine time_1330 time_1400)
    (available christine time_1400 time_1430)
    (available christine time_1430 time_1500)
    (available christine time_1500 time_1530)
    (available christine time_1530 time_1600)
    (available christine time_1600 time_1630)
    (available christine time_1630 time_1700)
    (available alexander time_1100 time_1130)
    (available alexander time_1130 time_1200)
    (available alexander time_1200 time_1230)
    (available alexander time_1230 time_1300)
    (can_meet christine)
  )
  
  (:goal
    (exists (?t1 - time ?t2 - time)
      (and (scheduled ?t1 ?t2)))
  )
)