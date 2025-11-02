(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    kathryn charlotte lauren - person
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )
  (:init
    (is-slot s0) (is-slot s1) (is-slot s2) (is-slot s3) (is-slot s4) (is-slot s5) (is-slot s6) (is-slot s7)
    (is-slot s8) (is-slot s9) (is-slot s10) (is-slot s11) (is-slot s12) (is-slot s13) (is-slot s14) (is-slot s15)
    (within-cutoff s0) (within-cutoff s1) (within-cutoff s2) (within-cutoff s3) (within-cutoff s4)
    (within-cutoff s5) (within-cutoff s6) (within-cutoff s7) (within-cutoff s8) (within-cutoff s9)
    (available kathryn s1) (available kathryn s2) (available kathryn s4) (available kathryn s6)
    (available kathryn s7) (available kathryn s8) (available kathryn s11) (available kathryn s12)
    (available kathryn s13) (available kathryn s14)
    (available charlotte s0) (available charlotte s1) (available charlotte s2) (available charlotte s3)
    (available charlotte s4) (available charlotte s5) (available charlotte s7) (available charlotte s8)
    (available charlotte s9) (available charlotte s10) (available charlotte s11) (available charlotte s12)
    (available charlotte s13) (available charlotte s15)
    (available lauren s2) (available lauren s3) (available lauren s4) (available lauren s5)
    (available lauren s7) (available lauren s8) (available lauren s11) (available lauren s14)
  )
  (:goal (scheduled))
)