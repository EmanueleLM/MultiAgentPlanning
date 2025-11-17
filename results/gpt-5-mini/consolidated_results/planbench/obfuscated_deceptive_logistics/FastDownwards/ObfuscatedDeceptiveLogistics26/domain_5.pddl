(define (domain obfuscated_deceptive_logistics26)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o - obj ?p - obj)
    (next ?o - obj ?p - obj)
    (sneeze ?o - obj)
    (stupendous ?o - obj)
    (collect ?o - obj ?p - obj)
    (spring ?o - obj)

    ;; explicit stage/time management predicates
    (stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
    (current ?s - stage)
  )

  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)

      (current ?st)
      (succ ?st ?stn)
      (not (current ?stn))
    )
    :effect (and
      ;; stage progression: contiguous forward move
      (not (current ?st))
      (current ?stn)

      ;; domain effects
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)

      (current ?st)
      (succ ?st ?stn)
      (not (current ?stn))
    )
    :effect (and
      (not (current ?st))
      (current ?stn)

      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)

      (current ?st)
      (succ ?st ?stn)
      (not (current ?stn))
    )
    :effect (and
      (not (current ?st))
      (current ?stn)

      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  (:action wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj ?st - stage ?stn - stage)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)

      (current ?st)
      (succ ?st ?stn)
      (not (current ?stn))
    )
    :effect (and
      (not (current ?st))
      (current ?stn)

      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj ?st - stage ?stn - stage)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)

      (current ?st)
      (succ ?st ?stn)
      (not (current ?stn))
    )
    :effect (and
      (not (current ?st))
      (current ?stn)

      (next ?c ?s2)
      (not (next ?c ?s1))
    )
  )

  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)

      (current ?st)
      (succ ?st ?stn)
      (not (current ?stn))
    )
    :effect (and
      (not (current ?st))
      (current ?stn)

      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )
)