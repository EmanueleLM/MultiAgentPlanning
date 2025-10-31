(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )
  (:init
    ;; next relations (consecutive 30-min segments)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)

    ;; Available segments for arthur (excluded: s0, s3, s4, s5, s14, s15)
    (available-arthur s1) (available-arthur s2) (available-arthur s6)
    (available-arthur s7) (available-arthur s8) (available-arthur s9)
    (available-arthur s10) (available-arthur s11) (available-arthur s12)
    (available-arthur s13)

    ;; Available segments for michael (excluded: s8, s10)
    (available-michael s0) (available-michael s1) (available-michael s2)
    (available-michael s3) (available-michael s4) (available-michael s5)
    (available-michael s6) (available-michael s7) (available-michael s9)
    (available-michael s11) (available-michael s12) (available-michael s13)
    (available-michael s14) (available-michael s15)

    ;; Available segments for samantha (excluded: s3, s6, s7, s8, s9, s10, s11, s13, s14, s15)
    (available-samantha s0) (available-samantha s1) (available-samantha s2)
    (available-samantha s4) (available-samantha s5) (available-samantha s12)
  )
  (:goal (meeting-scheduled))
)