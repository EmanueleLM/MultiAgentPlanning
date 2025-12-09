(define (domain obfuscated-deceptive-logistics)
  (:requirements :strips :typing :negative-preconditions)
  ;; declare role types as subtypes of the base type `object`
  (:types hand cat sneeze stupendous - object)

  (:predicates
    ;; relations with explicit types
    (vase ?h - hand ?c - cat)
    (next ?x - object ?y - object)
    (collect ?t - object ?st - stupendous)

    ;; properties that may apply to many plain objects
    (texture ?x - object)
    (spring ?x - object)
  )

  ;; paltry: requires a hand, a cat, a texture target, vase(h,c) and next(c,t)
  ;; effects: add next(h,t), delete vase(h,c)
  (:action paltry
    :parameters (?h - hand ?c - cat ?t - object)
    :precondition (and
                    (texture ?t)
                    (vase ?h ?c)
                    (next ?c ?t)
                  )
    :effect (and
              (next ?h ?t)
              (not (vase ?h ?c))
            )
  )

  ;; sip: requires a hand, a cat, a texture target, next(h,t) and next(c,t)
  ;; effects: add vase(h,c), delete next(h,t)
  (:action sip
    :parameters (?h - hand ?c - cat ?t - object)
    :precondition (and
                    (texture ?t)
                    (next ?h ?t)
                    (next ?c ?t)
                  )
    :effect (and
              (vase ?h ?c)
              (not (next ?h ?t))
            )
  )

  ;; clip: requires a hand, a sneeze-source, a texture target, next(s,t) and next(h,t)
  ;; effects: add vase(h,s), delete next(h,t)
  (:action clip
    :parameters (?h - hand ?s - sneeze ?t - object)
    :precondition (and
                    (texture ?t)
                    (next ?s ?t)
                    (next ?h ?t)
                  )
    :effect (and
              (vase ?h ?s)
              (not (next ?h ?t))
            )
  )

  ;; wretched: requires sneeze s, textures t1,t2, a stupendous st, next(s,t1),
  ;;            collect(t1,st), collect(t2,st)
  ;; effects: add next(s,t2), delete next(s,t1)
  (:action wretched
    :parameters (?s - sneeze ?t1 - object ?t2 - object ?st - stupendous)
    :precondition (and
                    (texture ?t1)
                    (texture ?t2)
                    (next ?s ?t1)
                    (collect ?t1 ?st)
                    (collect ?t2 ?st)
                  )
    :effect (and
              (next ?s ?t2)
              (not (next ?s ?t1))
            )
  )

  ;; memory: requires a cat, two springs s1,s2, and next(cat,s1)
  ;; effects: add next(cat,s2), delete next(cat,s1)
  (:action memory
    :parameters (?c - cat ?s1 - object ?s2 - object)
    :precondition (and
                    (spring ?s1)
                    (spring ?s2)
                    (next ?c ?s1)
                  )
    :effect (and
              (next ?c ?s2)
              (not (next ?c ?s1))
            )
  )

  ;; tightfisted: requires a hand, a sneeze-source, a texture target, next(s,t), vase(h,s)
  ;; effects: add next(h,t), delete vase(h,s)
  (:action tightfisted
    :parameters (?h - hand ?s - sneeze ?t - object)
    :precondition (and
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