(define (problem variant-1)
  (:domain object-relations)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 - obj
  )
  (:init
    ;; Facts chosen to enable paltry actions that produce the required next facts.
    ;; For goal next object_11 object_7:
    (hand object_11)
    (cats object_0)
    (texture object_7)
    (vase object_11 object_0)
    (next object_0 object_7)

    ;; For goal next object_12 object_5:
    (hand object_12)
    (cats object_1)
    (texture object_5)
    (vase object_12 object_1)
    (next object_1 object_5)

    ;; All other predicates are false / absent by default (closed world).
  )
  (:goal (and
    (next object_11 object_7)
    (next object_12 object_5)
  ))
)