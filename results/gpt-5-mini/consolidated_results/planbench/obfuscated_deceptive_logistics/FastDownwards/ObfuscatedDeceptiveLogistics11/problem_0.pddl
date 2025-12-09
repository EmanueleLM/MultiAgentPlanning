(define (problem make-specified-nexts)
  (:domain object-ordering)

  (:objects
    object_6 object_7 object_8 object_9 object_10 object_11 - object
    p1_agent p2_agent - agent
  )

  (:init
    ;; mark all objects initially having no successor and no predecessor
    (succ-free object_6)
    (succ-free object_7)
    (succ-free object_8)
    (succ-free object_9)
    (succ-free object_10)
    (succ-free object_11)

    (pred-free object_6)
    (pred-free object_7)
    (pred-free object_8)
    (pred-free object_9)
    (pred-free object_10)
    (pred-free object_11)

    ;; declare agent identities so actions remain distinct per origin
    (is-p1 p1_agent)
    (is-p2 p2_agent)
  )

  (:goal (and
    ;; mandated terminal relations: they must hold in the final state
    (next object_10 object_8)
    (next object_11 object_7)
    (next object_9  object_6)
  ))
)