(define (domain object-manipulation)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (sneeze ?o - obj)
    (texture ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?a - obj ?b - obj)
    (next ?a - obj ?b - obj)
    (vase ?a - obj ?b - obj)
    (now ?s - stage)
    (succ ?s - stage ?s2 - stage)
  )

  ;; Agent Alpha actions: paltry, sip, clip
  ;; Each action requires the current stage to be 'now' and advances to the explicit successor stage.
  ;; This enforces strict discrete-time ordering and prevents oscillation or concurrent use of the same stage.
  (:action agent_alpha_paltry
    :parameters (?s - stage ?s2 - stage ?h - obj ?c - obj ?t - obj)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (not (now ?s))
      (now ?s2)
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  (:action agent_alpha_sip
    :parameters (?s - stage ?s2 - stage ?h - obj ?c - obj ?t - obj)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (not (now ?s))
      (now ?s2)
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  (:action agent_alpha_clip
    :parameters (?s - stage ?s2 - stage ?h - obj ?sn - obj ?t - obj)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?sn ?t)
      (next ?h ?t)
    )
    :effect (and
      (not (now ?s))
      (now ?s2)
      (vase ?h ?sn)
      (not (next ?h ?t))
    )
  )

  ;; Agent Beta actions: wretched, memory, tightfisted
  (:action agent_beta_wretched
    :parameters (?s - stage ?s2 - stage ?a - obj ?b - obj ?c - obj ?d - obj)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
    )
    :effect (and
      (not (now ?s))
      (now ?s2)
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  (:action agent_beta_memory
    :parameters (?s - stage ?s2 - stage ?x - obj ?y - obj ?z - obj)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
    )
    :effect (and
      (not (now ?s))
      (now ?s2)
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  (:action agent_beta_tightfisted
    :parameters (?s - stage ?s2 - stage ?h - obj ?sn - obj ?t - obj)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?sn ?t)
      (vase ?h ?sn)
    )
    :effect (and
      (not (now ?s))
      (now ?s2)
      (next ?h ?t)
      (not (vase ?h ?sn))
    )
  )
)