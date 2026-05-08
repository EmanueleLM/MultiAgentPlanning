(define (problem schedule_monday)
  (:domain schedule_meeting)

  (:objects
    david debra kevin auditor orchestrator - person
    meeting1 - meeting

    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 - slot
  )

  (:init
    ;; meeting scaffold
    (unscheduled meeting1)

    ;; David: free the entire workday (all valid 60-min start slots)
    (available david s0900)
    (available david s0930)
    (available david s1000)
    (available david s1030)
    (available david s1100)
    (available david s1130)
    (available david s1200)
    (available david s1230)
    (available david s1300)
    (available david s1330)
    (available david s1400)
    (available david s1430)
    (available david s1500)
    (available david s1530)
    (available david s1600)

    ;; Debra: canonical 60-minute start slots where she is free for the full hour
    ;; Debra busy: 09:30-10:00, 11:00-11:30, 12:00-13:00, 14:00-14:30, 16:00-16:30.
    (available debra s1000)   ; 10:00-11:00
    (available debra s1300)   ; 13:00-14:00
    (available debra s1430)   ; 14:30-15:30
    (available debra s1500)   ; 15:00-16:00

    ;; Kevin: canonical 60-minute start slots where he is free for the full hour
    ;; Kevin busy: 09:00-12:00, 14:00-17:00.
    (available kevin s1200)   ; 12:00-13:00
    (available kevin s1230)   ; 12:30-13:30
    (available kevin s1300)   ; 13:00-14:00
  )

  ;; Goal: schedule the meeting (planner must pick a slot available for all three)
  (:goal (scheduled meeting1))
)