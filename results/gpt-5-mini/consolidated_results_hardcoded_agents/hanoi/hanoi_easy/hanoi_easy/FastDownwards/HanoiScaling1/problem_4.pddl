(define (problem hanoi3_staged_problem)
  (:domain hanoi3_staged)
  (:objects
    diskA diskB diskC diskD - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )
  (:init
    ;; size ordering: diskA smallest, diskD largest
    (smaller diskA diskB)
    (smaller diskA diskC)
    (smaller diskA diskD)
    (smaller diskB diskC)
    (smaller diskB diskD)
    (smaller diskC diskD)

    ;; initial stack on right: top->bottom: A B C D
    (on-disk diskA diskB)
    (on-disk diskB diskC)
    (on-disk diskC diskD)
    (on-peg diskD right)

    ;; topmost disks and empty pegs
    (top diskA right)
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
    ;; goal: all disks stacked on left in same order top->bottom A B C D
    (on-disk diskA diskB)
    (on-disk diskB diskC)
    (on-disk diskC diskD)
    (on-peg diskD left)
    (top diskA left)
    ;; intermediates must be empty at the end
    (empty middle)
    (empty right)
    ;; final stage
    (current s15)
  ))
)