(define (problem schedule-meeting-problem)
  (:domain scheduling)

  ;; Objects: three participants and half-hour slots from 09:00 to 16:30 (30-minute granularity).
  ;; Slot names map as follows:
  ;; s0=09:00, s1=09:30, s2=10:00, s3=10:30, s4=11:00, s5=11:30, s6=12:00,
  ;; s7=12:30, s8=13:00, s9=13:30, s10=14:00, s11=14:30, s12=15:00, s13=15:30, s14=16:00, s15=16:30
  (:objects
    theresa charles betty - person
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )

  (:init
    ;; Successor (succ) chain: explicit contiguous order, enforcing allowed contiguous scheduling only.
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4)
    (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12)
    (succ s12 s13) (succ s13 s14) (succ s14 s15)

    ;; Cleaned individual availabilities (30-min slot starts that lie in each participant's half-open intervals).
    ;; Theresa: [09:30–12:30) -> s1,s2,s3,s4,s5,s6 ; [15:00–16:30) -> s12,s13,s14
    (available theresa s1) (available theresa s2) (available theresa s3)
    (available theresa s4) (available theresa s5) (available theresa s6)
    (available theresa s12) (available theresa s13) (available theresa s14)

    ;; Charles: [09:00–10:00) -> s0,s1 ; [10:30–11:30) -> s3,s4 ; [12:30–14:00) -> s7,s8,s9 ; [15:30–17:00) -> s13,s14,s15
    (available charles s0) (available charles s1)
    (available charles s3) (available charles s4)
    (available charles s7) (available charles s8) (available charles s9)
    (available charles s13) (available charles s14) (available charles s15)

    ;; Betty: [10:30–12:00) -> s3,s4,s5 ; [14:00–15:00) -> s10,s11 ; [16:00–17:00) -> s14,s15
    (available betty s3) (available betty s4) (available betty s5)
    (available betty s10) (available betty s11)
    (available betty s14) (available betty s15)
  )

  ;; Goal: the single mandated 60-minute meeting must be scheduled (slot choice constrained by availabilities).
  ;; This goal fixes the mandatory terminal condition (meeting scheduled). Because availabilities were encoded
  ;; as hard constraints, the solver can only achieve this by choosing a start slot where all three participants
  ;; are available in two consecutive slots (the only such start is s3 = 10:30 in the provided data).
  (:goal (meeting-scheduled))
)