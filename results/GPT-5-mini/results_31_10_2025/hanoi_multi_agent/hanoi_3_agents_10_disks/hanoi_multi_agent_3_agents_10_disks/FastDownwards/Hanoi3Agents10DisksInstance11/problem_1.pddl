(define (problem Hanoi3Agents10DisksInstance11-problem)
  (:domain hanoi-3agents-10disks-instance11)
  (:objects
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 - step
    A B C D E F G H I J - disk
    ;; declare disks also as places via type hierarchy (peg/disk are places in domain)
  )
  (:init
    ;; Initial "on" relations (top->bottom left: A,B,C,D,E,F,G,H,I,J)
    ;; using on(disk, support) where support is either peg or disk immediately below
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

    ;; initial control step
    (at-step s0)
  )

  (:goal (and
    ;; Goal configuration matches: left top->bottom A,B,F,G,H,I,J; middle top->bottom C,E; right top->bottom D
    ;; encode as the immediate-support "on" relations that represent that stacking:
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