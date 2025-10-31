(define (problem schedule-meeting-monday)
  (:domain meeting-orchestrator)

  ;; Objects: 30-minute time slices from 09:00-09:30 (s0) up to 16:30-17:00 (s15).
  (:objects
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15
    stephen edward angela
  )

  (:init
    ;; Slots
    (slot s0) (slot s1) (slot s2) (slot s3) (slot s4) (slot s5) (slot s6) (slot s7)
    (slot s8) (slot s9) (slot s10) (slot s11) (slot s12) (slot s13) (slot s14) (slot s15)

    ;; Consecutive relations (next)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6)
    (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)

    ;; Free facts computed from each agent's private busy slots.
    ;; Stephen busy: s2 (10:00-10:30), s8 (13:00-13:30), s11 (14:30-15:00), s14 (16:00-16:30)
    ;; So Stephen free in all other slots:
    (free stephen s0) (free stephen s1) (free stephen s3) (free stephen s4)
    (free stephen s5) (free stephen s6) (free stephen s7) (free stephen s9)
    (free stephen s10) (free stephen s12) (free stephen s13) (free stephen s15)

    ;; Edward busy: s0 (09:00-09:30), s2 (10:00-10:30), s9 (13:30-14:00), s10 (14:00-14:30), s12 (15:00-15:30), s13 (15:30-16:00)
    ;; Edward free in the remaining slots:
    (free edward s1) (free edward s3) (free edward s4) (free edward s5)
    (free edward s6) (free edward s7) (free edward s8) (free edward s11)
    (free edward s14) (free edward s15)

    ;; Angela busy: s0,s1,s2,s3,s4 (09:00-11:30), s7 (12:30-13:00), s9,s10,s11,s12 (13:30-15:30), s14,s15 (16:00-17:00)
    ;; Angela free in:
    (free angela s5) (free angela s6) (free angela s8) (free angela s13)

    ;; No agreements yet and no scheduled meeting initially.
  )

  ;; Goal: produce a scheduled meeting that fits all participants.
  ;; From integrating all agents' availabilities, the feasible 60-minute slot is 11:30-12:30 (start s5 covering s5 and s6).
  (:goal (meeting-scheduled s5))
)