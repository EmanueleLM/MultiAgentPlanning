(define (problem orchestrator-problem)
  (:domain schedule-meeting-domain)

  (:objects
    stephen edward angela - agent

    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  (:init
    ;; successor relations (30-minute granularity)
    (succ s09_00 s09_30) (succ s09_30 s10_00) (succ s10_00 s10_30) (succ s10_30 s11_00)
    (succ s11_00 s11_30) (succ s11_30 s12_00) (succ s12_00 s12_30) (succ s12_30 s13_00)
    (succ s13_00 s13_30) (succ s13_30 s14_00) (succ s14_00 s14_30) (succ s14_30 s15_00)
    (succ s15_00 s15_30) (succ s15_30 s16_00) (succ s16_00 s16_30)

    ;; --- free slots derived from each agent's private busy times ---
    ;; Stephen's busy slots: 10:00-10:30 (s10_00), 13:00-13:30 (s13_00), 14:30-15:00 (s14_30), 16:00-16:30 (s16_00)
    ;; Therefore Stephen is free in every other slot within work hours:
    (free stephen s09_00) (free stephen s09_30) (free stephen s10_30)
    (free stephen s11_00) (free stephen s11_30) (free stephen s12_00)
    (free stephen s12_30) (free stephen s13_30) (free stephen s14_00)
    (free stephen s15_00) (free stephen s15_30) (free stephen s16_30)

    ;; Edward's busy slots: 09:00-09:30 (s09_00), 10:00-10:30 (s10_00),
    ;; 13:30-14:30 (s13_30, s14_00), 15:00-16:00 (s15_00, s15_30)
    ;; Therefore Edward is free in the remaining slots:
    (free edward s09_30) (free edward s10_30)
    (free edward s11_00) (free edward s11_30) (free edward s12_00) (free edward s12_30)
    (free edward s13_00) (free edward s14_30) (free edward s16_00) (free edward s16_30)

    ;; Angela's busy slots: 09:00-11:30 (s09_00,s09_30,s10_00,s10_30,s11_00),
    ;; 12:30-13:00 (s12_30), 13:30-15:30 (s13_30,s14_00,s14_30,s15_00),
    ;; 16:00-17:00 (s16_00,s16_30)
    ;; Therefore Angela is free in:
    (free angela s11_30) (free angela s12_00) (free angela s13_00) (free angela s15_30)
  )

  ;; Goal: schedule a 60-minute meeting (2 consecutive 30-min slots).
  ;; From the combined availabilities the feasible common start is 11:30 (s11_30 -> s12_00).
  (:goal (meeting-scheduled s11_30))
)