(define (domain multiagent-domain)
  (:requirements :strips :typing)
  (:types agent cat texture vase spring obj)

  (:predicates
    (hand ?a - agent)
    (cats ?c - cat)
    (texture ?t - texture)
    (vase ?v - vase)
    (sneeze ?s - obj)
    (spring ?s - spring)
    (collect ?c - obj)
    (stupendous ?s - obj)
    (next ?x - obj ?y - obj)
  )

  ; paltry: requires an existing next(X,Y) and common resources;
  ; effect: creates next(Y,Z) and removes the used vase (toggled)
  (:action paltry
    :parameters (?ag - agent ?ct - cat ?tx - texture ?v - vase ?x - obj ?y - obj ?z - obj)
    :precondition (and (hand ?ag) (cats ?ct) (texture ?tx) (vase ?v) (next ?x ?y))
    :effect (and (next ?y ?z) (not (vase ?v)))
  )

  ; sip: requires hand, cats, texture and an existing next(X,Y);
  ; effect: create next(Y,Z) (does not touch vase)
  (:action sip
    :parameters (?ag - agent ?ct - cat ?tx - texture ?x - obj ?y - obj ?z - obj)
    :precondition (and (hand ?ag) (cats ?ct) (texture ?tx) (next ?x ?y))
    :effect (and (next ?y ?z))
  )

  ; clip: requires hand, a sneeze-bearing object, texture and an existing next(X,Y);
  ; effect: create next(Y,Z)
  (:action clip
    :parameters (?ag - agent ?s - obj ?tx - texture ?x - obj ?y - obj ?z - obj)
    :precondition (and (hand ?ag) (sneeze ?s) (texture ?tx) (next ?x ?y))
    :effect (and (next ?y ?z))
  )

  ; wretched: heavy preconditions including sneeze, texture, stupendous, existing next, and collect;
  ; effect: create next(Y,Z)
  (:action wretched
    :parameters (?s - obj ?tx - texture ?st - obj ?x - obj ?y - obj ?col - obj ?z - obj)
    :precondition (and (sneeze ?s) (texture ?tx) (stupendous ?st) (next ?x ?y) (collect ?col))
    :effect (and (next ?y ?z))
  )

  ; memory: requires cats, spring and an existing next(X,Y);
  ; effect: create next(Y,Z)
  (:action memory
    :parameters (?ct - cat ?sp - spring ?x - obj ?y - obj ?z - obj)
    :precondition (and (cats ?ct) (spring ?sp) (next ?x ?y))
    :effect (and (next ?y ?z))
  )

  ; tightfisted: requires hand, sneeze, texture, an existing next and a vase;
  ; effect: create next(Y,Z) and remove vase (toggled)
  (:action tightfisted
    :parameters (?ag - agent ?s - obj ?tx - texture ?v - vase ?x - obj ?y - obj ?z - obj)
    :precondition (and (hand ?ag) (sneeze ?s) (texture ?tx) (next ?x ?y) (vase ?v))
    :effect (and (next ?y ?z) (not (vase ?v)))
  )
)