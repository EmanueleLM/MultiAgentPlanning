(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    arthur michael samantha - person
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )
  (:init
    (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15) (next s15 s16)
    (free arthur s2) (free arthur s3) (free arthur s7) (free arthur s8) (free arthur s9) (free arthur s10) (free arthur s11) (free arthur s12) (free arthur s13) (free arthur s14)
    (free michael s1) (free michael s2) (free michael s3) (free michael s4) (free michael s5) (free michael s6) (free michael s7) (free michael s8) (free michael s10) (free michael s12) (free michael s13) (free michael s14) (free michael s15) (free michael s16)
    (free samantha s1) (free samantha s2) (free samantha s3) (free samantha s5) (free samantha s6) (free samantha s13)
  )
  (:goal (meeting-scheduled s2 s3))
)