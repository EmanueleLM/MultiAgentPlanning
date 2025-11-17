(define (domain obfuscated-deceptive-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    hand-object - object
    cat-object - object
    texture-object - object
    sneeze-object - object
    stupendous-object - object
    stage
  )

  (:predicates
    (vase ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)
    (collect ?o1 - object ?o2 - object)
    (spring ?o - object)
    ;; discrete-stage progression predicates
    (succ ?s1 - stage ?s2 - stage)
    (now ?s - stage)
  )

  ;; paltry action
  (:action paltry
    :parameters (?o0 - hand-object ?o1 - cat-object ?o2 - texture-object ?from - stage ?to - stage)
    :precondition (and
      (now ?from)
      (succ ?from ?to)
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
    :parameters (?o0 - hand-object ?o1 - cat-object ?o2 - texture-object ?from - stage ?to - stage)
    :precondition (and
      (now ?from)
      (succ ?from ?to)
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
    :parameters (?o0 - hand-object ?o1 - sneeze-object ?o2 - texture-object ?from - stage ?to - stage)
    :precondition (and
      (now ?from)
      (succ ?from ?to)
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
    :parameters (?o0 - sneeze-object ?o1 - texture-object ?o2 - texture-object ?o3 - stupendous-object ?from - stage ?to - stage)
    :precondition (and
      (now ?from)
      (succ ?from ?to)
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
    :parameters (?o0 - cat-object ?o1 - object ?o2 - object ?from - stage ?to - stage)
    :precondition (and
      (now ?from)
      (succ ?from ?to)
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
    :parameters (?o0 - hand-object ?o1 - sneeze-object ?o2 - texture-object ?from - stage ?to - stage)
    :precondition (and
      (now ?from)
      (succ ?from ?to)
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