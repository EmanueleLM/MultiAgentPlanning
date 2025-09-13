(define (problem schedule-meeting)
  (:domain meeting-scheduling)
  (:objects 
    time-0900 time-0930 time-1000 time-1030 time-1100 time-1130 time-1200 
    time-1230 time-1300 time-1330 time-1400 time-1430 time-1500 time-1530 
    time-1600 time-1630 time-1700 - time
    michelle steven jerry - person)
  
  (:init 
    (available-michelle time-0930) (available-michelle time-1000)
    (available-michelle time-1200) (available-michelle time-1230)
    (available-michelle time-1300) (available-michelle time-1400)
    (available-michelle time-1430) (available-michelle time-1500)
    (available-michelle time-1600)

    (busy-steven time-0900 time-0930) (busy-steven time-1130 time-1200)
    (busy-steven time-1330 time-1400) (busy-steven time-1530 time-1600)

    (available-steven time-0930 time-1130) (available-steven time-1200 time-1330)
    (available-steven time-1400 time-1530) (available-steven time-1600 time-1700)

    (busy-jerry time-0900 time-0930) (busy-jerry time-1000 time-1100)
    (busy-jerry time-1130 time-1230) (busy-jerry time-1300 time-1430)
    (busy-jerry time-1530 time-1600) (busy-jerry time-1630 time-1700)

    (available-jerry time-0930 time-1030) (available-jerry time-1230 time-1300)
    (available-jerry time-1430 time-1530) (available-jerry time-1500 time-1600)
  ) 

  (:goal 
    (and 
      (meeting-scheduled)
      (exists (?start - time ?end - time)
        (and
          (available-michelle ?start)
          (available-steven ?start ?end)
          (not (busy-steven ?start ?end))
          (available-jerry ?start ?end)
          (not (busy-jerry ?start ?end))
          (meeting-scheduled))))
  ))