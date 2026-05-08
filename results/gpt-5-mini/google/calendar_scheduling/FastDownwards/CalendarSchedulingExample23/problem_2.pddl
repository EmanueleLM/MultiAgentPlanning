(define (problem schedule_monday_meeting)
  (:domain meeting_scheduling)
  (:objects
    billy maria william - participant
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 - slot
  )

  (:init
    ;; Billy's available 60-minute start slots (based on busy: 11:30-12:00, 13:00-15:00, 16:00-16:30)
    (free billy s0900)
    (free billy s0930)
    (free billy s1000)
    (free billy s1030)
    (free billy s1200)
    (free billy s1500)

    ;; Maria's available 60-minute start slots (based on busy: 9:00-9:30, 10:00-10:30, 13:00-13:30, 14:00-14:30)
    (free maria s1030)
    (free maria s1100)
    (free maria s1130)
    (free maria s1200)
    (free maria s1430)
    (free maria s1500)
    (free maria s1530)
    (free maria s1600)

    ;; William's available 60-minute start slots (based on busy: 9:30-10:00, 12:00-12:30, 13:30-15:00, 15:30-17:00)
    (free william s1000)
    (free william s1030)
    (free william s1100)
    (free william s1230)
  )

  ;; Goal: schedule a single meeting at a slot where all three participants attend.
  (:goal (and
    (meeting_scheduled s1030)
    (attending billy s1030)
    (attending maria s1030)
    (attending william s1030)
  ))
)