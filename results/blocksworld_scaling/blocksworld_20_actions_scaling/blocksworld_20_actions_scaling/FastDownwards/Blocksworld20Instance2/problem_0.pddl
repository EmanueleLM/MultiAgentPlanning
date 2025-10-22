; Problem: BlocksWorld instance — initial state as public info; goal is final arrangement after executing actions 1..20 in order.
; Agent contributions kept distinct above in the domain comments.

(define (problem bw-instance-finalstate)
  (:domain blocks-world-multiagent)

  (:objects
    a b c d e f g h i j - block
  )

  (:init
    ; initial arrangement (public information)
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

    ; clear (top) blocks in the initial configuration
    (clear h)
    (clear b)
    (clear i)
    (clear g)

    ; robot hand initial state
    (handempty)
  )

  ; Goal: final arrangement after applying the full ordered sequence of 20 actions (actions 1..20),
  ; re-evaluated and applied to the evolving state (agent1 then agent2).
  (:goal
    (and
      ; Stack on F: F is on table, G on F, A on G
      (ontable f)
      (on g f)
      (on a g)

      ; Stack on J: J on table, C on J
      (ontable j)
      (on c j)

      ; Stack on E: E on table, B on E, H on B, I on H
      (ontable e)
      (on b e)
      (on h b)
      (on i h)

      ; D remains on the table
      (ontable d)
    )
  )
)