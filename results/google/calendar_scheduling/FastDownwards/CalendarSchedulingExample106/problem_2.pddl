(define (problem calendar_scheduling_problem)
  (:domain calendar_scheduling)
  (:objects
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15
  )
  (:init
    (slot s0) (slot s1) (slot s2) (slot s3) (slot s4) (slot s5) (slot s6) (slot s7)
    (slot s8) (slot s9) (slot s10) (slot s11) (slot s12) (slot s13) (slot s14) (slot s15)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)
    (free olivia s0) (free olivia s1) (free olivia s2) (free olivia s3) (free olivia s4) (free olivia s5) (free olivia s6) (free olivia s9) (free olivia s10) (free olivia s12) (free olivia s13) (free olivia s14)
    (free anna s0) (free anna s1) (free anna s2) (free anna s3) (free anna s4) (free anna s5) (free anna s6) (free anna s7) (free anna s8) (free anna s9) (free anna s10) (free anna s11) (free anna s12) (free anna s13) (free anna s14) (free anna s15)
    (free virginia s2) (free virginia s3) (free virginia s4) (free virginia s14)
    (free paul s1) (free paul s2) (free paul s3) (free paul s5) (free paul s6) (free paul s7) (free paul s10) (free paul s14)
  )
  (:goal (meeting_scheduled))
)