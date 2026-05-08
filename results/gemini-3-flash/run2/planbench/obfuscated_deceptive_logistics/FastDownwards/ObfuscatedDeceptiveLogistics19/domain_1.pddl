(define (domain obfuscated_deceptive_logistics_19)
  (:requirements :strips)
  (:predicates
    (hand ?o)
    (cats ?o)
    (texture ?o)
    (sneeze ?o)
    (stupendous ?o)
    (spring ?o)
    (next ?o1 ?o2)
    (vase ?o1 ?o2)
    (collect ?o1 ?o2)
  )

  ;; Drop action for hand and cats package
  (:action paltry
    :parameters (?h ?c ?t)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?c)))
  )

  ;; Pickup action for hand and cats package
  (:action sip
    :parameters (?h ?c ?t)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t))
    :effect (and (vase ?h ?c) (not (next ?h ?t)))
  )

  ;; Pickup action for hand and sneeze package
  (:action clip
    :parameters (?h ?s ?t)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?h ?t))
    :effect (and (vase ?h ?s) (not (next ?h ?t)))
  )

  ;; Move action for sneeze package between textures in the same stupendous group
  (:action wretched
    :parameters (?s ?t1 ?t2 ?st)
    :precondition (and (sneeze ?s) (texture ?t1) (texture ?t2) (stupendous ?st) (next ?s ?t1) (collect ?t1 ?st) (collect ?t2 ?st))
    :effect (and (next ?s ?t2) (not (next ?s ?t1)))
  )

  ;; Move action for cats package between springs
  (:action memory
    :parameters (?c ?sp1 ?sp2)
    :precondition (and (cats ?c) (spring ?sp1) (spring ?sp2) (next ?c ?sp1))
    :effect (and (next ?c ?sp2) (not (next ?c ?sp1)))
  )

  ;; Drop action for hand and sneeze package
  (:action tightfisted
    :parameters (?h ?s ?t)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?h ?s))
    :effect (and (next ?h ?t) (not (vase ?h ?s)))
  )
)