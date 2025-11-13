(define (domain obfuscated-deceptive-logistics3)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj time)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (sneeze ?o - obj)
    (texture ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?x - obj ?y - obj)

    (next ?x - obj ?y - obj ?t - time)
    (vase ?x - obj ?y - obj ?t - time)
    (succ ?t1 - time ?t2 - time)
  )

  (:action actor_a_sip
    :parameters (?a - obj ?b - obj ?c - obj ?t - time ?t2 - time)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (next ?a ?c ?t)
      (next ?b ?c ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?a ?b ?t2)
      (not (next ?a ?c ?t))
    )
  )

  (:action actor_b_sip
    :parameters (?a - obj ?b - obj ?c - obj ?t - time ?t2 - time)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (next ?a ?c ?t)
      (next ?b ?c ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?a ?b ?t2)
      (not (next ?a ?c ?t))
    )
  )

  (:action actor_a_clip
    :parameters (?a - obj ?b - obj ?c - obj ?t - time ?t2 - time)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c ?t)
      (next ?a ?c ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?a ?b ?t2)
      (not (next ?a ?c ?t))
    )
  )

  (:action actor_b_clip
    :parameters (?a - obj ?b - obj ?c - obj ?t - time ?t2 - time)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c ?t)
      (next ?a ?c ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?a ?b ?t2)
      (not (next ?a ?c ?t))
    )
  )

  (:action actor_a_paltry
    :parameters (?a - obj ?b - obj ?c - obj ?t - time ?t2 - time)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?a ?b ?t)
      (next ?b ?c ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?a ?c ?t2)
      (not (vase ?a ?b ?t))
    )
  )

  (:action actor_b_paltry
    :parameters (?a - obj ?b - obj ?c - obj ?t - time ?t2 - time)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?a ?b ?t)
      (next ?b ?c ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?a ?c ?t2)
      (not (vase ?a ?b ?t))
    )
  )

  (:action actor_a_tightfisted
    :parameters (?a - obj ?b - obj ?c - obj ?t - time ?t2 - time)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c ?t)
      (vase ?a ?b ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?a ?c ?t2)
      (not (vase ?a ?b ?t))
    )
  )

  (:action actor_b_tightfisted
    :parameters (?a - obj ?b - obj ?c - obj ?t - time ?t2 - time)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c ?t)
      (vase ?a ?b ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?a ?c ?t2)
      (not (vase ?a ?b ?t))
    )
  )

  (:action actor_a_memory
    :parameters (?x - obj ?y - obj ?z - obj ?t - time ?t2 - time)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?x ?z ?t2)
      (not (next ?x ?y ?t))
    )
  )

  (:action actor_b_memory
    :parameters (?x - obj ?y - obj ?z - obj ?t - time ?t2 - time)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?x ?z ?t2)
      (not (next ?x ?y ?t))
    )
  )

  (:action actor_a_wretched
    :parameters (?x - obj ?y - obj ?z - obj ?c - obj ?t - time ?t2 - time)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?c)
      (next ?x ?y ?t)
      (collect ?y ?c)
      (collect ?z ?c)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?x ?z ?t2)
      (not (next ?x ?y ?t))
    )
  )

  (:action actor_b_wretched
    :parameters (?x - obj ?y - obj ?z - obj ?c - obj ?t - time ?t2 - time)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?c)
      (next ?x ?y ?t)
      (collect ?y ?c)
      (collect ?z ?c)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?x ?z ?t2)
      (not (next ?x ?y ?t))
    )
  )
)