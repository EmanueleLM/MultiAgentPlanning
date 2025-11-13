(define (domain ObfuscatedDeceptiveLogistics10)
  (:requirements :strips :typing :negative-preconditions)
  (:types object time)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o - object ?p - object)
    (next ?o - object ?p - object)
    (sneeze ?o - object)
    (collect ?o - object ?p - object)
    (spring ?o - object)
    (stupendous ?o - object)

    ;; discrete ordered time slots to enforce strict sequential execution
    (prev ?p - time ?t - time)   ;; predecessor relation between time slots
    (free ?t - time)             ;; time slot available for an action
    (used ?t - time)             ;; time slot has been consumed
  )

  ;; paltry: produces next(o0,o2) and removes vase(o0,o1)
  (:action paltry
    :parameters (?o0 - object ?o1 - object ?o2 - object ?prev - time ?t - time)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
      ;; time-slot ordering: require predecessor used and this slot free
      (prev ?prev ?t)
      (used ?prev)
      (free ?t)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      ;; consume the time slot
      (not (free ?t))
      (used ?t)
    )
  )

  ;; sip: produces vase(o0,o1) and removes next(o0,o2)
  (:action sip
    :parameters (?o0 - object ?o1 - object ?o2 - object ?prev - time ?t - time)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
      (prev ?prev ?t)
      (used ?prev)
      (free ?t)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (free ?t))
      (used ?t)
    )
  )

  ;; clip: produces vase(o0,o1) and removes next(o0,o2)
  (:action clip
    :parameters (?o0 - object ?o1 - object ?o2 - object ?prev - time ?t - time)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
      (prev ?prev ?t)
      (used ?prev)
      (free ?t)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (free ?t))
      (used ?t)
    )
  )

  ;; wretched: moves next from (o0,o1) to (o0,o2) given collect constraints
  (:action wretched
    :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object ?prev - time ?t - time)
    :precondition (and
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
      (prev ?prev ?t)
      (used ?prev)
      (free ?t)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (free ?t))
      (used ?t)
    )
  )

  ;; memory: moves next from (o0,o1) to (o0,o2) using springs
  (:action memory
    :parameters (?o0 - object ?o1 - object ?o2 - object ?prev - time ?t - time)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
      (prev ?prev ?t)
      (used ?prev)
      (free ?t)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (free ?t))
      (used ?t)
    )
  )

  ;; tightfisted: requires vase and produces next(o0,o2) and deletes vase
  (:action tightfisted
    :parameters (?o0 - object ?o1 - object ?o2 - object ?prev - time ?t - time)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
      (prev ?prev ?t)
      (used ?prev)
      (free ?t)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (free ?t))
      (used ?t)
    )
  )
)