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
    (succ ?t1 - time ?t2 - time)   ;; successor relation between time slots
    (slot-free ?t - time)         ;; time slot available for an action
    (slot-used ?t - time)         ;; time slot has been consumed
  )

  ;; paltry: requires vase(o0,o1) and next(o1,o2); produces next(o0,o2) and removes vase(o0,o1)
  (:action paltry
    :parameters (?o0 - object ?o1 - object ?o2 - object ?pt - time ?t - time)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
      ;; enforce contiguous stage occupancy: predecessor slot consumed, this slot free
      (succ ?pt ?t)
      (slot-used ?pt)
      (slot-free ?t)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (slot-free ?t))
      (slot-used ?t)
    )
  )

  ;; sip: requires next(o0,o2) and next(o1,o2); produces vase(o0,o1) and removes next(o0,o2)
  (:action sip
    :parameters (?o0 - object ?o1 - object ?o2 - object ?pt - time ?t - time)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
      (succ ?pt ?t)
      (slot-used ?pt)
      (slot-free ?t)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (slot-free ?t))
      (slot-used ?t)
    )
  )

  ;; clip: requires next(o1,o2) and next(o0,o2); produces vase(o0,o1) and removes next(o0,o2)
  (:action clip
    :parameters (?o0 - object ?o1 - object ?o2 - object ?pt - time ?t - time)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
      (succ ?pt ?t)
      (slot-used ?pt)
      (slot-free ?t)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (slot-free ?t))
      (slot-used ?t)
    )
  )

  ;; wretched: requires next(o0,o1) and collect relations; moves next from (o0,o1) to (o0,o2)
  (:action wretched
    :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object ?pt - time ?t - time)
    :precondition (and
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
      (succ ?pt ?t)
      (slot-used ?pt)
      (slot-free ?t)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (slot-free ?t))
      (slot-used ?t)
    )
  )

  ;; memory: requires next(o0,o1) and springs; moves next from (o0,o1) to (o0,o2)
  (:action memory
    :parameters (?o0 - object ?o1 - object ?o2 - object ?pt - time ?t - time)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
      (succ ?pt ?t)
      (slot-used ?pt)
      (slot-free ?t)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (slot-free ?t))
      (slot-used ?t)
    )
  )

  ;; tightfisted: requires vase(o0,o1) and next(o1,o2); produces next(o0,o2) and removes vase(o0,o1)
  (:action tightfisted
    :parameters (?o0 - object ?o1 - object ?o2 - object ?pt - time ?t - time)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
      (succ ?pt ?t)
      (slot-used ?pt)
      (slot-free ?t)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (slot-free ?t))
      (slot-used ?t)
    )
  )
)