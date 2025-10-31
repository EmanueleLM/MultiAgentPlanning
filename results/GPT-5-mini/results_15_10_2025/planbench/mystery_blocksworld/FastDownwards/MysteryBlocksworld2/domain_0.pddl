(define (domain multiagent-domain)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
  )

  ;; Action: paltry
  ;; Preconditions:
  ;;   hand object_0
  ;;   cats object_1
  ;;   texture object_2
  ;;   vase object_0 object_1
  ;;   next object_1 object_2
  ;; Effects:
  ;;   add next object_0 object_2
  ;;   delete vase object_0 object_1
  (:action paltry
    :parameters ()
    :precondition (and
      (hand object_0)
      (cats object_1)
      (texture object_2)
      (vase object_0 object_1)
      (next object_1 object_2)
    )
    :effect (and
      (next object_0 object_2)
      (not (vase object_0 object_1))
    )
  )

  ;; Action: sip
  ;; Preconditions:
  ;;   hand object_0
  ;;   cats object_1
  ;;   texture object_2
  ;;   next object_0 object_2
  ;;   next object_1 object_2
  ;; Effects:
  ;;   add vase object_0 object_1
  ;;   delete next object_0 object_2
  (:action sip
    :parameters ()
    :precondition (and
      (hand object_0)
      (cats object_1)
      (texture object_2)
      (next object_0 object_2)
      (next object_1 object_2)
    )
    :effect (and
      (vase object_0 object_1)
      (not (next object_0 object_2))
    )
  )

  ;; Action: clip
  ;; Preconditions:
  ;;   hand object_0
  ;;   sneeze object_1
  ;;   texture object_2
  ;;   next object_1 object_2
  ;;   next object_0 object_2
  ;; Effects:
  ;;   add vase object_0 object_1
  ;;   delete next object_0 object_2
  (:action clip
    :parameters ()
    :precondition (and
      (hand object_0)
      (sneeze object_1)
      (texture object_2)
      (next object_1 object_2)
      (next object_0 object_2)
    )
    :effect (and
      (vase object_0 object_1)
      (not (next object_0 object_2))
    )
  )

  ;; Action: wretched
  ;; Preconditions:
  ;;   sneeze object_0
  ;;   texture object_1
  ;;   texture object_2
  ;;   stupendous object_3
  ;;   next object_0 object_1
  ;;   collect object_1 object_3
  ;;   collect object_2 object_3
  ;; Effects:
  ;;   add next object_0 object_2
  ;;   delete next object_0 object_1
  (:action wretched
    :parameters ()
    :precondition (and
      (sneeze object_0)
      (texture object_1)
      (texture object_2)
      (stupendous object_3)
      (next object_0 object_1)
      (collect object_1 object_3)
      (collect object_2 object_3)
    )
    :effect (and
      (next object_0 object_2)
      (not (next object_0 object_1))
    )
  )

  ;; Action: memory
  ;; Preconditions:
  ;;   cats object_0
  ;;   spring object_1
  ;;   spring object_2
  ;;   next object_0 object_1
  ;; Effects:
  ;;   add next object_0 object_2
  ;;   delete next object_0 object_1
  (:action memory
    :parameters ()
    :precondition (and
      (cats object_0)
      (spring object_1)
      (spring object_2)
      (next object_0 object_1)
    )
    :effect (and
      (next object_0 object_2)
      (not (next object_0 object_1))
    )
  )

  ;; Action: tightfisted
  ;; Preconditions:
  ;;   hand object_0
  ;;   sneeze object_1
  ;;   texture object_2
  ;;   next object_1 object_2
  ;;   vase object_0 object_1
  ;; Effects:
  ;;   add next object_0 object_2
  ;;   delete vase object_0 object_1
  (:action tightfisted
    :parameters ()
    :precondition (and
      (hand object_0)
      (sneeze object_1)
      (texture object_2)
      (next object_1 object_2)
      (vase object_0 object_1)
    )
    :effect (and
      (next object_0 object_2)
      (not (vase object_0 object_1))
    )
  )

)