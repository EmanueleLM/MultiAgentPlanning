(define (domain ObfuscatedDeceptiveLogistics19)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?a - obj ?b - obj)
    (next ?a - obj ?b - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?a - obj ?b - obj)
    (succ ?s1 - stage ?s2 - stage)
    (current-stage ?s - stage)
  )

  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?s - stage ?snext - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
      (current-stage ?s)
      (succ ?s ?snext)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )

  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?s - stage ?snext - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
      (current-stage ?s)
      (succ ?s ?snext)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )

  (:action clip
    :parameters (?h - obj ?sneeze - obj ?t - obj ?s - stage ?snext - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sneeze)
      (texture ?t)
      (next ?sneeze ?t)
      (next ?h ?t)
      (current-stage ?s)
      (succ ?s ?snext)
    )
    :effect (and
      (vase ?h ?sneeze)
      (not (next ?h ?t))
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )

  (:action wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj ?s - stage ?snext - stage)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
      (current-stage ?s)
      (succ ?s ?snext)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )

  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj ?s - stage ?snext - stage)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
      (current-stage ?s)
      (succ ?s ?snext)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )

  (:action tightfisted
    :parameters (?h - obj ?sneeze - obj ?t - obj ?s - stage ?snext - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sneeze)
      (texture ?t)
      (next ?sneeze ?t)
      (vase ?h ?sneeze)
      (current-stage ?s)
      (succ ?s ?snext)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?sneeze))
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )
)