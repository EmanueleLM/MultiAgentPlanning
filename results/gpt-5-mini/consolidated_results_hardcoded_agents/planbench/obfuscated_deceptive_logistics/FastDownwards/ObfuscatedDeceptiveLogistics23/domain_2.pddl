(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  ;; Predicates (names follow the human spec)
  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (vase ?x - obj ?y - obj)
  )

  ;; Action: paltry
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  ;; Action: sip
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj)
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
  (:action clip
    :parameters (?h - obj ?sn - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?sn ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?sn)
      (not (next ?h ?t))
    )
  )

  ;; Action: wretched
  (:action wretched
    :parameters (?sn - obj ?t1 - obj ?t2 - obj ?sp - obj)
    :precondition (and
      (sneeze ?sn)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?sp)
      (next ?sn ?t1)
      (collect ?t1 ?sp)
      (collect ?t2 ?sp)
    )
    :effect (and
      (next ?sn ?t2)
      (not (next ?sn ?t1))
    )
  )

  ;; Action: memory
  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
    )
  )

  ;; Action: tightfisted
  (:action tightfisted
    :parameters (?h - obj ?sn - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?sn ?t)
      (vase ?h ?sn)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?sn))
    )
  )
)