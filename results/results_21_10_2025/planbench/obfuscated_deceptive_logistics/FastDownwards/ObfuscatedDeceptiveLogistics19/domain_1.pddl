(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x ?y - obj)
    (next ?x ?y - obj)
    (sneeze ?x - obj)
    (collect ?x ?y - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
  )

  ; paltry: parameters (?h ?c ?t)
  ; pre: (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t)
  ; add: (next ?h ?t)
  ; del: (vase ?h ?c)
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
      (not (vase ?h ?c))
      (next ?h ?t)
    )
  )

  ; sip: parameters (?h ?c ?t)
  ; pre: (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t)
  ; add: (vase ?h ?c)
  ; del: (next ?h ?t)
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

  ; clip: parameters (?h ?s ?t)
  ; pre: (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?h ?t)
  ; add: (vase ?h ?s)
  ; del: (next ?h ?t)
  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  ; wretched: parameters (?s ?t1 ?t2 ?st)
  ; pre: (sneeze ?s) (texture ?t1) (texture ?t2) (stupendous ?st) (next ?s ?t1)
  ;      (collect ?t1 ?st) (collect ?t2 ?st)
  ; add: (next ?s ?t2)
  ; del: (next ?s ?t1)
  (:action wretched
    :parameters (?s - obj ?t1 - obj ?t2 - obj ?st - obj)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?s ?t1)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
    )
    :effect (and
      (not (next ?s ?t1))
      (next ?s ?t2)
    )
  )

  ; memory: parameters (?c ?s1 ?s2)
  ; pre: (cats ?c) (spring ?s1) (spring ?s2) (next ?c ?s1)
  ; add: (next ?c ?s2)
  ; del: (next ?c ?s1)
  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj)
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

  ; tightfisted: parameters (?h ?s ?t)
  ; pre: (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?h ?s)
  ; add: (next ?h ?t)
  ; del: (vase ?h ?s)
  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj)
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