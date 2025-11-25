(define (problem hanoi-4-3pegs-problem)
  (:domain hanoi-4disks-3pegs)

  (:objects
    a b c d - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    (on a b)
    (on b c)
    (on c d)
    (on d middle)

    (clear a)
    (clear left)
    (clear right)

    (smaller a b) (smaller a c) (smaller a d)
    (smaller b c) (smaller b d)
    (smaller c d)

    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15)

    (current s0)
  )

  (:goal (and
    (on a b)
    (on b c)
    (on c d)
    (on d right)
    (clear left)
    (clear middle)
    (current s15)
  ))
)