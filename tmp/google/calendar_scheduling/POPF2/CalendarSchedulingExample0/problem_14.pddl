(define (problem schedule-meeting)
  (:domain meeting-scheduling)
  (:objects 
    time-0900 time-0930 time-1000 time-1030 time-1100 time-1130 time-1200 
    time-1230 time-1300 time-1330 time-1400 time-1430 time-1500 time-1530 
    time-1600 time-1630 time-1700 - time
    michelle steven jerry - person)
  
  (:init 
    (available michelle time-0900 time-1100)
    (available michelle time-1200 time-1700)

    (available steven time-0930 time-1130)
    (available steven time-1200 time-1330)
    (available steven time-1400 time-1530)
    (available steven time-1600 time-1700)

    (available jerry time-0930 time-1000)
    (available jerry time-1100 time-1130)
    (available jerry time-1230 time-1300)
    (available jerry time-1430 time-1530)
    (available jerry time-1600 time-1630)

    ;; Precomputed free intervals
    (checked time-0930 time-1030))
  
  (:goal 
    (exists (?start - time ?end - time)
      (meeting-scheduled ?start ?end)))
)