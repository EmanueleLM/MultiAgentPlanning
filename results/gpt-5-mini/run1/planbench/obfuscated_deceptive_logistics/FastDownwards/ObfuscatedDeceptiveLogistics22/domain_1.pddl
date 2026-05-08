(define (domain orchestrator-domain)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?h - obj ?c - obj)
    (next ?a - obj ?b - obj)
    (sneeze ?o - obj)
    (collect ?a - obj ?b - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    ;; step-order bookkeeping predicates
    (done-step0)
    (done-step1)
    (done-step2)
    (done-step3)
    (done-step4)
    (done-step5)
    (done-step6)
    (done-step7)
  )

  ;; Step 1: clip(object_12, object_4, object_10)
  (:action step1-clip-object12-object4-object10
    :parameters ()
    :precondition (and
      (hand object_12)
      (sneeze object_4)
      (texture object_10)
      (next object_4 object_10)
      (next object_12 object_10)
      (done-step0)
    )
    :effect (and
      (vase object_12 object_4)
      (not (next object_12 object_10))
      (done-step1)
    )
  )

  ;; Step 2: wretched(object_4, object_10, object_8, object_2)
  (:action step2-wretched-object4-10-8-2
    :parameters ()
    :precondition (and
      (sneeze object_4)
      (texture object_10)
      (texture object_8)
      (stupendous object_2)
      (next object_4 object_10)
      (collect object_10 object_2)
      (collect object_8 object_2)
      (done-step1)
    )
    :effect (and
      (next object_4 object_8)
      (not (next object_4 object_10))
      (done-step2)
    )
  )

  ;; Step 3: tightfisted(object_12, object_4, object_8)
  (:action step3-tightfisted-object12-4-8
    :parameters ()
    :precondition (and
      (hand object_12)
      (sneeze object_4)
      (texture object_8)
      (next object_4 object_8)
      (vase object_12 object_4)
      (done-step2)
    )
    :effect (and
      (next object_12 object_8)
      (not (vase object_12 object_4))
      (done-step3)
    )
  )

  ;; Step 4: wretched(object_3, object_7, object_6, object_1)
  (:action step4-wretched-object3-7-6-1
    :parameters ()
    :precondition (and
      (sneeze object_3)
      (texture object_7)
      (texture object_6)
      (stupendous object_1)
      (next object_3 object_7)
      (collect object_7 object_1)
      (collect object_6 object_1)
      (done-step3)
    )
    :effect (and
      (next object_3 object_6)
      (not (next object_3 object_7))
      (done-step4)
    )
  )

  ;; Step 5: clip(object_11, object_3, object_6)
  (:action step5-clip-object11-object3-object6
    :parameters ()
    :precondition (and
      (hand object_11)
      (sneeze object_3)
      (texture object_6)
      (next object_3 object_6)
      (next object_11 object_6)
      (done-step4)
    )
    :effect (and
      (vase object_11 object_3)
      (not (next object_11 object_6))
      (done-step5)
    )
  )

  ;; Step 6: wretched(object_3, object_6, object_7, object_1)
  (:action step6-wretched-object3-6-7-1
    :parameters ()
    :precondition (and
      (sneeze object_3)
      (texture object_6)
      (texture object_7)
      (stupendous object_1)
      (next object_3 object_6)
      (collect object_6 object_1)
      (collect object_7 object_1)
      (done-step5)
    )
    :effect (and
      (next object_3 object_7)
      (not (next object_3 object_6))
      (done-step6)
    )
  )

  ;; Step 7: tightfisted(object_11, object_3, object_7)
  (:action step7-tightfisted-object11-3-7
    :parameters ()
    :precondition (and
      (hand object_11)
      (sneeze object_3)
      (texture object_7)
      (next object_3 object_7)
      (vase object_11 object_3)
      (done-step6)
    )
    :effect (and
      (next object_11 object_7)
      (not (vase object_11 object_3))
      (done-step7)
    )
  )

)