(define (problem combined-schedule-meeting)
  (:domain combined-meeting-scheduling)
  (:objects 
    slot9-10 slot10-11 slot12-13 slot13-14 slot14-15 slot15-16 slot16-17 - time
    steven - person
    time-0900 time-0930 time-1000 time-1030 time-1100 time-1130 time-1200
    time-1230 time-1300 time-1330 time-1400 time-1430 time-1500 time-1530
    time-1600 time-1630 time-1700 - time)
  
  (:init 
    ; Agent 1 availability
    (available-agent1 slot9-10)
    (available-agent1 slot10-11)
    (available-agent1 slot12-13)
    (available-agent1 slot13-14)
    (available-agent1 slot14-15)
    (available-agent1 slot15-16)
    (available-agent1 slot16-17)

    ; Agent 2 status
    (busy-agent2 steven time-0900 time-0930)
    (busy-agent2 steven time-1130 time-1200)
    (busy-agent2 steven time-1330 time-1400)
    (busy-agent2 steven time-1530 time-1600)

    (available-agent2 steven time-0930 time-1030)
    (available-agent2 steven time-1000 time-1100)
    (available-agent2 steven time-1100 time-1200)
    (available-agent2 steven time-1200 time-1330)
    (available-agent2 steven time-1400 time-1530)
    (available-agent2 steven time-1600 time-1700)

    ; Agent 3 status
    (blocked-agent3 time-0900) (blocked-agent3 time-0930)
    (blocked-agent3 time-1000) (blocked-agent3 time-1030)
    (blocked-agent3 time-1100) (blocked-agent3 time-1130)
    (blocked-agent3 time-1300) (blocked-agent3 time-1330)
    (blocked-agent3 time-1530) (blocked-agent3 time-1600)
    (blocked-agent3 time-1630) (blocked-agent3 time-1700)

    (free-agent3 time-0930) (free-agent3 time-1030) (free-agent3 time-1230) 
    (free-agent3 time-1330) (free-agent3 time-1430) 
    (free-agent3 time-1500) (free-agent3 time-1600)
  ) 

  (:goal 
    (exists (?time - time)
      (and 
        (meeting-scheduled ?time)
        (or
          (and (available-agent1 ?time)
               (meeting-scheduled ?time))
          (and (available-agent2 steven ?time ?time)
               (not (busy-agent2 steven ?time ?time))
               (meeting-scheduled ?time))
          (and (free-agent3 ?time)
               (not (blocked-agent3 ?time))
               (meeting-scheduled ?time))))))
)