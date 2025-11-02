(define (problem blocks-sequence-instance)
  (:domain blocks-world-sequenced)
  (:objects
    a b c d e f g h - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15
    s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 - step
  )

  (:init
    ; initial stacks (top to bottom):
    ; stack1: C on E on A on G
    (on c e)
    (on e a)
    (on a g)

    ; stack2: B on H on F
    (on b h)
    (on h f)

    ; stack3: D on table
    (ontable d)

    ; table supports / bottom blocks
    (ontable f)
    (ontable g)

    ; initially clear/top blocks
    (clear c)
    (clear b)
    (clear d)

    ; hand starts empty and starting step
    (handempty)
    (at-step s0)
  )

  ; Goal: require execution to reach step s30 (i.e., the full ordered action sequence must be executed).
  ; The final arrangement is not explicitly asserted in the goal; it will result from the successful execution
  ; of the enforced action sequence.
  (:goal (and (at-step s30)))
)