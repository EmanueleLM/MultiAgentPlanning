(define (domain ObfuscatedDeceptiveLogistics20)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?h - obj ?s - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj)
  )

  (:action paltry_a
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

  (:action paltry_b
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

  (:action sip_a
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (not (next ?h ?t))
      (vase ?h ?c)
    )
  )

  (:action sip_b
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (not (next ?h ?t))
      (vase ?h ?c)
    )
  )

  (:action clip_a
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
    )
    :effect (and
      (not (next ?h ?t))
      (vase ?h ?s)
    )
  )

  (:action clip_b
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
    )
    :effect (and
      (not (next ?h ?t))
      (vase ?h ?s)
    )
  )

  (:action wretched_a
    :parameters (?s - obj ?from - obj ?to - obj ?st - obj)
    :precondition (and
      (sneeze ?s)
      (texture ?from)
      (texture ?to)
      (stupendous ?st)
      (next ?s ?from)
      (collect ?from ?st)
      (collect ?to ?st)
    )
    :effect (and
      (not (next ?s ?from))
      (next ?s ?to)
    )
  )

  (:action wretched_b
    :parameters (?s - obj ?from - obj ?to - obj ?st - obj)
    :precondition (and
      (sneeze ?s)
      (texture ?from)
      (texture ?to)
      (stupendous ?st)
      (next ?s ?from)
      (collect ?from ?st)
      (collect ?to ?st)
    )
    :effect (and
      (not (next ?s ?from))
      (next ?s ?to)
    )
  )

  (:action memory_a
    :parameters (?c - obj ?from - obj ?to - obj)
    :precondition (and
      (cats ?c)
      (spring ?from)
      (spring ?to)
      (next ?c ?from)
    )
    :effect (and
      (not (next ?c ?from))
      (next ?c ?to)
    )
  )

  (:action memory_b
    :parameters (?c - obj ?from - obj ?to - obj)
    :precondition (and
      (cats ?c)
      (spring ?from)
      (spring ?to)
      (next ?c ?from)
    )
    :effect (and
      (not (next ?c ?from))
      (next ?c ?to)
    )
  )

  (:action tightfisted_a
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

  (:action tightfisted_b
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