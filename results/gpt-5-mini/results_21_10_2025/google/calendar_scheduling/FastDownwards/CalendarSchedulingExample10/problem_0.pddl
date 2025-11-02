(define (problem schedule-meeting-monday)
  (:domain meeting-scheduler)

  (:objects
    diana ethan janet - person

    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  (:init
    ;; Diana's availability windows (09:00-11:30, 12:00-13:00, 13:30-17:00)
    ;; Allowed start times for a 30-minute meeting (meeting must end within each window)
    (available diana s09_00)
    (available diana s09_30)
    (available diana s10_00)
    (available diana s10_30)
    (available diana s11_00)
    (available diana s12_00)
    (available diana s12_30)
    (available diana s13_30)
    (available diana s14_00)
    (available diana s14_30)
    (available diana s15_00)
    (available diana s15_30)
    (available diana s16_00)
    (available diana s16_30)

    ;; Ethan: explicitly no free intervals on Monday and "No meetings on Monday"
    ;; (no (available ethan ...)) -> no availability facts for Ethan

    ;; Janet: free 10:00-12:30 but requires meeting to finish by 12:00.
    ;; Therefore effective window for the 30-min meeting is 10:00-12:00 (starts 10:00,10:30,11:00,11:30)
    (available janet s10_00)
    (available janet s10_30)
    (available janet s11_00)
    (available janet s11_30)
  )

  (:goal (meeting-scheduled))
)