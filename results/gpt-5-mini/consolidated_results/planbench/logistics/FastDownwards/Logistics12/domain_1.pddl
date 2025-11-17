(define (domain logistics_objects)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj ?y - obj)
  )

  ;; Action paltry: requires hand, cats, texture, vase(x,y), next(y,z)
  ;; Effects: set next(x,z), remove vase(x,y)
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

  ;; Action sip: requires hand, cats, texture, next(x,z), next(y,z)
  ;; Effects: set vase(x,y), remove next(x,z)
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

  ;; Action clip: requires hand, sneeze, texture, next(y,z), next(x,z)
  ;; Effects: set vase(x,y), remove next(x,z)
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

  ;; Action wretched: requires sneeze(x), texture(y), texture(z), stupendous(w),
  ;; next(x,y), collect(y,w), collect(z,w)
  ;; Effects: set next(x,z), remove next(x,y)
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

  ;; Action memory: requires cats(x), spring(y), spring(z), next(x,y)
  ;; Effects: set next(x,z), remove next(x,y)
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

  ;; Action tightfisted: requires hand(x), sneeze(y), texture(z), next(y,z), vase(x,y)
  ;; Effects: set next(x,z), remove vase(x,y)
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
)