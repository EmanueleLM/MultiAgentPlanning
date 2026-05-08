(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    p1 p2 p3 - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; successor relation (30-minute increments)
    (succ s0900 s0930) (succ s0930 s1000) (succ s1000 s1030) (succ s1030 s1100)
    (succ s1100 s1130) (succ s1130 s1200) (succ s1200 s1230) (succ s1230 s1300)
    (succ s1300 s1330) (succ s1330 s1400) (succ s1400 s1430) (succ s1430 s1500)
    (succ s1500 s1530) (succ s1530 s1600) (succ s1600 s1630)

    ;; Participant 1 availability: full workday 09:00-17:00 (shorthand expanded to slots)
    (available p1 s0900) (available p1 s0930) (available p1 s1000) (available p1 s1030)
    (available p1 s1100) (available p1 s1130) (available p1 s1200) (available p1 s1230)
    (available p1 s1300) (available p1 s1330) (available p1 s1400) (available p1 s1430)
    (available p1 s1500) (available p1 s1530) (available p1 s1600) (available p1 s1630)

    ;; Participant 2 availability: intervals
    ;; 09:00-10:30 -> s0900, s0930, s1000
    (available p2 s0900) (available p2 s0930) (available p2 s1000)
    ;; 11:00-13:30 -> s1100, s1130, s1200, s1230, s1300
    (available p2 s1100) (available p2 s1130) (available p2 s1200) (available p2 s1230) (available p2 s1300)
    ;; 14:00-17:00 -> s1400, s1430, s1500, s1530, s1600, s1630
    (available p2 s1400) (available p2 s1430) (available p2 s1500) (available p2 s1530) (available p2 s1600) (available p2 s1630)

    ;; Participant 3 availability: 14:30-16:00 -> s1430, s1500, s1530
    (available p3 s1430) (available p3 s1500) (available p3 s1530)
  )

  ;; Goal: schedule a one-hour meeting (two contiguous 30-minute slots) where all participants are free.
  ;; The cleaned common window allows starts at 14:30 or 15:00; we fix the meeting to start at 14:30 (s1430 -> s1500).
  (:goal (meeting-scheduled s1430 s1500))
)