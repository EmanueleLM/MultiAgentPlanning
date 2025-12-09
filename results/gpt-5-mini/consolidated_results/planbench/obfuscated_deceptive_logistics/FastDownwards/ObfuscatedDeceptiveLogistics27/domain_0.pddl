(define (domain orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj)
  )

  ;; Orchestrator-prefixed actions: semantics follow the user-specified schemas.
  ;; Each action includes explicit inequality constraints where the original
  ;; textual model implied distinct roles to avoid accidental self-binding.

  (:action orchestrator-paltry
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?a ?b)
      (next ?b ?c)
      (not (= ?a ?b))
      (not (= ?b ?c))
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
    )
  )

  (:action orchestrator-sip
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (next ?a ?c)
      (next ?b ?c)
      (not (= ?a ?b))
      (not (= ?a ?c))
      (not (= ?b ?c))
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
    )
  )

  (:action orchestrator-clip
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (next ?a ?c)
      (not (= ?a ?b))
      (not (= ?a ?c))
      (not (= ?b ?c))
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
    )
  )

  (:action orchestrator-wretched
    :parameters (?sneeze - obj ?tfrom - obj ?tto - obj ?collector - obj)
    :precondition (and
      (sneeze ?sneeze)
      (texture ?tfrom)
      (texture ?tto)
      (stupendous ?collector)
      (next ?sneeze ?tfrom)
      (collect ?tfrom ?collector)
      (collect ?tto ?collector)
      ;; require texture endpoints be distinct and sneeze not equal to textures
      (not (= ?tfrom ?tto))
      (not (= ?sneeze ?tfrom))
      (not (= ?sneeze ?tto))
    )
    :effect (and
      (next ?sneeze ?tto)
      (not (next ?sneeze ?tfrom))
    )
  )

  (:action orchestrator-memory
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
      (not (= ?b ?c))
      (not (= ?a ?b))
      (not (= ?a ?c))
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  (:action orchestrator-tightfisted
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (vase ?a ?b)
      (not (= ?a ?b))
      (not (= ?b ?c))
      (not (= ?a ?c))
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
    )
  )

)