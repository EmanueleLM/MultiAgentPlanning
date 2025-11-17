(define (domain ObfuscatedDeceptiveLogistics10)
  (:requirements :strips :typing :negative-preconditions)
  (:types object time)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?a - object ?b - object)
    (next ?a - object ?b - object)
    (sneeze ?o - object)
    (collect ?a - object ?b - object)
    (spring ?o - object)
    (stupendous ?o - object)

    ;; discrete ordered time slots to enforce strict sequential execution
    (succ ?t1 - time ?t2 - time)   ;; successor relation between time slots
    (slot-free ?t - time)         ;; time slot available for an action
    (slot-used ?t - time)         ;; time slot has been consumed
  )

  ;; paltry: requires vase(a,b) and next(b,c); produces next(a,c) and removes vase(a,b)
  (:action paltry
    :parameters (?a - object ?b - object ?c - object ?pt - time ?t - time)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?a ?b)
      (next ?b ?c)
      ;; enforce contiguous stage progression
      (succ ?pt ?t)
      (slot-used ?pt)
      (slot-free ?t)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
      (not (slot-free ?t))
      (slot-used ?t)
    )
  )

  ;; sip: requires next(a,c) and next(b,c); produces vase(a,b) and removes next(a,c)
  (:action sip
    :parameters (?a - object ?b - object ?c - object ?pt - time ?t - time)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (next ?a ?c)
      (next ?b ?c)
      (succ ?pt ?t)
      (slot-used ?pt)
      (slot-free ?t)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
      (not (slot-free ?t))
      (slot-used ?t)
    )
  )

  ;; clip: requires next(b,c) and next(a,c); produces vase(a,b) and removes next(a,c)
  (:action clip
    :parameters (?a - object ?b - object ?c - object ?pt - time ?t - time)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (next ?a ?c)
      (succ ?pt ?t)
      (slot-used ?pt)
      (slot-free ?t)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
      (not (slot-free ?t))
      (slot-used ?t)
    )
  )

  ;; wretched: requires next(a,b) and collect relations; moves next from (a,b) to (a,c)
  (:action wretched
    :parameters (?a - object ?b - object ?c - object ?d - object ?pt - time ?t - time)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
      (succ ?pt ?t)
      (slot-used ?pt)
      (slot-free ?t)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (slot-free ?t))
      (slot-used ?t)
    )
  )

  ;; memory: requires next(a,b) and two springs; moves next from (a,b) to (a,c)
  (:action memory
    :parameters (?a - object ?b - object ?c - object ?pt - time ?t - time)
    :precondition (and
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
      (succ ?pt ?t)
      (slot-used ?pt)
      (slot-free ?t)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (slot-free ?t))
      (slot-used ?t)
    )
  )

  ;; tightfisted: requires vase(a,b) and next(b,c); produces next(a,c) and removes vase(a,b)
  (:action tightfisted
    :parameters (?a - object ?b - object ?c - object ?pt - time ?t - time)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (vase ?a ?b)
      (succ ?pt ?t)
      (slot-used ?pt)
      (slot-free ?t)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
      (not (slot-free ?t))
      (slot-used ?t)
    )
  )
)