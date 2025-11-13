(define (domain obfuscated-deceptive-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)
    (sneeze ?o - object)
    (collect ?o1 - object ?o2 - object)
    (spring ?o - object)
    (stupendous ?o - object)
    ;; discrete-stage progression predicates
    (succ ?s1 - stage ?s2 - stage)
    (now ?s - stage)
  )

  ;; paltry action: moves the global stage forward from ?from to ?to
  (:action paltry
    :parameters (?o0 - object ?o1 - object ?o2 - object ?from - stage ?to - stage)
    :precondition (and
      (now ?from)
      (succ ?from ?to)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (not (now ?from))
      (now ?to)
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

  ;; sip action
  (:action sip
    :parameters (?o0 - object ?o1 - object ?o2 - object ?from - stage ?to - stage)
    :precondition (and
      (now ?from)
      (succ ?from ?to)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (not (now ?from))
      (now ?to)
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  ;; clip action
  (:action clip
    :parameters (?o0 - object ?o1 - object ?o2 - object ?from - stage ?to - stage)
    :precondition (and
      (now ?from)
      (succ ?from ?to)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (not (now ?from))
      (now ?to)
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  ;; wretched action
  (:action wretched
    :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object ?from - stage ?to - stage)
    :precondition (and
      (now ?from)
      (succ ?from ?to)
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      (not (now ?from))
      (now ?to)
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  ;; memory action
  (:action memory
    :parameters (?o0 - object ?o1 - object ?o2 - object ?from - stage ?to - stage)
    :precondition (and
      (now ?from)
      (succ ?from ?to)
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (not (now ?from))
      (now ?to)
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  ;; tightfisted action
  (:action tightfisted
    :parameters (?o0 - object ?o1 - object ?o2 - object ?from - stage ?to - stage)
    :precondition (and
      (now ?from)
      (succ ?from ?to)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
    )
    :effect (and
      (not (now ?from))
      (now ?to)
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )
)