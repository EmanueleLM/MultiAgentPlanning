(define (domain orchestrated-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (sneeze ?o - object)
    (texture ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (collect ?c - object ?i - object)
    (vase ?a - object ?b - object)
    (next ?a - object ?b - object)
  )

  ; paltry: requires vase(X,Y) and successor Y->Z; replaces X's current successor with Z and removes vase(X,Y)
  (:action paltry
    :parameters (?x - object ?y - object ?z - object ?old - object)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
      (next ?x ?old)
    )
    :effect (and
      (not (vase ?x ?y))
      (not (next ?x ?old))
      (next ?x ?z)
    )
  )

  ; sip: requires both X and Y currently point to Z; creates vase(X,Y) and removes X->Z
  (:action sip
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
    )
  )

  ; clip: similar to sip but Y must be sneeze; creates vase(X,Y) and removes X->Z
  (:action clip
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
    )
  )

  ; wretched: requires X->Y, textures on Y and Z, and both Y and Z collect W; replaces X->Y with X->Z
  (:action wretched
    :parameters (?x - object ?y - object ?z - object ?w - object)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?w)
      (next ?x ?y)
      (collect ?y ?w)
      (collect ?z ?w)
    )
    :effect (and
      (not (next ?x ?y))
      (next ?x ?z)
    )
  )

  ; memory: requires X->Y and springs at Y and Z; replaces X->Y with X->Z
  (:action memory
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
    )
    :effect (and
      (not (next ?x ?y))
      (next ?x ?z)
    )
  )

  ; tightfisted: requires vase(X,Y) and Y->Z; replaces X's current successor with Z and removes vase(X,Y)
  (:action tightfisted
    :parameters (?x - object ?y - object ?z - object ?old - object)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
      (next ?x ?old)
    )
    :effect (and
      (not (vase ?x ?y))
      (not (next ?x ?old))
      (next ?x ?z)
    )
  )
)