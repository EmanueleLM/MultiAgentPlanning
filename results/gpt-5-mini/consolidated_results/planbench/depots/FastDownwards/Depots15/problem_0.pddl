(define (problem adjacency-problem-goal1)
  (:domain adjacency-domain)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 - obj
  )
  (:init
    ;; Roles and relations (initial state for goal variant 1)
    (hand object_0)
    (cats object_1)
    (texture object_5)

    ;; adjacency relations required for sip
    (next object_0 object_5)
    (next object_1 object_5)

    ;; Leave other predicates false / unspecified
  )
  (:goal
    (and
      ;; Goal variant 1: produce a vase relation between object_0 (hand) and object_1 (cats)
      (vase object_0 object_1)
    )
  )
)