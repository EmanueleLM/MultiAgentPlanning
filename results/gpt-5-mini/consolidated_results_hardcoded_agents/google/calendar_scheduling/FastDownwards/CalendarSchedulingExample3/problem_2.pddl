(define (problem schedule-monday-meeting)
  (:domain meeting-scheduling)
  (:objects
    ;; half-hour primitives spanning Monday 09:00-17:00 at 30-minute granularity
    h0900 h0930 h1000 h1030 h1100 h1130 h1200 h1230
    h1300 h1330 h1400 h1430 h1500 h1530 h1600 h1630 - halfslot

    ;; candidate meeting slot(s) — only the audited-valid candidate is modeled explicitly
    slot_0930_1030 - slot
  )

  (:init
    ;; contiguity chain for the half-hour primitives
    (succ h0900 h0930) (succ h0930 h1000) (succ h1000 h1030) (succ h1030 h1100)
    (succ h1100 h1130) (succ h1130 h1200) (succ h1200 h1230) (succ h1230 h1300)
    (succ h1300 h1330) (succ h1330 h1400) (succ h1400 h1430) (succ h1430 h1500)
    (succ h1500 h1530) (succ h1530 h1600) (succ h1600 h1630)

    ;; mapping: the audited valid 60-minute slot [09:30,10:30) covers h0930 and h1000
    (covers slot_0930_1030 h0930)
    (covers slot_0930_1030 h1000)

    ;; audited verification: slot is inside the work window (09:00-17:00)
    (within_work_window slot_0930_1030)

    ;; INITIAL AVAILABILITY: include free predicates only for audited valid slot halfslots.
    ;; Audit determined that Arthur, Michael, and Samantha are free for both h0930 and h1000.
    (free Arthur h0930) (free Arthur h1000)
    (free Michael h0930) (free Michael h1000)
    (free Samantha h0930) (free Samantha h1000)
  )

  ;; Goal: require that the top-ranked audited-valid slot is chosen/scheduled.
  (:goal (and
    (chosen slot_0930_1030)
  ))
)