(define (domain multi_agent)
  (:requirements :typing :strips :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o - obj)
    (next ?from - obj ?to - obj)
    (sneeze ?o - obj)
    (stupendous ?o - obj)
    (collect ?a - obj ?b - obj)
    (spring ?o - obj)
  )

  (:action planner_a_paltry
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?t)
      (next ?c ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?t))
    )
  )

  (:action planner_b_paltry
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?t)
      (next ?c ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?t))
    )
  )

  (:action planner_a_sip
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (vase ?t)
      (not (next ?h ?c))
    )
  )

  (:action planner_b_sip
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (vase ?t)
      (not (next ?h ?c))
    )
  )

  (:action planner_a_clip
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?s)
    )
    :effect (and
      (vase ?t)
      (not (next ?h ?s))
    )
  )

  (:action planner_b_clip
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?s)
    )
    :effect (and
      (vase ?t)
      (not (next ?h ?s))
    )
  )

  (:action planner_a_wretched
    :parameters (?s - obj ?t - obj ?u - obj ?x - obj)
    :precondition (and
      (sneeze ?s)
      (texture ?t)
      (stupendous ?u)
      (next ?s ?t)
      (collect ?t ?x)
      (collect ?u ?x)
    )
    :effect (and
      (next ?u ?t)
      (not (next ?s ?t))
    )
  )

  (:action planner_b_wretched
    :parameters (?s - obj ?t - obj ?u - obj ?x - obj)
    :precondition (and
      (sneeze ?s)
      (texture ?t)
      (stupendous ?u)
      (next ?s ?t)
      (collect ?t ?x)
      (collect ?u ?x)
    )
    :effect (and
      (next ?u ?t)
      (not (next ?s ?t))
    )
  )

  (:action planner_a_memory
    :parameters (?c - obj ?s - obj ?t - obj)
    :precondition (and
      (cats ?c)
      (spring ?s)
      (spring ?t)
      (next ?c ?s)
    )
    :effect (and
      (next ?c ?t)
      (not (next ?c ?s))
    )
  )

  (:action planner_b_memory
    :parameters (?c - obj ?s - obj ?t - obj)
    :precondition (and
      (cats ?c)
      (spring ?s)
      (spring ?t)
      (next ?c ?s)
    )
    :effect (and
      (next ?c ?t)
      (not (next ?c ?s))
    )
  )

  (:action planner_a_tightfisted
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?t))
    )
  )

  (:action planner_b_tightfisted
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?t))
    )
  )
)