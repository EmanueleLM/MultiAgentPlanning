(define (domain obfuscated-deceptive-logistics11)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj step)

  (:predicates
    ;; unary role/type predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (sneeze ?x - obj)
    (stupendous ?x - obj)
    (spring ?x - obj)
    (texture ?x - obj)

    ;; binary relations over objects
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (collect ?x - obj ?y - obj)

    ;; stage / ordering predicates
    (current ?s - step)
    (succ ?s - step ?s2 - step)
  )

  ;; All actions require the current-stage token and advance it to its successor.
  ;; When an action establishes a new next relation for an object we require and
  ;; remove that object's previous next to enforce contiguous occupancy.

  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?old - obj ?s - step ?s2 - step)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
      (next ?h ?old)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?h ?t)
      (not (next ?h ?old))
      (not (vase ?h ?c))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?s - step ?s2 - step)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action clip
    :parameters (?h - obj ?sn - obj ?t - obj ?s - step ?s2 - step)
    :precondition (and
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?sn ?t)
      (next ?h ?t)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?h ?sn)
      (not (next ?h ?t))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action wretched
    :parameters (?sn - obj ?t1 - obj ?t2 - obj ?stp - obj ?s - step ?s2 - step)
    :precondition (and
      (sneeze ?sn)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?stp)
      (next ?sn ?t1)
      (collect ?t1 ?stp)
      (collect ?t2 ?stp)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?sn ?t2)
      (not (next ?sn ?t1))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2obj - obj ?s - step ?s2 - step)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2obj)
      (next ?c ?s1)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?c ?s2obj)
      (not (next ?c ?s1))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action tightfisted
    :parameters (?h - obj ?sn - obj ?t - obj ?old - obj ?s - step ?s2 - step)
    :precondition (and
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?sn ?t)
      (vase ?h ?sn)
      (next ?h ?old)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?sn))
      (not (next ?h ?old))
      (not (current ?s))
      (current ?s2)
    )
  )
)