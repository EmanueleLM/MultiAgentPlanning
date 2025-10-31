(define (problem Blocksworld10Instance11)
  (:domain blocks)
  (:objects a b c d e f g h - block)
  (:init
    ;; initial on-stack relations
    (on a g)
    (on d a)
    (on f e)
    (on g c)
    (on c h)
    (on h b)

    ;; initial table positions
    (ontable b)
    (ontable e)

    ;; clear blocks (tops of stacks)
    (clear d)
    (clear f)

    ;; single hand (no block held at start)
    (handempty)
  )
  (:goal
    (and
      ;; Final arrangement (as computed)
      (on a f)
      (on e a)
      (on d e)
      (ontable f)
      (on g c)
      (on c h)
      (on h b)
      (ontable b)
    )
  )
)