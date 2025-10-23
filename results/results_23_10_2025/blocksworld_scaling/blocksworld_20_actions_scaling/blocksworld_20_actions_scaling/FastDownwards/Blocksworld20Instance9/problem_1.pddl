(define (problem blocks-sequence-instance)
  (:domain blocks-world-sequence)
  (:objects
    a b c d e f g h table - block
    robot1 robot2 orchestrator - agent
  )

  (:init
    ;; initial placements (as given)
    (on a c)
    (on c g)
    (on g table)

    (on b table)
    (on f b)

    (on h table)
    (on d h)
    (on e d)

    ;; initial top/clear statuses: top blocks are a, f, e
    (clear a)
    (clear f)
    (clear e)

    ;; agent initial states
    (handempty robot1)
    (handempty robot2)
    (handempty orchestrator)

    ;; initial sequencing predicate
    (step0)
  )

  ;; The goal is to have the full provided ordered sequence executed (step20 reached).
  ;; The goal does NOT explicitly state the final block arrangement; it instead requires completion
  ;; of the ordered action sequence. If the sequence is feasible given the BlocksWorld constraints,
  ;; the final arrangement produced by executing the sequence will be the arrangement reported above.
  (:goal (and (step20)))
)