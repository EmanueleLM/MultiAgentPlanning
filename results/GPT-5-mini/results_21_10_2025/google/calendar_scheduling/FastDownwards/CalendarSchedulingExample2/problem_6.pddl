(define (problem schedule-monday)
  (:domain meeting-scheduling)

  (:objects
    roy kathryn amy orchestrator - participant
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ; Roy's availability (Roy blocked: 09:00, 10:00, 11:00, 12:30)
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

    ; Kathryn's availability (Kathryn blocked: 09:30, 16:30)
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

    ; Amy's availability (Amy blocked: 09:00-14:30, 15:00-16:00, 16:30-17:00)
    (available amy s1430)
    (available amy s1600)

    ; Amy's preference structurally encoded so planner will only schedule slots respecting it
    (amy_pref s1430)
  )

  (:goal (meeting-scheduled))
)