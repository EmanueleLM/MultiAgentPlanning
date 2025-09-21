(define (problem integrated-schedule-monday)
  (:domain integrated-meeting-scheduling)
  (:objects
    ben juan heather nathan jacob - person
    m1 - meeting
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    (is_meeting m1)

    (is_slot s0900) (within_workhours s0900) (free_slot s0900)
    (is_slot s0930) (within_workhours s0930) (free_slot s0930)
    (is_slot s1000) (within_workhours s1000) (free_slot s1000)
    (is_slot s1030) (within_workhours s1030) (free_slot s1030)
    (is_slot s1100) (within_workhours s1100) (free_slot s1100)
    (is_slot s1130) (within_workhours s1130) (free_slot s1130)
    (is_slot s1200) (within_workhours s1200) (free_slot s1200)
    (is_slot s1230) (within_workhours s1230) (free_slot s1230)
    (is_slot s1300) (within_workhours s1300) (free_slot s1300)
    (is_slot s1330) (within_workhours s1330) (free_slot s1330)
    (is_slot s1400) (within_workhours s1400) (free_slot s1400)
    (is_slot s1430) (within_workhours s1430) (free_slot s1430)
    (is_slot s1500) (within_workhours s1500) (free_slot s1500)
    (is_slot s1530) (within_workhours s1530) (free_slot s1530)
    (is_slot s1600) (within_workhours s1600) (free_slot s1600)
    (is_slot s1630) (within_workhours s1630) (free_slot s1630)

    (participant_of m1 ben)
    (participant_of m1 juan)
    (participant_of m1 heather)
    (participant_of m1 nathan)
    (participant_of m1 jacob)

    ;; Benjamin busy: 10:00, 11:30, 12:30, 13:30, 15:00, 16:00
    (busy ben s1000)
    (busy ben s1130)
    (busy ben s1230)
    (busy ben s1330)
    (busy ben s1500)
    (busy ben s1600)

    ;; Juan busy: 10:00, 11:00, 12:00, 14:30-16:00 => 14:30,15:00,15:30
    (busy juan s1000)
    (busy juan s1100)
    (busy juan s1200)
    (busy juan s1430)
    (busy juan s1500)
    (busy juan s1530)

    ;; Heather busy: 09:00, 10:00, 12:30, 14:00
    (busy heather s0900)
    (busy heather s1000)
    (busy heather s1230)
    (busy heather s1400)

    ;; Nathan busy: 09:00-11:00 => 09:00,09:30,10:00,10:30; 11:30-12:30 => 11:30,12:00; 14:00; 15:00-16:00 => 15:00,15:30; 16:30
    (busy nathan s0900)
    (busy nathan s0930)
    (busy nathan s1000)
    (busy nathan s1030)
    (busy nathan s1130)
    (busy nathan s1200)
    (busy nathan s1400)
    (busy nathan s1500)
    (busy nathan s1530)
    (busy nathan s1630)

    ;; Jacob busy: 09:00, 10:00, 11:00-13:00 => 11:00,11:30,12:00,12:30; 13:30-15:00 => 13:30,14:00,14:30; 15:30-17:00 => 15:30,16:00,16:30
    (busy jacob s0900)
    (busy jacob s1000)
    (busy jacob s1100)
    (busy jacob s1130)
    (busy jacob s1200)
    (busy jacob s1230)
    (busy jacob s1330)
    (busy jacob s1400)
    (busy jacob s1430)
    (busy jacob s1530)
    (busy jacob s1600)
    (busy jacob s1630)
  )

  (:goal (meeting_at m1 s1300))
)