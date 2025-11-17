(define (domain obfuscated_deceptive_logistics22)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o1 ?o2 - obj)
    (next ?o1 ?o2 - obj)
    (sneeze ?o - obj)
    (collect ?o1 ?o2 - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
  )

  ;; paltry(object_h,object_c,object_t)
  ;; Pre: hand(object_h), cats(object_c), texture(object_t), vase(object_h,object_c), next(object_c,object_t)
  ;; Add: next(object_h,object_t)
  ;; Del: vase(object_h,object_c)
  (:action paltry
    :parameters (?h ?c ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  ;; sip(object_h,object_c,object_t)
  ;; Pre: hand(object_h), cats(object_c), texture(object_t), next(object_h,object_t), next(object_c,object_t)
  ;; Add: vase(object_h,object_c)
  ;; Del: next(object_h,object_t)
  (:action sip
    :parameters (?h ?c ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  ;; clip(object_h,object_sneeze,object_t)
  ;; Pre: hand(object_h), sneeze(object_sneeze), texture(object_t), next(object_sneeze,object_t), next(object_h,object_t)
  ;; Add: vase(object_h,object_sneeze)
  ;; Del: next(object_h,object_t)
  (:action clip
    :parameters (?h ?s ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  ;; wretched(object_a,object_b,object_c,object_stupendous)
  ;; Pre: sneeze(object_a), texture(object_b), texture(object_c), stupendous(object_stupendous),
  ;;      next(object_a,object_b), collect(object_b,object_stupendous), collect(object_c,object_stupendous)
  ;; Add: next(object_a,object_c)
  ;; Del: next(object_a,object_b)
  (:action wretched
    :parameters (?a ?b ?c ?st - obj)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?st)
      (next ?a ?b)
      (collect ?b ?st)
      (collect ?c ?st)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  ;; memory(object_cats,object_spring1,object_spring2)
  ;; Pre: cats(object_cats), spring(object_spring1), spring(object_spring2), next(object_cats,object_spring1)
  ;; Add: next(object_cats,object_spring2)
  ;; Del: next(object_cats,object_spring1)
  (:action memory
    :parameters (?c ?s1 ?s2 - obj)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
    )
  )

  ;; tightfisted(object_h,object_sneeze,object_t)
  ;; Pre: hand(object_h), sneeze(object_sneeze), texture(object_t), next(object_sneeze,object_t), vase(object_h,object_sneeze)
  ;; Add: next(object_h,object_t)
  ;; Del: vase(object_h,object_sneeze)
  (:action tightfisted
    :parameters (?h ?s ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )
)