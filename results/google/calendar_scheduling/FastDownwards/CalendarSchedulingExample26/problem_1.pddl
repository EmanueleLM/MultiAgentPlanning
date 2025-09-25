(define (problem schedule-monday)
  (:domain meeting-scheduler)
  (:objects
    katherine nicole kevin - agent
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )
  (:init
    (startable s0) (startable s1) (startable s2) (startable s3) (startable s4) (startable s5) (startable s6) (startable s7) (startable s8) (startable s9) (startable s10) (startable s11) (startable s12) (startable s13) (startable s14)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)
    (free katherine s0) (free katherine s1) (free katherine s2) (free katherine s3) (free katherine s4) (free katherine s5) (free katherine s6) (free katherine s7) (free katherine s8) (free katherine s9) (free katherine s10) (free katherine s11) (free katherine s12) (free katherine s13) (free katherine s14) (free katherine s15)
    (free nicole s0) (free nicole s1) (free nicole s2) (free nicole s3) (free nicole s4) (free nicole s5) (free nicole s6) (free nicole s7) (free nicole s8) (free nicole s9) (free nicole s10) (free nicole s11) (free nicole s12) (free nicole s13) (free nicole s14) (free nicole s15)
    (free kevin s2) (free kevin s5) (free kevin s13) (free kevin s14)
  )
  (:goal (and (attending katherine s13) (attending nicole s13) (attending kevin s13)))
)