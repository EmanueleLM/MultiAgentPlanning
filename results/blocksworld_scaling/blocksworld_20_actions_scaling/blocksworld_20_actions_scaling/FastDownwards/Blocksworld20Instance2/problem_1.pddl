(define (problem bw-instance-ordered-sequence)
  (:domain blocks-world-order-constrained)

  (:objects
    a b c d e f g h i j - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 - step
  )

  (:init
    ;; Initial block arrangement
    (on a c)
    (on b e)
    (on c d)
    (ontable d)
    (ontable e)
    (ontable f)
    (on g j)
    (on h a)
    (on i f)
    (ontable j)

    ;; Initial clear (top) blocks
    (clear h)
    (clear b)
    (clear i)
    (clear g)

    ;; Hand initially empty
    (handempty)

    ;; Step chaining and allowed moves (encode the exact ordered 20-action sequence)
    (step-done s0)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)
    (next s15 s16) (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20)

    ;; Step 1: unstack(h, a)
    (allowed-unstack s0 h a)
    ;; Step 2: stack(h, b)
    (allowed-stack s1 h b)
    ;; Step 3: unstack(i, f)
    (allowed-unstack s2 i f)
    ;; Step 4: stack(i, a)
    (allowed-stack s3 i a)
    ;; Step 5: unstack(i, a)
    (allowed-unstack s4 i a)
    ;; Step 6: stack(i, h)
    (allowed-stack s5 i h)
    ;; Step 7: unstack(a, c)
    (allowed-unstack s6 a c)
    ;; Step 8: putdown(a)
    (allowed-putdown s7 a)
    ;; Step 9: pickup(a)
    (allowed-pickup s8 a)
    ;; Step 10: stack(a, i)
    (allowed-stack s9 a i)
    ;; Step 11: unstack(c, d)
    (allowed-unstack s10 c d)
    ;; Step 12: stack(c, a)
    (allowed-stack s11 c a)
    ;; Step 13: unstack(g, j)
    (allowed-unstack s12 g j)
    ;; Step 14: stack(g, f)
    (allowed-stack s13 g f)
    ;; Step 15: unstack(c, a)
    (allowed-unstack s14 c a)
    ;; Step 16: stack(c, j)
    (allowed-stack s15 c j)
    ;; Step 17: pickup(d)
    (allowed-pickup s16 d)
    ;; Step 18: putdown(d)
    (allowed-putdown s17 d)
    ;; Step 19: unstack(a, i)
    (allowed-unstack s18 a i)
    ;; Step 20: stack(a, g)
    (allowed-stack s19 a g)
  )

  ;; Goal: verify the ordered 20-step sequence was executed (final step achieved).
  (:goal
    (and
      (step-done s20)
    )
  )
)