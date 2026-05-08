(define (domain orchestrated-domain)
  (:requirements :strips)
  (:predicates
    (cats ?o)
    (collect ?o1 ?o2)
    (hand ?o)
    (next ?o1 ?o2)
    (sneeze ?o)
    (spring ?o)
    (stupendous ?o)
    (texture ?o)
    (vase ?o1 ?o2)
    (stage ?s)
  )

  ;; Subplan for next object_11 object_7
  (:action do-wretched-3-7-6
    :precondition (and
      (sneeze object_3)
      (texture object_7)
      (texture object_6)
      (stupendous object_1)
      (next object_3 object_7)
      (collect object_7 object_1)
      (collect object_6 object_1)
      (stage step1)
    )
    :effect (and
      (not (next object_3 object_7))
      (next object_3 object_6)
      (not (stage step1))
      (stage step2)
    )
  )

  (:action do-clip-11-3-6
    :precondition (and
      (hand object_11)
      (sneeze object_3)
      (texture object_6)
      (next object_3 object_6)
      (next object_11 object_6)
      (stage step2)
    )
    :effect (and
      (vase object_11 object_3)
      (not (next object_11 object_6))
      (not (stage step2))
      (stage step3)
    )
  )

  (:action do-wretched-3-6-7
    :precondition (and
      (sneeze object_3)
      (texture object_6)
      (texture object_7)
      (stupendous object_1)
      (next object_3 object_6)
      (collect object_6 object_1)
      (collect object_7 object_1)
      (stage step3)
    )
    :effect (and
      (not (next object_3 object_6))
      (next object_3 object_7)
      (not (stage step3))
      (stage step4)
    )
  )

  (:action do-tightfisted-11-3-7
    :precondition (and
      (hand object_11)
      (sneeze object_3)
      (texture object_7)
      (next object_3 object_7)
      (vase object_11 object_3)
      (stage step4)
    )
    :effect (and
      (next object_11 object_7)
      (not (vase object_11 object_3))
      (not (stage step4))
      (stage step5)
    )
  )

  ;; Subplan for next object_12 object_8
  (:action do-clip-12-4-10
    :precondition (and
      (hand object_12)
      (sneeze object_4)
      (texture object_10)
      (next object_4 object_10)
      (next object_12 object_10)
      (stage step5)
    )
    :effect (and
      (vase object_12 object_4)
      (not (next object_12 object_10))
      (not (stage step5))
      (stage step6)
    )
  )

  (:action do-wretched-4-10-8
    :precondition (and
      (sneeze object_4)
      (texture object_10)
      (texture object_8)
      (stupendous object_2)
      (next object_4 object_10)
      (collect object_10 object_2)
      (collect object_8 object_2)
      (stage step6)
    )
    :effect (and
      (not (next object_4 object_10))
      (next object_4 object_8)
      (not (stage step6))
      (stage step7)
    )
  )

  (:action do-tightfisted-12-4-8
    :precondition (and
      (hand object_12)
      (sneeze object_4)
      (texture object_8)
      (next object_4 object_8)
      (vase object_12 object_4)
      (stage step7)
    )
    :effect (and
      (next object_12 object_8)
      (not (vase object_12 object_4))
      (not (stage step7))
      (stage step8)
    )
  )
)