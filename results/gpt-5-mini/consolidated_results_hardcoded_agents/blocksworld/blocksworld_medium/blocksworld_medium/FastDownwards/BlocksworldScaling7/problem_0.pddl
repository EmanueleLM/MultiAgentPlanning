(define (problem build-tower)
  (:domain multi-agent-blocks)
  (:objects
    a b c - block
    picker stacker - agent
  )

  (:init
    ;; Initial locations: all blocks start on the table and are clear.
    (ontable a)
    (ontable b)
    (ontable c)

    (clear a)
    (clear b)
    (clear c)

    ;; Both agents start with empty hands.
    (handempty picker)
    (handempty stacker)
  )

  ;; Goal: form a tower with b on a and c on b; a remains on the table.
  ;; Also require both agents end with empty hands and the top block clear.
  (:goal (and
    (on b a)
    (on c b)
    (ontable a)
    (handempty picker)
    (handempty stacker)
    (clear c)
  ))
)