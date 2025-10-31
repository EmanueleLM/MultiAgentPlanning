(define (problem schedule-monday-60min-combined)
  (:domain meeting-scheduling-combined)

  (:objects
    madison diana shirley - participant

    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; adjacency facts (both predicate names to satisfy all agents)
    (next s0900 s0930) (slot-next s0900 s0930)
    (next s0930 s1000) (slot-next s0930 s1000)
    (next s1000 s1030) (slot-next s1000 s1030)
    (next s1030 s1100) (slot-next s1030 s1100)
    (next s1100 s1130) (slot-next s1100 s1130)
    (next s1130 s1200) (slot-next s1130 s1200)
    (next s1200 s1230) (slot-next s1200 s1230)
    (next s1230 s1300) (slot-next s1230 s1300)
    (next s1300 s1330) (slot-next s1300 s1330)
    (next s1330 s1400) (slot-next s1330 s1400)
    (next s1400 s1430) (slot-next s1400 s1430)
    (next s1430 s1500) (slot-next s1430 s1500)
    (next s1500 s1530) (slot-next s1500 s1530)
    (next s1530 s1600) (slot-next s1530 s1600)
    (next s1600 s1630) (slot-next s1600 s1630)

    ;; Integrated busy knowledge:
    ;; Agent 1 reported Madison busy at s0930 and s1130 -> encode as busy
    (busy madison s0930) (busy madison s1130)

    ;; Agent 2 reported Diana busy at s1100 and s1300 -> encode as busy
    (busy diana s1100) (busy diana s1300)

    ;; Agent 3 reported Shirley busy at many slots (mapped to same slot names)
    ;; Busy Monday 09:00-12:00 => s0900,s0930,s1000,s1030,s1100,s1130
    (busy shirley s0900) (busy shirley s0930) (busy shirley s1000)
    (busy shirley s1030) (busy shirley s1100) (busy shirley s1130)
    ;; Busy Monday 13:30-15:00 => s1330,s1400,s1430
    (busy shirley s1330) (busy shirley s1400) (busy shirley s1430)
    ;; Busy Monday 15:30-17:00 => s1530,s1600,s1630
    (busy shirley s1530) (busy shirley s1600) (busy shirley s1630)

    ;; Integrated availability facts (we assert free/available only where no agent reported busy)
    ;; Madison: free/available in all slots except s0930 and s1130
    (free madison s0900) (available madison s0900)
    (free madison s1000) (available madison s1000)
    (free madison s1030) (available madison s1030)
    (free madison s1100) (available madison s1100)
    (free madison s1200) (available madison s1200)
    (free madison s1230) (available madison s1230)
    (free madison s1300) (available madison s1300)
    (free madison s1330) (available madison s1330)
    (free madison s1400) (available madison s1400)
    (free madison s1430) (available madison s1430)
    (free madison s1500) (available madison s1500)
    (free madison s1530) (available madison s1530)
    (free madison s1600) (available madison s1600)
    (free madison s1630) (available madison s1630)

    ;; Diana: agent2 indicated busy at s1100 and s1300, so do not assert availability there.
    (free diana s0900) (available diana s0900)
    (free diana s0930) (available diana s0930)
    (free diana s1000) (available diana s1000)
    (free diana s1030) (available diana s1030)
    (free diana s1130) (available diana s1130)
    (free diana s1200) (available diana s1200)
    (free diana s1230) (available diana s1230)
    (free diana s1330) (available diana s1330)
    (free diana s1400) (available diana s1400)
    (free diana s1430) (available diana s1430)
    (free diana s1500) (available diana s1500)
    (free diana s1530) (available diana s1530)
    (free diana s1600) (available diana s1600)
    (free diana s1630) (available diana s1630)

    ;; Shirley: availability only where not marked busy by agent3.
    ;; Busy lists removed availability for those slots; remaining free slots: s1200,s1230,s1300,s1500
    (free shirley s1200) (available shirley s1200)
    (free shirley s1230) (available shirley s1230)
    (free shirley s1300) (available shirley s1300)
    (free shirley s1500) (available shirley s1500)
  )

  ;; Goal: any agent scheduling that sets the common meeting marker (meeting-scheduled)
  (:goal (meeting-scheduled))
)