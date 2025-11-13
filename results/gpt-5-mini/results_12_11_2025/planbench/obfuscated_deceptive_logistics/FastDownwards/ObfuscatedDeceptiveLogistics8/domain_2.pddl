(define (domain ObfuscatedDeceptiveLogistics8)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o ?p - obj)
    (next ?o ?p - obj)
    (sneeze ?o - obj)
    (collect ?o ?p - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    ;; Stage/ordering predicates (explicit discrete stage progression)
    (succ ?s1 ?s2 - stage)    ;; successor relation between stages
    (available ?s - stage)    ;; stage token: exactly one available stage at a time enforces linear ordering
  )

  ;; paltry requires: hand ?o0, cats ?o1, texture ?o2, vase ?o0 ?o1, next ?o1 ?o2
  ;; effect: adds next ?o0 ?o2, deletes vase ?o0 ?o1
  ;; stage parameters: ?st and ?stn enforce ordering (consume ?st, produce ?stn)
  (:action paltry
    :parameters (?o0 ?o1 ?o2 - obj ?st ?stn - stage)
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

  ;; sip requires: hand ?o0, cats ?o1, texture ?o2, next ?o0 ?o2, next ?o1 ?o2
  ;; effect: adds vase ?o0 ?o1, deletes next ?o0 ?o2
  (:action sip
    :parameters (?o0 ?o1 ?o2 - obj ?st ?stn - stage)
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

  ;; clip requires: hand ?o0, sneeze ?o1, texture ?o2, next ?o1 ?o2, next ?o0 ?o2
  ;; effect: adds vase ?o0 ?o1, deletes next ?o0 ?o2
  (:action clip
    :parameters (?o0 ?o1 ?o2 - obj ?st ?stn - stage)
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

  ;; wretched requires: sneeze ?o0, texture ?o1, texture ?o2, stupendous ?o3, next ?o0 ?o1, collect ?o1 ?o3, collect ?o2 ?o3
  ;; effect: adds next ?o0 ?o2, deletes next ?o0 ?o1
  (:action wretched
    :parameters (?o0 ?o1 ?o2 ?o3 - obj ?st ?stn - stage)
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

  ;; memory requires: cats ?o0, spring ?o1, spring ?o2, next ?o0 ?o1
  ;; effect: adds next ?o0 ?o2, deletes next ?o0 ?o1
  (:action memory
    :parameters (?o0 ?o1 ?o2 - obj ?st ?stn - stage)
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

  ;; tightfisted requires: hand ?o0, sneeze ?o1, texture ?o2, next ?o1 ?o2, vase ?o0 ?o1
  ;; effect: adds next ?o0 ?o2, deletes vase ?o0 ?o1
  (:action tightfisted
    :parameters (?o0 ?o1 ?o2 - obj ?st ?stn - stage)
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