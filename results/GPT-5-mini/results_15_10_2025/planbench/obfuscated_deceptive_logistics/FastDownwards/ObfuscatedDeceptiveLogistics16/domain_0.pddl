(define (domain observer_reasoner_domain)
  (:requirements :strips)
  (:predicates
    (hand ?x)
    (cats ?x)
    (texture ?x)
    (vase ?x)
    (next ?x ?y)
    (sneeze ?x)
    (stupendous ?x)
    (collect ?x)
    (spring ?x)
  )

  ;; Action schemas are present but no grounded preconditions/effects
  ;; were provided in the inputs. To avoid inventing semantics, each
  ;; action is left with empty preconditions and empty effects.
  (:action paltry
    :parameters ()
    :precondition (and)
    :effect (and)
  )

  (:action sip
    :parameters ()
    :precondition (and)
    :effect (and)
  )

  (:action clip
    :parameters ()
    :precondition (and)
    :effect (and)
  )

  (:action wretched
    :parameters ()
    :precondition (and)
    :effect (and)
  )

  (:action memory
    :parameters ()
    :precondition (and)
    :effect (and)
  )

  (:action tightfisted
    :parameters ()
    :precondition (and)
    :effect (and)
  )
)