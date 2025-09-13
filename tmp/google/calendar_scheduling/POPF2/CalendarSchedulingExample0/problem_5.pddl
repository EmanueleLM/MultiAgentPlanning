(define (problem schedule-meeting)
  (:domain meeting-scheduling)
  (:objects 
    slot9-10 slot10-11 slot12-13 slot13-14 slot14-15 slot15-16 slot16-17 - time
    time-0900 time-0930 time-1000 time-1100 time-1200 
    time-1230 time-1300 time-1330 time-1430 time-1500 
    time-1530 time-1600 time-1630 time-1700 time-1130 time-1400 time-1030 - time)
  
  (:init 
    ; Michelle availability
    (available-michelle slot9-10)
    (available-michelle slot10-11)
    (available-michelle slot12-13)
    (available-michelle slot13-14)
    (available-michelle slot14-15)
    (available-michelle slot15-16)
    (available-michelle slot16-17)

    ; Steven status
    (busy-steven time-0900 time-0930)
    (busy-steven time-1130 time-1200)
    (busy-steven time-1330 time-1400)
    (busy-steven time-1530 time-1600)

    (available-steven time-0930 time-1030)
    (available-steven time-1000 time-1100)
    (available-steven time-1200 time-1330)
    (available-steven time-1400 time-1530)
    (available-steven time-1600 time-1700)

    ; Jerry status
    (blocked-jerry time-0900) (blocked-jerry time-0930)
    (blocked-jerry time-1000) (blocked-jerry time-1100)
    (blocked-jerry time-1130) (blocked-jerry time-1230)
    (blocked-jerry time-1300) (blocked-jerry time-1330)
    (blocked-jerry time-1530) (blocked-jerry time-1600)
    (blocked-jerry time-1630) (blocked-jerry time-1700)

    (free-jerry time-0930) (free-jerry time-1030) (free-jerry time-1230)
    (free-jerry time-1300) (free-jerry time-1430) 
    (free-jerry time-1500)
  ) 

  (:goal 
    (exists (?time - time)
      (and 
        (meeting-scheduled ?time)
        (available-michelle ?time)
        (or
          (and (available-steven ?time ?time)
               (not (busy-steven ?time ?time)))
          (and (free-jerry ?time)
               (not (blocked-jerry ?time))))))
  ))