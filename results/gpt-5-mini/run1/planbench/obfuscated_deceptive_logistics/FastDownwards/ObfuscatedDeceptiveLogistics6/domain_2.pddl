(define (domain orchestrated-domain)
  (:requirements :strips :typing)
  (:types object)

  (:predicates
    (hand ?h - object)
    (cats ?c - object)
    (texture ?t - object)
    (sneeze ?s - object)
    (spring ?s - object)
    (stupendous ?w - object)
    (vase ?a - object ?b - object)
    (next ?a - object ?b - object)
    (collect ?a - object ?b - object)
  )

  ;; Action: paltry
  ;; Preconditions: hand(h), cats(c), texture(t), vase(h,c), next(c,t)
  ;; Effects: add next(h,t), delete vase(h,c)
  (:action paltry
    :parameters (?h - object ?c - object ?t - object)
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

  ;; Action: sip
  ;; Preconditions: hand(h), cats(c), texture(t), next(h,t), next(c,t)
  ;; Effects: add vase(h,c), delete next(h,t)
  (:action sip
    :parameters (?h - object ?c - object ?t - object)
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

  ;; Action: clip
  ;; Preconditions: hand(h), sneeze(s), texture(t), next(s,t), next(h,t)
  ;; Effects: add vase(h,s), delete next(h,t)
  (:action clip
    :parameters (?h - object ?s - object ?t - object)
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

  ;; Action: wretched
  ;; Preconditions: sneeze(s), texture(t1), texture(t2), stupendous(w),
  ;;                next(s,t1), collect(t1,w), collect(t2,w)
  ;; Effects: add next(s,t2), delete next(s,t1)
  (:action wretched
    :parameters (?s - object ?t1 - object ?t2 - object ?w - object)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?w)
      (next ?s ?t1)
      (collect ?t1 ?w)
      (collect ?t2 ?w)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
    )
  )

  ;; Action: memory
  ;; Preconditions: cats(c), spring(s1), spring(s2), next(c,s1)
  ;; Effects: add next(c,s2), delete next(c,s1)
  (:action memory
    :parameters (?c - object ?s1 - object ?s2 - object)
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

  ;; Action: tightfisted
  ;; Preconditions: hand(h), sneeze(s), texture(t), next(s,t), vase(h,s)
  ;; Effects: add next(h,t), delete vase(h,s)
  (:action tightfisted
    :parameters (?h - object ?s - object ?t - object)
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