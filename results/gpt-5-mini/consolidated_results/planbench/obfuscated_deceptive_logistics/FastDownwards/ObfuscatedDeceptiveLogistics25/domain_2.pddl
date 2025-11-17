(define (domain ObfuscatedDeceptiveLogistics25)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (texture ?o - obj)
    (collect ?a - obj ?b - obj)
    (next ?a - obj ?b - obj)
    (vase ?a - obj ?b - obj)

    ;; temporal progression predicates
    (curr ?t - stage)        ; current time/stage token (single-valued)
    (succ ?t - stage ?t2 - stage) ; successor relation between stages
  )

  ;; paltry(object_0 object_1 object_2) at time ?t -> ?t2
  ;; Preconditions: hand(object_0), cats(object_1), texture(object_2), vase(object_0,object_1), next(object_1,object_2), curr ?t, succ ?t ?t2
  ;; Effects: add next(object_0,object_2), delete vase(object_0,object_1), advance time
  (:action paltry
    :parameters (?object_0 - obj ?object_1 - obj ?object_2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?object_0)
      (cats ?object_1)
      (texture ?object_2)
      (vase ?object_0 ?object_1)
      (next ?object_1 ?object_2)
      (curr ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?object_0 ?object_2)
      (not (vase ?object_0 ?object_1))
      (not (curr ?t))
      (curr ?t2)
    )
  )

  ;; sip(object_0 object_1 object_2) at time ?t -> ?t2
  ;; Preconditions: hand(object_0), cats(object_1), texture(object_2), next(object_0,object_2), next(object_1,object_2), curr ?t, succ ?t ?t2
  ;; Effects: add vase(object_0,object_1), delete next(object_0,object_2), advance time
  (:action sip
    :parameters (?object_0 - obj ?object_1 - obj ?object_2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?object_0)
      (cats ?object_1)
      (texture ?object_2)
      (next ?object_0 ?object_2)
      (next ?object_1 ?object_2)
      (curr ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?object_0 ?object_1)
      (not (next ?object_0 ?object_2))
      (not (curr ?t))
      (curr ?t2)
    )
  )

  ;; clip(object_0 object_1 object_2) at time ?t -> ?t2
  ;; Preconditions: hand(object_0), sneeze(object_1), texture(object_2), next(object_1,object_2), next(object_0,object_2), curr ?t, succ ?t ?t2
  ;; Effects: add vase(object_0,object_1), delete next(object_0,object_2), advance time
  (:action clip
    :parameters (?object_0 - obj ?object_1 - obj ?object_2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?object_0)
      (sneeze ?object_1)
      (texture ?object_2)
      (next ?object_1 ?object_2)
      (next ?object_0 ?object_2)
      (curr ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?object_0 ?object_1)
      (not (next ?object_0 ?object_2))
      (not (curr ?t))
      (curr ?t2)
    )
  )

  ;; wretched(object_0 object_1 object_2 object_3) at time ?t -> ?t2
  ;; Preconditions: sneeze(object_0), texture(object_1), texture(object_2), stupendous(object_3), next(object_0,object_1), collect(object_1,object_3), collect(object_2,object_3), curr ?t, succ ?t ?t2
  ;; Effects: add next(object_0,object_2), delete next(object_0,object_1), advance time
  (:action wretched
    :parameters (?object_0 - obj ?object_1 - obj ?object_2 - obj ?object_3 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (sneeze ?object_0)
      (texture ?object_1)
      (texture ?object_2)
      (stupendous ?object_3)
      (next ?object_0 ?object_1)
      (collect ?object_1 ?object_3)
      (collect ?object_2 ?object_3)
      (curr ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?object_0 ?object_2)
      (not (next ?object_0 ?object_1))
      (not (curr ?t))
      (curr ?t2)
    )
  )

  ;; memory(object_0 object_1 object_2) at time ?t -> ?t2
  ;; Preconditions: cats(object_0), spring(object_1), spring(object_2), next(object_0,object_1), curr ?t, succ ?t ?t2
  ;; Effects: add next(object_0,object_2), delete next(object_0,object_1), advance time
  (:action memory
    :parameters (?object_0 - obj ?object_1 - obj ?object_2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (cats ?object_0)
      (spring ?object_1)
      (spring ?object_2)
      (next ?object_0 ?object_1)
      (curr ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?object_0 ?object_2)
      (not (next ?object_0 ?object_1))
      (not (curr ?t))
      (curr ?t2)
    )
  )

  ;; tightfisted(object_0 object_1 object_2) at time ?t -> ?t2
  ;; Preconditions: hand(object_0), sneeze(object_1), texture(object_2), next(object_1,object_2), vase(object_0,object_1), curr ?t, succ ?t ?t2
  ;; Effects: add next(object_0,object_2), delete vase(object_0,object_1), advance time
  (:action tightfisted
    :parameters (?object_0 - obj ?object_1 - obj ?object_2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?object_0)
      (sneeze ?object_1)
      (texture ?object_2)
      (next ?object_1 ?object_2)
      (vase ?object_0 ?object_1)
      (curr ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?object_0 ?object_2)
      (not (vase ?object_0 ?object_1))
      (not (curr ?t))
      (curr ?t2)
    )
  )

)