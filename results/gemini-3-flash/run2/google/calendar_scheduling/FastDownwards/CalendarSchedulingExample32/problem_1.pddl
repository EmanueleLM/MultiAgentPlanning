(define (problem calendar_problem)
  (:domain calendar_scheduling)
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    ;; Emily's busy slots: s1000, s1130, s1200, s1400, s1430, s1600
    (available emily s0900)
    (available emily s0930)
    (available emily s1030)
    (available emily s1100)
    (available emily s1230)
    (available emily s1300)
    (available emily s1330)
    (available emily s1500)
    (available emily s1530)
    (available emily s1630)

    ;; Melissa's busy slots: s0930, s1430
    (available melissa s0900)
    (available melissa s1000)
    (available melissa s1030)
    (available melissa s1100)
    (available melissa s1130)
    (available melissa s1200)
    (available melissa s1230)
    (available melissa s1300)
    (available melissa s1330)
    (available melissa s1400)
    (available melissa s1500)
    (available melissa s1530)
    (available melissa s1600)
    (available melissa s1630)

    ;; Frank's constraint: No meetings after 9:30.
    ;; Only s0900 (9:00-9:30) is available for Frank.
    (available frank s0900)
  )
  (:goal (meeting_scheduled))
)