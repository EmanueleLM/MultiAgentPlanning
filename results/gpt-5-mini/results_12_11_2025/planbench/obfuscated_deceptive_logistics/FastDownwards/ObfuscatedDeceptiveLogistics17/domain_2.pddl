(define (domain obfuscated-deceptive-logistics17)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj time)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)

    ;; explicit discrete time/stage modeling
    (time-point ?t - time)
    (succ ?t1 - time ?t2 - time)  ;; successor relation between time points (static)
    (current ?t - time)           ;; single current time token enforces strict ordering
  )

  ;; paltry object_0 object_1 object_2.
  ;; Preconditions: hand O0, cats O1, texture O2, vase O0 O1, next O1 O2, current ?t, succ ?t ?t2
  ;; Effects: add next O0 O2, del vase O0 O1, advance time token
  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - time ?t2 - time)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; sip object_0 object_1 object_2.
  ;; Preconditions: hand O0, cats O1, texture O2, next O0 O2, next O1 O2, current ?t, succ ?t ?t2
  ;; Effects: add vase O0 O1, del next O0 O2, advance time token
  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - time ?t2 - time)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; clip object_0 object_1 object_2.
  ;; Preconditions: hand O0, sneeze O1, texture O2, next O1 O2, next O0 O2, current ?t, succ ?t ?t2
  ;; Effects: add vase O0 O1, del next O0 O2, advance time token
  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - time ?t2 - time)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; wretched object_0 object_1 object_2 object_3.
  ;; Preconditions: sneeze O0, texture O1, texture O2, stupendous O3, next O0 O1, collect O1 O3, collect O2 O3, current ?t, succ ?t ?t2
  ;; Effects: add next O0 O2, del next O0 O1, advance time token
  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj ?t - time ?t2 - time)
    :precondition (and
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; memory object_0 object_1 object_2.
  ;; Preconditions: cats O0, spring O1, spring O2, next O0 O1, current ?t, succ ?t ?t2
  ;; Effects: add next O0 O2, del next O0 O1, advance time token
  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - time ?t2 - time)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; tightfisted object_0 object_1 object_2.
  ;; Preconditions: hand O0, sneeze O1, texture O2, next O1 O2, vase O0 O1, current ?t, succ ?t ?t2
  ;; Effects: add next O0 O2, del vase O0 O1, advance time token
  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - time ?t2 - time)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (current ?t))
      (current ?t2)
    )
  )
)