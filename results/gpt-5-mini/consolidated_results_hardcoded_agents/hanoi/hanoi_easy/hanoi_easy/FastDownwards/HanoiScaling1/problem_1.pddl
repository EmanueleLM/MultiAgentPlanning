(define (problem hanoi3_staged_problem)
  (:domain hanoi3_staged)
  (:objects
    diskA diskB diskC diskD - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )
  (:init
    ;; size ordering (strict)
    (smaller diskA diskB)
    (smaller diskA diskC)
    (smaller diskA diskD)
    (smaller diskB diskC)
    (smaller diskB diskD)
    (smaller diskC diskD)

    ;; initial stacking on right: D bottom (on-peg), C on D, B on C, A on B (A top)
    (on-peg diskD right)
    (on-disk diskC diskD)
    (on-disk diskB diskC)
    (on-disk diskA diskB)

    ;; top and emptiness initial facts
    (top diskA right)
    (empty left)
    (empty middle)
    ;; right is not empty (omitted as a fact)

    ;; staging successor chain (explicit discrete steps)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)

    ;; initial current stage: start at s0. With 4 disks the minimal required moves is 15, so goal will require s15.
    (current s0)
  )

  (:goal (and
    ;; final stacking on left: D bottom (on-peg), C on D, B on C, A on B (A top)
    (on-peg diskD left)
    (on-disk diskC diskD)
    (on-disk diskB diskC)
    (on-disk diskA diskB)
    (top diskA left)

    ;; middle and right must be empty
    (empty middle)
    (empty right)

    ;; final stage reached after exactly 15 moves
    (current s15)
  ))
)