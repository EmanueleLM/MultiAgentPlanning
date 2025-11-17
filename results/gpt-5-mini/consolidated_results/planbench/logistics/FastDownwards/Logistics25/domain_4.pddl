(define (domain Logistics25)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    catType stupendousType sneezeType texturedType handType object  ;; subtypes of object
  )

  (:predicates
    (collect ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)
    (vase ?o1 - object ?o2 - object)
    (spring ?o - object)
  )

  ;; paltry: requires hand (typed), cat (typed), textured (typed), vase(h,c), next(c,t)
  (:action paltry
    :parameters (?h - handType ?c - catType ?t - texturedType)
    :precondition (and
                    (vase ?h ?c)
                    (next ?c ?t)
                  )
    :effect (and
              (next ?h ?t)
              (not (vase ?h ?c))
            )
  )

  ;; sip: requires hand, cat, textured, next(h,t), next(c,t)
  (:action sip
    :parameters (?h - handType ?c - catType ?t - texturedType)
    :precondition (and
                    (next ?h ?t)
                    (next ?c ?t)
                  )
    :effect (and
              (vase ?h ?c)
              (not (next ?h ?t))
            )
  )

  ;; clip: requires hand, sneeze (typed), textured, next(sneeze,t), next(h,t)
  (:action clip
    :parameters (?h - handType ?sneeze - sneezeType ?t - texturedType)
    :precondition (and
                    (next ?sneeze ?t)
                    (next ?h ?t)
                  )
    :effect (and
              (vase ?h ?sneeze)
              (not (next ?h ?t))
            )
  )

  ;; wretched: requires sneeze, two textured args, stupendous (typed), next(a,b), collect(b,d), collect(c,d)
  (:action wretched
    :parameters (?a - sneezeType ?b - texturedType ?c - texturedType ?d - stupendousType)
    :precondition (and
                    (next ?a ?b)
                    (collect ?b ?d)
                    (collect ?c ?d)
                  )
    :effect (and
              (next ?a ?c)
              (not (next ?a ?b))
            )
  )

  ;; memory: requires cat (typed), two spring objects (checked by predicate), next(a,b)
  (:action memory
    :parameters (?a - catType ?b - object ?c - object)
    :precondition (and
                    (spring ?b)
                    (spring ?c)
                    (next ?a ?b)
                  )
    :effect (and
              (next ?a ?c)
              (not (next ?a ?b))
            )
  )

  ;; tightfisted: requires hand (typed), sneeze (typed), textured (typed), next(sneeze,t), vase(h,sneeze)
  (:action tightfisted
    :parameters (?h - handType ?sneeze - sneezeType ?t - texturedType)
    :precondition (and
                    (next ?sneeze ?t)
                    (vase ?h ?sneeze)
                  )
    :effect (and
              (next ?h ?t)
              (not (vase ?h ?sneeze))
            )
  )

)