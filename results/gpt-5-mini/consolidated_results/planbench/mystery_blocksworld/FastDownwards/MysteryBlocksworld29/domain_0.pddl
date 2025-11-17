(define (domain orchestrator)
  :requirements :strips :typing
  :types object
  :predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)
    (sneeze ?o - object)
    (stupendous ?o - object)
    (collect ?o - object)
    (spring ?o - object)

  ;; The actions below implement the parametric pattern provided.
  ;; For all actions we resolve the ambiguous placeholders consistently:
  ;;   UNSPECIFIED_UNARY_1  -> cats
  ;;   UNSPECIFIED_UNARY_2  -> texture
  ;;   UNSPECIFIED_BINARY_A -> vase
  ;;   UNSPECIFIED_BINARY_B -> next
  ;; Each action requires:
  ;;   (hand ?object_0) (cats ?object_1) (texture ?object_2) (vase ?object_0 ?object_1) (next ?object_1 ?object_2)
  ;; Effects:
  ;;   delete (vase ?object_0 ?object_1)
  ;;   add    (next ?object_0 ?object_2)

  (:action paltry
    :parameters (?object_0 - object ?object_1 - object ?object_2 - object)
    :precondition (and
                    (hand ?object_0)
                    (cats ?object_1)
                    (texture ?object_2)
                    (vase ?object_0 ?object_1)
                    (next ?object_1 ?object_2)
                  )
    :effect (and
              (not (vase ?object_0 ?object_1))
              (next ?object_0 ?object_2)
            )
  )

  (:action sip
    :parameters (?object_0 - object ?object_1 - object ?object_2 - object)
    :precondition (and
                    (hand ?object_0)
                    (cats ?object_1)
                    (texture ?object_2)
                    (vase ?object_0 ?object_1)
                    (next ?object_1 ?object_2)
                  )
    :effect (and
              (not (vase ?object_0 ?object_1))
              (next ?object_0 ?object_2)
            )
  )

  (:action clip
    :parameters (?object_0 - object ?object_1 - object ?object_2 - object)
    :precondition (and
                    (hand ?object_0)
                    (cats ?object_1)
                    (texture ?object_2)
                    (vase ?object_0 ?object_1)
                    (next ?object_1 ?object_2)
                  )
    :effect (and
              (not (vase ?object_0 ?object_1))
              (next ?object_0 ?object_2)
            )
  )

  (:action wretched
    :parameters (?object_0 - object ?object_1 - object ?object_2 - object)
    :precondition (and
                    (hand ?object_0)
                    (cats ?object_1)
                    (texture ?object_2)
                    (vase ?object_0 ?object_1)
                    (next ?object_1 ?object_2)
                  )
    :effect (and
              (not (vase ?object_0 ?object_1))
              (next ?object_0 ?object_2)
            )
  )

  (:action memory
    :parameters (?object_0 - object ?object_1 - object ?object_2 - object)
    :precondition (and
                    (hand ?object_0)
                    (cats ?object_1)
                    (texture ?object_2)
                    (vase ?object_0 ?object_1)
                    (next ?object_1 ?object_2)
                  )
    :effect (and
              (not (vase ?object_0 ?object_1))
              (next ?object_0 ?object_2)
            )
  )

  (:action tightfisted
    :parameters (?object_0 - object ?object_1 - object ?object_2 - object)
    :precondition (and
                    (hand ?object_0)
                    (cats ?object_1)
                    (texture ?object_2)
                    (vase ?object_0 ?object_1)
                    (next ?object_1 ?object_2)
                  )
    :effect (and
              (not (vase ?object_0 ?object_1))
              (next ?object_0 ?object_2)
            )
  )

)