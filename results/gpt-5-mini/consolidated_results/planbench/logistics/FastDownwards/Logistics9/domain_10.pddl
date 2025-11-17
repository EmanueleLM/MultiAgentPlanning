(define (domain logistics9)
  (:requirements :strips :typing :negative-preconditions)
  (:types object step)
  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (texture ?o - object)
    (vase ?a ?b - object)
    (next ?a ?b - object)
    (collect ?a ?b - object)
    (enabled-at ?s - step)
    (succ ?s1 ?s2 - step)
  )

  ;; Player A actions (distinct names to preserve attribution)
  (:action paltry_playera
    :parameters (?o0 ?o1 ?o2 - object ?s ?s2 - step)
    :precondition (and
      (enabled-at ?s)
      (succ ?s ?s2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (not (vase ?o0 ?o1))
      (next ?o0 ?o2)
      (not (enabled-at ?s))
      (enabled-at ?s2)
    )
  )

  (:action sip_playera
    :parameters (?o0 ?o1 ?o2 - object ?s ?s2 - step)
    :precondition (and
      (enabled-at ?s)
      (succ ?s ?s2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (enabled-at ?s))
      (enabled-at ?s2)
    )
  )

  (:action clip_playera
    :parameters (?o0 ?o1 ?o2 - object ?s ?s2 - step)
    :precondition (and
      (enabled-at ?s)
      (succ ?s ?s2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (enabled-at ?s))
      (enabled-at ?s2)
    )
  )

  (:action wretched_playera
    :parameters (?o0 ?o1 ?o2 ?o3 - object ?s ?s2 - step)
    :precondition (and
      (enabled-at ?s)
      (succ ?s ?s2)
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (enabled-at ?s))
      (enabled-at ?s2)
    )
  )

  (:action memory_playera
    :parameters (?o0 ?o1 ?o2 - object ?s ?s2 - step)
    :precondition (and
      (enabled-at ?s)
      (succ ?s ?s2)
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (enabled-at ?s))
      (enabled-at ?s2)
    )
  )

  (:action tightfisted_playera
    :parameters (?o0 ?o1 ?o2 - object ?s ?s2 - step)
    :precondition (and
      (enabled-at ?s)
      (succ ?s ?s2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (enabled-at ?s))
      (enabled-at ?s2)
    )
  )

  ;; Player B actions (distinct names)
  (:action paltry_playerb
    :parameters (?o0 ?o1 ?o2 - object ?s ?s2 - step)
    :precondition (and
      (enabled-at ?s)
      (succ ?s ?s2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (not (vase ?o0 ?o1))
      (next ?o0 ?o2)
      (not (enabled-at ?s))
      (enabled-at ?s2)
    )
  )

  (:action sip_playerb
    :parameters (?o0 ?o1 ?o2 - object ?s ?s2 - step)
    :precondition (and
      (enabled-at ?s)
      (succ ?s ?s2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (enabled-at ?s))
      (enabled-at ?s2)
    )
  )

  (:action clip_playerb
    :parameters (?o0 ?o1 ?o2 - object ?s ?s2 - step)
    :precondition (and
      (enabled-at ?s)
      (succ ?s ?s2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (enabled-at ?s))
      (enabled-at ?s2)
    )
  )

  (:action wretched_playerb
    :parameters (?o0 ?o1 ?o2 ?o3 - object ?s ?s2 - step)
    :precondition (and
      (enabled-at ?s)
      (succ ?s ?s2)
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (enabled-at ?s))
      (enabled-at ?s2)
    )
  )

  (:action memory_playerb
    :parameters (?o0 ?o1 ?o2 - object ?s ?s2 - step)
    :precondition (and
      (enabled-at ?s)
      (succ ?s ?s2)
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (enabled-at ?s))
      (enabled-at ?s2)
    )
  )

  (:action tightfisted_playerb
    :parameters (?o0 ?o1 ?o2 - object ?s ?s2 - step)
    :precondition (and
      (enabled-at ?s)
      (succ ?s ?s2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (enabled-at ?s))
      (enabled-at ?s2)
    )
  )
)