(define (domain clip-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (sneeze ?x - obj)
    (texture ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj ?y - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
  )

  ;; sip(X,Y,Z): requires hand X, cats Y, texture Z, next X Z, next Y Z;
  ;; effects: set vase X Y, unset next X Z.
  (:action sip
    :parameters (?x - obj ?y - obj ?z - obj)
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

  ;; clip(X,Y,Z): requires hand X, sneeze Y, texture Z, next Y Z, next X Z;
  ;; effects: set vase X Y, unset next X Z.
  (:action clip
    :parameters (?x - obj ?y - obj ?z - obj)
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

  ;; paltry(X,Y,Z): requires hand X, cats Y, texture Z, vase X Y, next Y Z;
  ;; effects: set next X Z, unset vase X Y.
  (:action paltry
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )

  ;; tightfisted(X,Y,Z): requires hand X, sneeze Y, texture Z, next Y Z, vase X Y;
  ;; effects: set next X Z, unset vase X Y.
  (:action tightfisted
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )

  ;; wretched(X,Y,Z,W): requires sneeze X, texture Y, texture Z, stupendous W, next X Y, collect Y W, collect Z W;
  ;; effects: set next X Z, unset next X Y.
  (:action wretched
    :parameters (?x - obj ?y - obj ?z - obj ?w - obj)
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
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  ;; memory(X,Y,Z): requires cats X, spring Y, spring Z, next X Y;
  ;; effects: set next X Z, unset next X Y.
  (:action memory
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

)