(define (domain obfuscated_deceptive_logistics_27)
  (:requirements :strips :negative-preconditions)

  (:predicates
    (hand ?o)
    (cats ?o)
    (sneeze ?o)
    (texture ?o)
    (spring ?o)
    (stupendous ?o)
    (next ?o1 ?o2)
    (vase ?o1 ?o2)
    (collect ?o1 ?o2)
  )

  ;; Paltry object_0 object_1 object_2.
  ;; Pre: hand(o0), cats(o1), texture(o2), vase(o0, o1), next(o1, o2)
  ;; Eff: next(o0, o2), not vase(o0, o1)
  (:action paltry
    :parameters (?h ?c ?t)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?c)))
  )

  ;; Sip object_0 object_1 object_2.
  ;; Pre: hand(o0), cats(o1), texture(o2), next(o0, o2), next(o1, o2)
  ;; Eff: vase(o0, o1), not next(o0, o2)
  (:action sip
    :parameters (?h ?c ?t)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t))
    :effect (and (vase ?h ?c) (not (next ?h ?t)))
  )

  ;; Clip object_0 object_1 object_2.
  ;; Pre: hand(o0), sneeze(o1), texture(o2), next(o1, o2), next(o0, o2)
  ;; Eff: vase(o0, o1), not next(o0, o2)
  (:action clip
    :parameters (?h ?s ?t)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?h ?t))
    :effect (and (vase ?h ?s) (not (next ?h ?t)))
  )

  ;; Wretched object_0 object_1 object_2 object_3.
  ;; Pre: sneeze(o0), texture(o1), texture(o2), stupendous(o3), next(o0, o1), collect(o1, o3), collect(o2, o3)
  ;; Eff: next(o0, o2), not next(o0, o1)
  (:action wretched
    :parameters (?s ?t1 ?t2 ?st)
    :precondition (and (sneeze ?s) (texture ?t1) (texture ?t2) (stupendous ?st) 
                       (next ?s ?t1) (collect ?t1 ?st) (collect ?t2 ?st))
    :effect (and (next ?s ?t2) (not (next ?s ?t1)))
  )

  ;; Memory object_0 object_1 object_2.
  ;; Pre: cats(o0), spring(o1), spring(o2), next(o0, o1)
  ;; Eff: next(o0, o2), not next(o0, o1)
  (:action memory
    :parameters (?c ?sp1 ?sp2)
    :precondition (and (cats ?c) (spring ?sp1) (spring ?sp2) (next ?c ?sp1))
    :effect (and (next ?c ?sp2) (not (next ?c ?sp1)))
  )

  ;; Tightfisted object_0 object_1 object_2.
  ;; Pre: hand(o0), sneeze(o1), texture(o2), next(o1, o2), vase(o0, o1)
  ;; Eff: next(o0, o2), not vase(o0, o1)
  (:action tightfisted
    :parameters (?h ?s ?t)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?h ?s))
    :effect (and (next ?h ?t) (not (vase ?h ?s)))
  )
)