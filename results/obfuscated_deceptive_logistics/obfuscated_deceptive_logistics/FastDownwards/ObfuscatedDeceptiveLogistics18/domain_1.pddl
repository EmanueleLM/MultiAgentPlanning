(define (domain orchestrator-domain)
  (:requirements :typing)
  (:types obj)
  (:predicates
    (hand ?x - obj ?y - obj)
    (cats ?x - obj ?y - obj)
    (texture ?x - obj ?y - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj ?y - obj)
    (stupendous ?x - obj ?y - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj ?y - obj)
  )
  (:action player_paltry
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (hand ?a ?b)
    :effect (and
      (collect ?b ?c)
    )
  )
  (:action player_sip
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (vase ?a ?b)
    :effect (and
      (sneeze ?b ?c)
    )
  )
  (:action player_clip
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (next ?a ?b)
    :effect (and
      (spring ?b ?c)
    )
  )
  (:action player_wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj)
    :precondition (cats ?a ?b)
    :effect (and
      (texture ?c ?d)
    )
  )
  (:action player_memory
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (texture ?a ?b)
    :effect (and
      (stupendous ?b ?c)
    )
  )
  (:action player_tightfisted
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (collect ?a ?b)
    :effect (and
      (hand ?b ?c)
    )
  )
)