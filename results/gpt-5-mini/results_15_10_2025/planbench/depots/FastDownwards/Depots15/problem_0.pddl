(define (problem manipulation-problem-goal1)
  (:domain manipulation-domain)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 - object
  )

  ; Initial state:
  ; The following initial facts are provided here to make the domain executable.
  ; These initial facts were constructed from the actions' required predicates
  ; to form a consistent initial state for the first goal variant:
  ; - actor has hand on object_0
  ; - cats on object_1
  ; - texture on object_2
  ; - a vase relation exists between object_0 and object_1
  ; - next relation exists from object_1 to object_2
  (:init
    (hand object_0)
    (cats object_1)
    (texture object_2)
    (vase object_0 object_1)
    (next object_1 object_2)
  )

  ; Goal variant 1:
  ; Achieve next object_0 object_2 (paltry or tightfisted/memory/wretched could produce this,
  ; but given the initial facts paltry is directly applicable).
  (:goal (and
    (next object_0 object_2)
  ))
)