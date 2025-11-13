(define (domain ObfuscatedDeceptiveLogistics8)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o - obj ?p - obj)
    (next ?o - obj ?p - obj)
    (sneeze ?o - obj)
    (collect ?o - obj ?p - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)

    ;; Stage/ordering predicates to enforce a single linear progression of actions
    (succ ?s1 - stage ?s2 - stage)
    (available ?s - stage)
  )

  ;; paltry
  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?st - stage ?stn - stage)
    :precondition (and
      (available ?st)
      (succ ?st ?stn)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (not (available ?st))
      (available ?stn)
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

  ;; sip
  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?st - stage ?stn - stage)
    :precondition (and
      (available ?st)
      (succ ?st ?stn)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (not (available ?st))
      (available ?stn)
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  ;; clip
  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?st - stage ?stn - stage)
    :precondition (and
      (available ?st)
      (succ ?st ?stn)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (not (available ?st))
      (available ?stn)
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  ;; wretched
  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj ?st - stage ?stn - stage)
    :precondition (and
      (available ?st)
      (succ ?st ?stn)
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      (not (available ?st))
      (available ?stn)
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  ;; memory
  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?st - stage ?stn - stage)
    :precondition (and
      (available ?st)
      (succ ?st ?stn)
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (not (available ?st))
      (available ?stn)
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  ;; tightfisted
  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?st - stage ?stn - stage)
    :precondition (and
      (available ?st)
      (succ ?st ?stn)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
    )
    :effect (and
      (not (available ?st))
      (available ?stn)
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )
)