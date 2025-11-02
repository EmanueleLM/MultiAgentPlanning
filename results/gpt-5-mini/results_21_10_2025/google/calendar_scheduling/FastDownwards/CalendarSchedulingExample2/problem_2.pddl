(define (problem schedule-monday)
  (:domain meeting-scheduling)

  (:objects
    roy kathryn amy - participant
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    (available roy s0930)
    (available roy s1030)
    (available roy s1130)
    (available roy s1200)
    (available roy s1300)
    (available roy s1330)
    (available roy s1400)
    (available roy s1430)
    (available roy s1500)
    (available roy s1530)
    (available roy s1600)
    (available roy s1630)

    (available kathryn s0900)
    (available kathryn s1000)
    (available kathryn s1030)
    (available kathryn s1100)
    (available kathryn s1130)
    (available kathryn s1200)
    (available kathryn s1230)
    (available kathryn s1300)
    (available kathryn s1330)
    (available kathryn s1400)
    (available kathryn s1430)
    (available kathryn s1500)
    (available kathryn s1530)
    (available kathryn s1600)

    (available amy s1430)
    (available amy s1600)

    (amy_pref s1430)
  )

  (:goal (meeting-scheduled))
)