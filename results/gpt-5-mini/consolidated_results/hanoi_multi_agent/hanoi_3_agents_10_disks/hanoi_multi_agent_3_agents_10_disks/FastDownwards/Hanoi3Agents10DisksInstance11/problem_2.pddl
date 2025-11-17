(define (problem Hanoi3Agents10DisksInstance11-problem)
  (:domain hanoi-3agents-10disks-instance11)
  (:objects
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 - step
    A B C D E F G H I J - disk
  )
  (:init
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)
    (at-step s0)
  )
  (:goal (and
    (on A B)
    (on B F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)
    (on C E)
    (on E middle)
    (on D right)
  ))
)