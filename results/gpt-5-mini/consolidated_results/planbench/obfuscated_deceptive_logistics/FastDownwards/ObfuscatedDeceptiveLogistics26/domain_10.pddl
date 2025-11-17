(define (domain obfuscated_deceptive_logistics26)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o - obj ?p - obj)
    (next ?o - obj ?p - obj)
    (sneeze ?o - obj)
    (stupendous ?o - obj)
    (collect ?o - obj ?p - obj)
    (spring ?o - obj)

    (stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
    (current ?s - stage)
  )

  ;; paltry(h,c,t): requires hand(h), cats(c), texture(t), vase(h,c), next(c,t).
  ;; Effects: add next(h,t), del vase(h,c).
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?s - stage ?snext - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
      (current ?s)
      (succ ?s ?snext)
      (not (current ?snext))
    )
    :effect (and
      (not (current ?s))
      (current ?snext)
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  ;; sip(h,c,t): requires hand(h), cats(c), texture(t), next(h,t), next(c,t).
  ;; Effects: add vase(h,c), del next(h,t).
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?s - stage ?snext - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
      (current ?s)
      (succ ?s ?snext)
      (not (current ?snext))
    )
    :effect (and
      (not (current ?s))
      (current ?snext)
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  ;; clip(h,sneeze,t): requires hand(h), sneeze(sneeze), texture(t), next(sneeze,t), next(h,t).
  ;; Effects: add vase(h,sneeze), del next(h,t).
  (:action clip
    :parameters (?h - obj ?sneeze - obj ?t - obj ?s - stage ?snext - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sneeze)
      (texture ?t)
      (next ?sneeze ?t)
      (next ?h ?t)
      (current ?s)
      (succ ?s ?snext)
      (not (current ?snext))
    )
    :effect (and
      (not (current ?s))
      (current ?snext)
      (vase ?h ?sneeze)
      (not (next ?h ?t))
    )
  )

  ;; wretched(a,b,c,d): requires sneeze(a), texture(b), texture(c), stupendous(d), next(a,b), collect(b,d), collect(c,d).
  ;; Effects: add next(a,c), del next(a,b).
  (:action wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj ?s - stage ?snext - stage)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
      (current ?s)
      (succ ?s ?snext)
      (not (current ?snext))
    )
    :effect (and
      (not (current ?s))
      (current ?snext)
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  ;; memory(c,s1,s2): requires cats(c), spring(s1), spring(s2), next(c,s1).
  ;; Effects: add next(c,s2), del next(c,s1).
  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj ?s - stage ?snext - stage)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
      (current ?s)
      (succ ?s ?snext)
      (not (current ?snext))
    )
    :effect (and
      (not (current ?s))
      (current ?snext)
      (next ?c ?s2)
      (not (next ?c ?s1))
    )
  )

  ;; tightfisted(h,sneeze,t): requires hand(h), sneeze(sneeze), texture(t), next(sneeze,t), vase(h,sneeze).
  ;; Effects: add next(h,t), del vase(h,sneeze).
  (:action tightfisted
    :parameters (?h - obj ?sneeze - obj ?t - obj ?s - stage ?snext - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sneeze)
      (texture ?t)
      (next ?sneeze ?t)
      (vase ?h ?sneeze)
      (current ?s)
      (succ ?s ?snext)
      (not (current ?snext))
    )
    :effect (and
      (not (current ?s))
      (current ?snext)
      (next ?h ?t)
      (not (vase ?h ?sneeze))
    )
  )
)