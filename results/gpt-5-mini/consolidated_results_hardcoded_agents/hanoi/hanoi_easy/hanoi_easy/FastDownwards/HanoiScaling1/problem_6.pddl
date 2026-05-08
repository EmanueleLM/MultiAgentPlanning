(define (problem hanoi3_staged_problem)
  (:domain hanoi3_staged)
  (:objects
    diska diskb diskc diskd - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )
  (:init
    ;; size ordering: diska smallest, diskd largest (explicit pairwise relations)
    (smaller diska diskb)
    (smaller diska diskc)
    (smaller diska diskd)
    (smaller diskb diskc)
    (smaller diskb diskd)
    (smaller diskc diskd)

    ;; initial stack on right: top->bottom: diska diskb diskc diskd
    (on-disk diska diskb)
    (on-disk diskb diskc)
    (on-disk diskc diskd)
    (on-peg diskd right)

    ;; topmost disk and empty pegs
    (top diska right)
    (empty left)
    (empty middle)

    ;; stage ordering: exactly 15 moves available from s0 to s15
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)

    ;; start stage
    (current s0)
  )

  (:goal (and
    ;; goal: all disks stacked on left in same order top->bottom diska diskb diskc diskd
    (on-disk diska diskb)
    (on-disk diskb diskc)
    (on-disk diskc diskd)
    (on-peg diskd left)
    (top diska left)
    ;; intermediates must be empty at the end
    (empty middle)
    (empty right)
    ;; final stage must be reached exactly
    (current s15)
  ))
)