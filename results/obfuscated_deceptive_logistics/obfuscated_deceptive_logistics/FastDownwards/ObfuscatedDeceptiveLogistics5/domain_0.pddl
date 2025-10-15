(define (domain multiagent-next)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (cats ?o - object)
    (hand ?o - object)
    (texture ?o - object)
    (vase ?h - object ?c - object)
    (next ?a - object ?b - object)
    (sneeze ?o - object)
    (collect ?a - object ?b - object)
    (spring ?o - object)
    (stupendous ?o - object)
  )

  ;; Player1 actions
  (:action player1-paltry
    :parameters (?h - object ?c - object ?t - object)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?c)))
  )

  (:action player1-sip
    :parameters (?h - object ?c - object ?t - object)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t))
    :effect (and (vase ?h ?c) (not (next ?h ?t)))
  )

  (:action player1-clip
    :parameters (?h - object ?s - object ?t - object)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?h ?t))
    :effect (and (vase ?h ?s) (not (next ?h ?t)))
  )

  (:action player1-memory
    :parameters (?c - object ?s1 - object ?s2 - object)
    :precondition (and (cats ?c) (spring ?s1) (spring ?s2) (next ?c ?s1))
    :effect (and (next ?c ?s2) (not (next ?c ?s1)))
  )

  (:action player1-tightfisted
    :parameters (?h - object ?s - object ?t - object)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?h ?s))
    :effect (and (next ?h ?t) (not (vase ?h ?s)))
  )

  ;; Player2 actions
  (:action player2-wretched
    :parameters (?s0 - object ?t1 - object ?t2 - object ?st - object)
    :precondition (and
                   (sneeze ?s0)
                   (texture ?t1)
                   (texture ?t2)
                   (stupendous ?st)
                   (next ?s0 ?t1)
                   (collect ?t1 ?st)
                   (collect ?t2 ?st))
    :effect (and (next ?s0 ?t2) (not (next ?s0 ?t1)))
  )
)