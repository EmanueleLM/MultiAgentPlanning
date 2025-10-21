(define (domain orchestrator)
  ;; Domain for the "orchestrator" actions extracted from the analyst summaries.
  ;; Design decisions (conservative resolutions of ambiguities):
  ;; - All unary symbols (hand, cats, texture, sneeze, spring, stupendous) are encoded as predicates (object properties),
  ;;   NOT as PDDL types. This is because objects in the scenarios sometimes satisfy multiple unary predicates
  ;;   (for example an object can be both a 'spring' and a 'texture'), so PDDL typing as disjoint subtypes would be incorrect.
  ;; - Binary predicates (vase, next, collect) are directional relations as used by the actions.
  ;; - Parameter equality is allowed (no explicit inequality constraints were provided in the analysis).
  ;; - Actions are encoded exactly as observed: preconditions must hold; effects add and delete facts as reported.
  ;; - Requirements are limited to :strips and :typing for FastDownward compatibility.
  (:requirements :strips :typing)
  (:types object)

  (:predicates
    ;; Unary predicates (properties / roles)
    (hand ?x - object)
    (cats ?x - object)
    (texture ?x - object)
    (sneeze ?x - object)
    (spring ?x - object)
    (stupendous ?x - object)

    ;; Binary relations (directional)
    (vase ?x ?y - object)
    (next ?x ?y - object)
    (collect ?x ?y - object)
  )

  ;; Action: paltry
  ;; Replaces vase(?h,?c) with next(?h,?t) given that ?c points to ?t.
  (:action paltry
    :parameters (?h - object ?c - object ?t - object)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (not (vase ?h ?c))
      (next ?h ?t)
    )
  )

  ;; Action: sip
  ;; Creates a vase link between ?h and ?c if both point to the same texture ?t; removes next(?h,?t).
  (:action sip
    :parameters (?h - object ?c - object ?t - object)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  ;; Action: clip
  ;; Same pattern as sip but requires ?c to satisfy sneeze instead of cats.
  (:action clip
    :parameters (?h - object ?c - object ?t - object)
    :precondition (and
      (hand ?h)
      (sneeze ?c)
      (texture ?t)
      (next ?c ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  ;; Action: wretched
  ;; Move next(?sneeze, ?t1) -> next(?sneeze, ?t2) provided both textures are collected by same stupendous object.
  (:action wretched
    :parameters (?snee - object ?t1 - object ?t2 - object ?st - object)
    :precondition (and
      (sneeze ?snee)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?snee ?t1)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
    )
    :effect (and
      (not (next ?snee ?t1))
      (next ?snee ?t2)
    )
  )

  ;; Action: memory
  ;; Re-route next(?c, ?s1) to next(?c, ?s2) where both successors are springs.
  (:action memory
    :parameters (?c - object ?s1 - object ?s2 - object)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
    )
    :effect (and
      (not (next ?c ?s1))
      (next ?c ?s2)
    )
  )

  ;; Action: tightfisted
  ;; Similar to paltry but requires the target to satisfy sneeze and a vase relation exists initially.
  (:action tightfisted
    :parameters (?h - object ?s - object ?t - object)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)
    )
    :effect (and
      (not (vase ?h ?s))
      (next ?h ?t)
    )
  )

)