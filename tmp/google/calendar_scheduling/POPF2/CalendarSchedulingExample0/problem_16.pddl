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

    (busy michelle time-1100 time-1200)
    (busy steven time-0900 time-0930)
    (busy steven time-1130 time-1200)
    (busy steven time-1330 time-1400)
    (busy steven time-1530 time-1600)
    (busy jerry time-1000 time-1100)
    (busy jerry time-1130 time-1230)
    (busy jerry time-1300 time-1430)
    (busy jerry time-1530 time-1600)
    (busy jerry time-1630 time-1700)

    (next time-0900 time-0930)
    (next time-0930 time-1000)
    (next time-1000 time-1030)
    (next time-1030 time-1100)
    (next time-1100 time-1130)
    (next time-1130 time-1200)
    (next time-1200 time-1230)
    (next time-1230 time-1300)
    (next time-1300 time-1330)
    (next time-1330 time-1400)
    (next time-1400 time-1430)
    (next time-1430 time-1500)
    (next time-1500 time-1530)
    (next time-1530 time-1600)
    (next time-1600 time-1630)
    (next time-1630 time-1700))

  (:goal 
    (exists (?start - time ?end - time)
      (meeting-scheduled ?start ?end)))
)