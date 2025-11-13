(define (problem calendar-scheduling-problem)
  (:domain calendar-scheduling)

  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; mark all slots as working-hour slots (09:00-17:00 broken into 30-min slots)
    (work_slot s0900) (work_slot s0930) (work_slot s1000) (work_slot s1030)
    (work_slot s1100) (work_slot s1130) (work_slot s1200) (work_slot s1230)
    (work_slot s1300) (work_slot s1330) (work_slot s1400) (work_slot s1430)
    (work_slot s1500) (work_slot s1530) (work_slot s1600) (work_slot s1630)

    ;; consecutive 30-minute successor relations (explicit ordered stages)
    (next s0900 s0930) (next s0930 s1000) (next s1000 s1030)
    (next s1030 s1100) (next s1100 s1130) (next s1130 s1200)
    (next s1200 s1230) (next s1230 s1300) (next s1300 s1330)
    (next s1330 s1400) (next s1400 s1430) (next s1430 s1500)
    (next s1500 s1530) (next s1530 s1600) (next s1600 s1630)

    ;; encode existing busy slots for each participant (no implicit slack allowed)
    ;; Madison busy: 09:30-10:00 (s0930), 11:30-12:00 (s1130)
    (busy madison s0930) (busy madison s1130)

    ;; Diana busy: 11:00-11:30 (s1100), 13:00-13:30 (s1300)
    (busy diana s1100) (busy diana s1300)

    ;; Shirley busy: 09:00-12:00 (s0900,s0930,s1000,s1030,s1100,s1130),
    ;; 13:30-15:00 (s1330,s1400,s1430), 15:30-17:00 (s1530,s1600,s1630)
    (busy shirley s0900) (busy shirley s0930) (busy shirley s1000)
    (busy shirley s1030) (busy shirley s1100) (busy shirley s1130)
    (busy shirley s1330) (busy shirley s1400) (busy shirley s1430)
    (busy shirley s1530) (busy shirley s1600) (busy shirley s1630)
  )

  ;; Terminal goal requires the meeting to be scheduled exactly once (as enforced by action effects)
  (:goal (meeting_scheduled))
)