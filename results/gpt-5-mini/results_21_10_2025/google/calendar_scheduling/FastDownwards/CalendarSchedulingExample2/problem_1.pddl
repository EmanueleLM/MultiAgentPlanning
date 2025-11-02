(define (problem schedule-monday)
  (:domain meeting-scheduling)

  (:objects
    roy kathryn amy - participant
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; participants and slots
    (participant roy)
    (participant kathryn)
    (participant amy)

    (slot s0900) (slot s0930) (slot s1000) (slot s1030)
    (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    ;; Roy's blocked intervals: 09:00-09:30, 10:00-10:30, 11:00-11:30, 12:30-13:00
    ;; Roy's available 30-min slots between 09:00 and 17:00:
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

    ;; Kathryn's blocked intervals: 09:30-10:00, 16:30-17:00
    ;; Kathryn's available 30-min slots:
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

    ;; Amy's blocked intervals: 09:00-14:30, 15:00-16:00, 16:30-17:00
    ;; That leaves Amy available at 14:30-15:00 (s1430) and 16:00-16:30 (s1600).
    ;; Amy's stated preference: would rather not meet after 15:30 on Monday.
    ;; We model that preference as a required constraint (amy_pref) so that only slots
    ;; Amy prefers/accepts are chosen. Mark s1430 as preferred; s1600 is available but not preferred.
    (available amy s1430)
    (available amy s1600)

    (amy_pref s1430)
  )

  ;; Goal: schedule one meeting that satisfies all availability constraints and Amy's preference.
  ;; The goal does NOT name the exact slot; the action preconditions and init facts ensure
  ;; the only feasible scheduled slot that respects all constraints is s1430.
  (:goal (meeting-scheduled))
)