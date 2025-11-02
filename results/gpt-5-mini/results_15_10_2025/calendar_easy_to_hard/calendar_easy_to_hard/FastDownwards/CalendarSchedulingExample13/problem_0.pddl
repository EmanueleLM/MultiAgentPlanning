(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)
  (:objects
    diane jack eugene patricia - participant
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )
  (:init
    ;; agents
    (agent diane) (agent jack) (agent eugene) (agent patricia)

    ;; slots (09:00-09:30 ... 16:30-17:00)
    (slot s1)  (slot s2)  (slot s3)  (slot s4)
    (slot s5)  (slot s6)  (slot s7)  (slot s8)
    (slot s9)  (slot s10) (slot s11) (slot s12)
    (slot s13) (slot s14) (slot s15) (slot s16)

    ;; free slots for Diane (blocked: s2, s12)
    (free diane s1) (free diane s3) (free diane s4) (free diane s5)
    (free diane s6) (free diane s7) (free diane s8) (free diane s9)
    (free diane s10) (free diane s11) (free diane s13) (free diane s14)
    (free diane s15) (free diane s16)

    ;; free slots for Jack (blocked: s10, s12)
    (free jack s1) (free jack s2) (free jack s3) (free jack s4)
    (free jack s5) (free jack s6) (free jack s7) (free jack s8)
    (free jack s9) (free jack s11) (free jack s13) (free jack s14)
    (free jack s15) (free jack s16)

    ;; free slots for Eugene (blocked: s1,s2,s4,s5,s7,s8,s9,s10,s11,s13,s14,s15)
    ;; free: s3 (10:00-10:30), s6 (11:30-12:00), s12 (14:30-15:00), s16 (16:30-17:00)
    (free eugene s3) (free eugene s6) (free eugene s12) (free eugene s16)

    ;; free slots for Patricia (blocked: s2,s3,s5,s6,s8,s9,s10,s13,s14,s15)
    ;; free: s1, s4, s7, s11, s12, s16
    (free patricia s1) (free patricia s4) (free patricia s7)
    (free patricia s11) (free patricia s12) (free patricia s16)
  )

  ;; Prefer the earliest feasible common 30-minute slot: enforce scheduling at s16 (16:30-17:00)
  (:goal (scheduled s16))
)