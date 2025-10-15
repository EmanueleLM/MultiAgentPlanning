(define (domain orchestrated-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o - obj)
    (next ?a - obj ?b - obj)
    (sneeze ?o - obj)
    (stupendous ?o - obj)
    (spring ?o - obj)
    (collect ?x - obj ?y - obj)
  )

  ;; Actions derived from analyst_a: paltry, sip, clip
  ;; paltry: requires hand, cats, texture, vase and a next relation; makes a (possibly different) next true and clears the vase fact.
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?v - obj ?f - obj ?to - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?v)
      (next ?f ?to)
    )
    :effect (and
      ;; create a next relation (using cats ?c as subject and reusing existing ?to as target)
      (next ?c ?to)
      ;; remove vase on ?v
      (not (vase ?v))
    )
  )

  ;; sip: requires hand, cats, texture and two next relations; makes a vase true and removes one next relation.
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?n1f - obj ?n1t - obj ?n2f - obj ?n2t - obj ?v - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?n1f ?n1t)
      (next ?n2f ?n2t)
    )
    :effect (and
      ;; create vase on ?v
      (vase ?v)
      ;; remove the first next relation (one next becomes false)
      (not (next ?n1f ?n1t))
    )
  )

  ;; clip: requires hand, sneeze, texture and two next relations; makes a vase true and removes one next relation.
  ;; Note: clip differs from sip by requiring sneeze instead of cats.
  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj ?n1f - obj ?n1t - obj ?n2f - obj ?n2t - obj ?v - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?n1f ?n1t)
      (next ?n2f ?n2t)
    )
    :effect (and
      (vase ?v)
      (not (next ?n1f ?n1t))
    )
  )

  ;; Actions derived from analyst_b: wretched, memory, tightfisted
  ;; wretched: requires sneeze, texture, stupendous, a next and a collect; makes a next true and another next false.
  (:action wretched
    :parameters (?sneeze - obj ?tex - obj ?st - obj ?colsub - obj ?colobj - obj ?n1f - obj ?n1t - obj)
    :precondition (and
      (sneeze ?sneeze)
      (texture ?tex)
      (stupendous ?st)
      (collect ?colsub ?colobj)
      (next ?n1f ?n1t)
    )
    :effect (and
      ;; create a next relation that uses the collect subject and the original next target
      (next ?colsub ?n1t)
      ;; remove the original next relation
      (not (next ?n1f ?n1t))
    )
  )

  ;; memory: requires cats and spring and a next; makes a next true and another next false.
  (:action memory
    :parameters (?c - obj ?s - obj ?n1f - obj ?n1t - obj)
    :precondition (and
      (cats ?c)
      (spring ?s)
      (next ?n1f ?n1t)
    )
    :effect (and
      ;; make a next relation connecting the cat to the original next target
      (next ?c ?n1t)
      ;; remove the original next relation
      (not (next ?n1f ?n1t))
    )
  )

  ;; tightfisted: requires hand, sneeze, texture and vase and a next relation; makes a next true and clears the vase.
  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj ?v - obj ?n1f - obj ?n1t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (vase ?v)
      (next ?n1f ?n1t)
    )
    :effect (and
      ;; create a next relation using the hand-holder as subject and reusing the next's target
      (next ?h ?n1t)
      ;; remove vase
      (not (vase ?v))
    )
  )

)