(define (problem schedule-monday)
  (:domain meeting-scheduler)

  (:objects
    katherine nicole kevin - agent
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )

  (:init
    ; valid meeting start slots (09:00 .. 16:00) correspond to s0 .. s14
    (startable s0) (startable s1) (startable s2) (startable s3) (startable s4)
    (startable s5) (startable s6) (startable s7) (startable s8) (startable s9)
    (startable s10) (startable s11) (startable s12) (startable s13) (startable s14)

    ; consecutive half-hour relations from 09:00..16:30 (s0 -> s1 -> ... -> s15)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)

    ; Katherine is free the entire Monday 09:00-17:00 (all half-hour slots s0..s15)
    (free katherine s0) (free katherine s1) (free katherine s2) (free katherine s3)
    (free katherine s4) (free katherine s5) (free katherine s6) (free katherine s7)
    (free katherine s8) (free katherine s9) (free katherine s10) (free katherine s11)
    (free katherine s12) (free katherine s13) (free katherine s14) (free katherine s15)

    ; Nicole is free the entire Monday 09:00-17:00 (all half-hour slots s0..s15)
    (free nicole s0) (free nicole s1) (free nicole s2) (free nicole s3)
    (free nicole s4) (free nicole s5) (free nicole s6) (free nicole s7)
    (free nicole s8) (free nicole s9) (free nicole s10) (free nicole s11)
    (free nicole s12) (free nicole s13) (free nicole s14) (free nicole s15)

    ; Kevin's private busy intervals (expressed by omitting free on those slots)
    ; Kevin is busy 09:00-10:00 -> s0,s1 busy (no free)
    ; busy 10:30-11:30 -> s3,s4 busy
    ; busy 12:00-15:30 -> s6..s12 busy
    ; busy 16:30-17:00 -> s15 busy
    ; Therefore Kevin is free only on s2 (10:00-10:30), s5 (11:30-12:00), s13 (15:30-16:00), s14 (16:00-16:30)
    (free kevin s2) (free kevin s5) (free kevin s13) (free kevin s14)
  )

  ;; Goal: schedule a single 60-minute meeting (two consecutive 30min slots) on Monday between 09:00 and 17:00
  ;; that all three participants attend. We express this as a disjunction over all valid start slots s0..s14.
  (:goal
    (or
      (and (attending katherine s0) (attending nicole s0) (attending kevin s0))
      (and (attending katherine s1) (attending nicole s1) (attending kevin s1))
      (and (attending katherine s2) (attending nicole s2) (attending kevin s2))
      (and (attending katherine s3) (attending nicole s3) (attending kevin s3))
      (and (attending katherine s4) (attending nicole s4) (attending kevin s4))
      (and (attending katherine s5) (attending nicole s5) (attending kevin s5))
      (and (attending katherine s6) (attending nicole s6) (attending kevin s6))
      (and (attending katherine s7) (attending nicole s7) (attending kevin s7))
      (and (attending katherine s8) (attending nicole s8) (attending kevin s8))
      (and (attending katherine s9) (attending nicole s9) (attending kevin s9))
      (and (attending katherine s10) (attending nicole s10) (attending kevin s10))
      (and (attending katherine s11) (attending nicole s11) (attending kevin s11))
      (and (attending katherine s12) (attending nicole s12) (attending kevin s12))
      (and (attending katherine s13) (attending nicole s13) (attending kevin s13))
      (and (attending katherine s14) (attending nicole s14) (attending kevin s14))
    )
  )
)