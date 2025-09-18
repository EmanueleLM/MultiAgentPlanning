(define (problem schedule-meeting-monday)
  (:domain orchestrated-meeting-scheduling)

  (:objects
    katherine nicole kevin - participant
    meeting1 - meeting
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; slots
    (slot s0900) (slot s0930) (slot s1000) (slot s1030)
    (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    ;; consecutive half-hour relationships (09:00-09:30, 09:30-10:00, ..., 16:00-16:30)
    (next s0900 s0930) (next s0930 s1000) (next s1000 s1030) (next s1030 s1100)
    (next s1100 s1130) (next s1130 s1200) (next s1200 s1230) (next s1230 s1300)
    (next s1300 s1330) (next s1330 s1400) (next s1400 s1430) (next s1430 s1500)
    (next s1500 s1530) (next s1530 s1600) (next s1600 s1630)

    ;; Katherine's availability: free all Monday 09:00-17:00 (30-min slots)
    (free katherine s0900) (free katherine s0930) (free katherine s1000) (free katherine s1030)
    (free katherine s1100) (free katherine s1130) (free katherine s1200) (free katherine s1230)
    (free katherine s1300) (free katherine s1330) (free katherine s1400) (free katherine s1430)
    (free katherine s1500) (free katherine s1530) (free katherine s1600) (free katherine s1630)

    ;; Nicole's availability: free all Monday 09:00-17:00 (30-min slots)
    (free nicole s0900) (free nicole s0930) (free nicole s1000) (free nicole s1030)
    (free nicole s1100) (free nicole s1130) (free nicole s1200) (free nicole s1230)
    (free nicole s1300) (free nicole s1330) (free nicole s1400) (free nicole s1430)
    (free nicole s1500) (free nicole s1530) (free nicole s1600) (free nicole s1630)

    ;; Kevin's busy slots (from agent 3) were:
    ;; busy: s0900, s0930, s1030, s1100, s1200..s1500, s1630
    ;; Therefore Kevin is free only in the remaining slots: s1000, s1130, s1530, s1600
    (free kevin s1000) (free kevin s1130) (free kevin s1530) (free kevin s1600)
  )

  ;; Goal: schedule a 60-minute meeting (meeting1) compatible with all participants
  (:goal (meeting-scheduled meeting1))
)