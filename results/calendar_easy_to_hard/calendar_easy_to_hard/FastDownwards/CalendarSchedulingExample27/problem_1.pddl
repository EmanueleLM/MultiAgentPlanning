(define (problem schedule-meeting)
  (:domain meeting-scheduling)
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
    walter danielle julia samuel lori - participant
  )
  (:init
    (slot s0900) (slot s0930) (slot s1000) (slot s1030) (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430) (slot s1500) (slot s1530) (slot s1600) (slot s1630)
    (participant walter) (participant danielle) (participant julia) (participant samuel) (participant lori)

    (earlier s0900 s0930) (earlier s0900 s1000) (earlier s0900 s1030) (earlier s0900 s1100) (earlier s0900 s1130)
    (earlier s0900 s1200) (earlier s0900 s1230) (earlier s0900 s1300) (earlier s0900 s1330) (earlier s0900 s1400)
    (earlier s0900 s1430) (earlier s0900 s1500) (earlier s0900 s1530) (earlier s0900 s1600) (earlier s0900 s1630)
    (earlier s0930 s1000) (earlier s0930 s1030) (earlier s0930 s1100) (earlier s0930 s1130) (earlier s0930 s1200)
    (earlier s0930 s1230) (earlier s0930 s1300) (earlier s0930 s1330) (earlier s0930 s1400) (earlier s0930 s1430)
    (earlier s0930 s1500) (earlier s0930 s1530) (earlier s0930 s1600) (earlier s0930 s1630)
    (earlier s1000 s1030) (earlier s1000 s1100) (earlier s1000 s1130) (earlier s1000 s1200) (earlier s1000 s1230)
    (earlier s1000 s1300) (earlier s1000 s1330) (earlier s1000 s1400) (earlier s1000 s1430) (earlier s1000 s1500)
    (earlier s1000 s1530) (earlier s1000 s1600) (earlier s1000 s1630)
    (earlier s1030 s1100) (earlier s1030 s1130) (earlier s1030 s1200) (earlier s1030 s1230) (earlier s1030 s1300)
    (earlier s1030 s1330) (earlier s1030 s1400) (earlier s1030 s1430) (earlier s1030 s1500) (earlier s1030 s1530)
    (earlier s1030 s1600) (earlier s1030 s1630)
    (earlier s1100 s1130) (earlier s1100 s1200) (earlier s1100 s1230) (earlier s1100 s1300) (earlier s1100 s1330)
    (earlier s1100 s1400) (earlier s1100 s1430) (earlier s1100 s1500) (earlier s1100 s1530) (earlier s1100 s1600)
    (earlier s1100 s1630)
    (earlier s1130 s1200) (earlier s1130 s1230) (earlier s1130 s1300) (earlier s1130 s1330) (earlier s1130 s1400)
    (earlier s1130 s1430) (earlier s1130 s1500) (earlier s1130 s1530) (earlier s1130 s1600) (earlier s1130 s1630)
    (earlier s1200 s1230) (earlier s1200 s1300) (earlier s1200 s1330) (earlier s1200 s1400) (earlier s1200 s1430)
    (earlier s1200 s1500) (earlier s1200 s1530) (earlier s1200 s1600) (earlier s1200 s1630)
    (earlier s1230 s1300) (earlier s1230 s1330) (earlier s1230 s1400) (earlier s1230 s1430) (earlier s1230 s1500)
    (earlier s1230 s1530) (earlier s1230 s1600) (earlier s1230 s1630)
    (earlier s1300 s1330) (earlier s1300 s1400) (earlier s1300 s1430) (earlier s1300 s1500) (earlier s1300 s1530)
    (earlier s1300 s1600) (earlier s1300 s1630)
    (earlier s1330 s1400) (earlier s1330 s1430) (earlier s1330 s1500) (earlier s1330 s1530) (earlier s1330 s1600)
    (earlier s1330 s1630)
    (earlier s1400 s1430) (earlier s1400 s1500) (earlier s1400 s1530) (earlier s1400 s1600) (earlier s1400 s1630)
    (earlier s1430 s1500) (earlier s1430 s1530) (earlier s1430 s1600) (earlier s1430 s1630)
    (earlier s1500 s1530) (earlier s1500 s1600) (earlier s1500 s1630)
    (earlier s1530 s1600) (earlier s1530 s1630)
    (earlier s1600 s1630)

    ; initial cost values
    (= (total-cost) 0)
    (= (slot-index s0900) 0) (= (slot-index s0930) 1) (= (slot-index s1000) 2) (= (slot-index s1030) 3)
    (= (slot-index s1100) 4) (= (slot-index s1130) 5) (= (slot-index s1200) 6) (= (slot-index s1230) 7)
    (= (slot-index s1300) 8) (= (slot-index s1330) 9) (= (slot-index s1400) 10) (= (slot-index s1430) 11)
    (= (slot-index s1500) 12) (= (slot-index s1530) 13) (= (slot-index s1600) 14) (= (slot-index s1630) 15)

    ; availabilities encoded as free facts (participant free at slot start)
    ; Walter: free all slots
    (free walter s0900) (free walter s0930) (free walter s1000) (free walter s1030)
    (free walter s1100) (free walter s1130) (free walter s1200) (free walter s1230)
    (free walter s1300) (free walter s1330) (free walter s1400) (free walter s1430)
    (free walter s1500) (free walter s1530) (free walter s1600) (free walter s1630)

    ; Danielle: free all slots
    (free danielle s0900) (free danielle s0930) (free danielle s1000) (free danielle s1030)
    (free danielle s1100) (free danielle s1130) (free danielle s1200) (free danielle s1230)
    (free danielle s1300) (free danielle s1330) (free danielle s1400) (free danielle s1430)
    (free danielle s1500) (free danielle s1530) (free danielle s1600) (free danielle s1630)

    ; Julia: busy 09:30-10:00 (s0930), 10:30-11:00 (s1030), 13:30-14:00 (s1330), 16:00-16:30 (s1600)
    (free julia s0900) (free julia s1000) (free julia s1100) (free julia s1130)
    (free julia s1200) (free julia s1230) (free julia s1300) (free julia s1400)
    (free julia s1430) (free julia s1500) (free julia s1530) (free julia s1630)

    ; Samuel: busy 09:00-11:00 (s0900,s0930,s1000,s1030), 11:30-12:30 (s1130,s1200),
    ; 13:00-14:30 (s1300,s1330,s1400), 15:00-15:30 (s1500), 16:00-17:00 (s1600,s1630)
    (free samuel s1100) (free samuel s1230) (free samuel s1430) (free samuel s1530)

    ; Lori: busy 10:00-10:30 (s1000), 11:00-11:30 (s1100), 12:00-12:30 (s1200),
    ; 13:00-14:30 (s1300,s1330,s1400), 15:00-17:00 (s1500,s1530,s1600,s1630)
    (free lori s0900) (free lori s0930) (free lori s1030) (free lori s1130)
    (free lori s1230) (free lori s1430)
  )
  (:goal (meeting-scheduled))
  (:metric minimize (total-cost))
)