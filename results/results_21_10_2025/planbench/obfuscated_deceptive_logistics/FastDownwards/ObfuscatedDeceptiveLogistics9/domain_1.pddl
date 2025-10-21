(define (domain obfuscated_deceptive_logistics9)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (collect ?x - obj ?y - obj)
    (stupendous ?o - obj)
  )

  ; paltry: requires hand, cats, texture, vase(?a,?b), next(?b,?c)
  ; effects: add next(?a,?c), remove vase(?a,?b)
  (:action paltry
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and (hand ?a) (cats ?b) (texture ?c) (vase ?a ?b) (next ?b ?c))
    :effect (and (next ?a ?c) (not (vase ?a ?b)))
  )

  ; sip: requires hand, cats, texture, next(?a,?c), next(?b,?c)
  ; effects: add vase(?a,?b), remove next(?a,?c)
  (:action sip
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and (hand ?a) (cats ?b) (texture ?c) (next ?a ?c) (next ?b ?c))
    :effect (and (vase ?a ?b) (not (next ?a ?c)))
  )

  ; clip: requires hand, sneeze, texture, next(?b,?c), next(?a,?c)
  ; effects: add vase(?a,?b), remove next(?a,?c)
  (:action clip
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and (hand ?a) (sneeze ?b) (texture ?c) (next ?b ?c) (next ?a ?c))
    :effect (and (vase ?a ?b) (not (next ?a ?c)))
  )

  ; wretched: requires sneeze ?a, texture ?b, texture ?c, stupendous ?d, next(?a,?b), collect(?b,?d), collect(?c,?d)
  ; effects: add next(?a,?c), remove next(?a,?b)
  (:action wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj)
    :precondition (and (sneeze ?a) (texture ?b) (texture ?c) (stupendous ?d) (next ?a ?b) (collect ?b ?d) (collect ?c ?d))
    :effect (and (next ?a ?c) (not (next ?a ?b)))
  )

  ; memory: requires cats ?a, spring ?b, spring ?c, next(?a,?b)
  ; effects: add next(?a,?c), remove next(?a,?b)
  (:action memory
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and (cats ?a) (spring ?b) (spring ?c) (next ?a ?b))
    :effect (and (next ?a ?c) (not (next ?a ?b)))
  )

  ; tightfisted: requires hand ?a, sneeze ?b, texture ?c, next(?b,?c), vase(?a,?b)
  ; effects: add next(?a,?c), remove vase(?a,?b)
  (:action tightfisted
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and (hand ?a) (sneeze ?b) (texture ?c) (next ?b ?c) (vase ?a ?b))
    :effect (and (next ?a ?c) (not (vase ?a ?b)))
  )

)