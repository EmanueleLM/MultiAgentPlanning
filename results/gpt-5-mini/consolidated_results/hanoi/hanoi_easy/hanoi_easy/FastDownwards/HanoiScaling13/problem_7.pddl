(define (problem hanoi-4-disks)
  (:domain hanoi)

  (:objects
    left middle right - peg
    d1 d2 d3 d4 - disk
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - step
  )

  (:init
    ;; size ordering (smallest d1 ... largest d4)
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d1 d4)
    (smaller d2 d3)
    (smaller d2 d4)
    (smaller d3 d4)

    ;; initial stacking on the right peg: bottom d4 on peg, d3 on d4, d2 on d3, d1 on d2
    (on-peg d4 right)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ;; clearance: only the topmost disk is clear; left and middle pegs are empty (clear)
    (clear-peg left)
    (clear-peg middle)
    (clear-disk d1)

    ;; step sequencing objects and initial step
    (step-successor s1 s2)
    (step-successor s2 s3)
    (step-successor s3 s4)
    (step-successor s4 s5)
    (step-successor s5 s6)
    (step-successor s6 s7)
    (step-successor s7 s8)
    (step-successor s8 s9)
    (step-successor s9 s10)
    (step-successor s10 s11)
    (step-successor s11 s12)
    (step-successor s12 s13)
    (step-successor s13 s14)
    (step-successor s14 s15)
    (last-step s15)

    (current-step s1)

    ;; required moves for each step (these fully determine the legal move at each step).
    ;; Steps enumerate a correct 15-move solution that moves the stack from right to middle
    ;; using left as intermediate, ending with left and right pegs empty and middle holding all disks.

    (required-disk s1 d1)
    (required-from-disk s1 d2)
    (required-to-peg s1 left)

    (required-disk s2 d2)
    (required-from-disk s2 d3)
    (required-to-peg s2 middle)

    (required-disk s3 d1)
    (required-from-peg s3 left)
    (required-to-disk s3 d2)

    (required-disk s4 d3)
    (required-from-disk s4 d4)
    (required-to-peg s4 left)

    (required-disk s5 d1)
    (required-from-disk s5 d2)
    (required-to-disk s5 d4)

    (required-disk s6 d2)
    (required-from-peg s6 middle)
    (required-to-disk s6 d3)

    (required-disk s7 d1)
    (required-from-disk s7 d4)
    (required-to-disk s7 d2)

    (required-disk s8 d4)
    (required-from-peg s8 right)
    (required-to-peg s8 middle)

    (required-disk s9 d1)
    (required-from-disk s9 d2)
    (required-to-disk s9 d4)

    (required-disk s10 d2)
    (required-from-disk s10 d3)
    (required-to-peg s10 right)

    (required-disk s11 d1)
    (required-from-disk s11 d4)
    (required-to-disk s11 d2)

    (required-disk s12 d3)
    (required-from-peg s12 left)
    (required-to-disk s12 d4)

    (required-disk s13 d1)
    (required-from-disk s13 d2)
    (required-to-peg s13 left)

    (required-disk s14 d2)
    (required-from-peg s14 right)
    (required-to-disk s14 d3)

    (required-disk s15 d1)
    (required-from-peg s15 left)
    (required-to-disk s15 d2)

    ;; distinctness facts (helpers since PDDL equality is not used in preconditions)
    (distinct-pp left middle) (distinct-pp left right) (distinct-pp middle left)
    (distinct-pp middle right) (distinct-pp right left) (distinct-pp right middle)

    (distinct-pd left d1) (distinct-pd left d2) (distinct-pd left d3) (distinct-pd left d4)
    (distinct-pd middle d1) (distinct-pd middle d2) (distinct-pd middle d3) (distinct-pd middle d4)
    (distinct-pd right d1) (distinct-pd right d2) (distinct-pd right d3) (distinct-pd right d4)

    (distinct-dp d1 left) (distinct-dp d1 middle) (distinct-dp d1 right)
    (distinct-dp d2 left) (distinct-dp d2 middle) (distinct-dp d2 right)
    (distinct-dp d3 left) (distinct-dp d3 middle) (distinct-dp d3 right)
    (distinct-dp d4 left) (distinct-dp d4 middle) (distinct-dp d4 right)

    (distinct-dd d1 d2) (distinct-dd d1 d3) (distinct-dd d1 d4)
    (distinct-dd d2 d1) (distinct-dd d2 d3) (distinct-dd d2 d4)
    (distinct-dd d3 d1) (distinct-dd d3 d2) (distinct-dd d3 d4)
    (distinct-dd d4 d1) (distinct-dd d4 d2) (distinct-dd d4 d3)
  )

  (:goal
    (and
      ;; final stack on middle peg: bottom d4 on peg, then d3 on d4, d2 on d3, d1 on d2
      (on-peg d4 middle)
      (on-disk d3 d4)
      (on-disk d2 d3)
      (on-disk d1 d2)

      ;; left and right pegs must be empty (clear)
      (clear-peg left)
      (clear-peg right)
    )
  )
)