(define (domain multi_agent_domain)
  (:requirements :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj ?y - obj)
  )

  ;; Player A action variants
  (:action playerA-paltry
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?c)))
  )

  (:action playerA-sip
    :parameters (?h - obj ?c - obj ?t - obj ?nx - obj ?ny - obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (next ?h ?nx) (next ?c ?ny))
    :effect (and (vase ?h ?c) (not (next ?h ?nx)))
  )

  (:action playerA-clip
    :parameters (?h - obj ?s - obj ?t - obj ?ny - obj ?nx - obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?ny) (next ?h ?nx))
    :effect (and (vase ?h ?s) (not (next ?h ?nx)))
  )

  (:action playerA-wretched
    :parameters (?s - obj ?t1 - obj ?t2 - obj ?w - obj)
    :precondition (and (sneeze ?s) (texture ?t1) (texture ?t2) (stupendous ?w) (next ?s ?t1) (collect ?t1 ?w) (collect ?t2 ?w))
    :effect (and (next ?s ?t2) (not (next ?s ?t1)))
  )

  (:action playerA-memory
    :parameters (?c - obj ?y - obj ?z - obj)
    :precondition (and (cats ?c) (spring ?y) (spring ?z) (next ?c ?y))
    :effect (and (next ?c ?z) (not (next ?c ?y)))
  )

  (:action playerA-tightfisted
    :parameters (?h - obj ?s - obj ?t - obj ?ny - obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?ny) (vase ?h ?s))
    :effect (and (next ?h ?ny) (not (vase ?h ?s)))
  )

  ;; Player B action variants
  (:action playerB-paltry
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?c)))
  )

  (:action playerB-sip
    :parameters (?h - obj ?c - obj ?t - obj ?nx - obj ?ny - obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (next ?h ?nx) (next ?c ?ny))
    :effect (and (vase ?h ?c) (not (next ?h ?nx)))
  )

  (:action playerB-clip
    :parameters (?h - obj ?s - obj ?t - obj ?ny - obj ?nx - obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?ny) (next ?h ?nx))
    :effect (and (vase ?h ?s) (not (next ?h ?nx)))
  )

  (:action playerB-wretched
    :parameters (?s - obj ?t1 - obj ?t2 - obj ?w - obj)
    :precondition (and (sneeze ?s) (texture ?t1) (texture ?t2) (stupendous ?w) (next ?s ?t1) (collect ?t1 ?w) (collect ?t2 ?w))
    :effect (and (next ?s ?t2) (not (next ?s ?t1)))
  )

  (:action playerB-memory
    :parameters (?c - obj ?y - obj ?z - obj)
    :precondition (and (cats ?c) (spring ?y) (spring ?z) (next ?c ?y))
    :effect (and (next ?c ?z) (not (next ?c ?y)))
  )

  (:action playerB-tightfisted
    :parameters (?h - obj ?s - obj ?t - obj ?ny - obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?ny) (vase ?h ?s))
    :effect (and (next ?h ?ny) (not (vase ?h ?s)))
  )
)