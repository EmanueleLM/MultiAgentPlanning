(define (problem Blocksworld40Instance1_problem)
  (:domain blocksworld40)
  (:objects
     a b c d e f g h i - block
  )

  (:init
    ;; initial on relationships
    (on a d)
    (on b f)
    (on c h)
    (on d i)
    (on e g)
    (on g a)
    (on i c)

    ;; on-table blocks initially
    (ontable f)
    (ontable h)

    ;; initial clear blocks (tops of stacks)
    (clear e)
    (clear b)

    ;; initially hand is empty
    (handempty)
  )

  (:goal (and
    ;; final on relationships
    (on b e)
    (on e g)
    (on g a)
    (on a d)
    (on d i)
    (on i c)
    (on c h)

    ;; final on-table blocks
    (ontable f)
    (ontable h)

    ;; ensure planner ends with empty hand
    (handempty)
  ))
)