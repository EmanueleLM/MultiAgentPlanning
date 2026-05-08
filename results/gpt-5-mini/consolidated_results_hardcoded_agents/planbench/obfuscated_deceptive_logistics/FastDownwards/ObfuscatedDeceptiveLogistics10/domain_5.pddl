(define (domain orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    hand_t cat_t sneeze_t stupendous_t - object
    ;; remaining objects are plain 'object'
  )

  (:predicates
    ;; binary relations and multi-role unary predicates kept as predicates
    (collect ?o1 - object ?o2 - object)
    (vase ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)
    (texture ?o - object)
    (spring ?o - object)
  )

  ;; Action: paltry
  ;; Preconditions: ?h is a hand, ?cat is a cat, ?tex is a texture, vase ?h ?cat, next ?cat ?tex
  ;; Effects: add next ?h ?tex, delete vase ?h ?cat
  (:action paltry
    :parameters (?h - hand_t ?cat - cat_t ?tex - object)
    :precondition (and
      (texture ?tex)
      (vase ?h ?cat)
      (next ?cat ?tex)
    )
    :effect (and
      (next ?h ?tex)
      (not (vase ?h ?cat))
    )
  )

  ;; Action: sip
  ;; Preconditions: ?h is hand, ?cat is cat, ?tex is texture, next ?h ?tex, next ?cat ?tex
  ;; Effects: add vase ?h ?cat, delete next ?h ?tex
  (:action sip
    :parameters (?h - hand_t ?cat - cat_t ?tex - object)
    :precondition (and
      (texture ?tex)
      (next ?h ?tex)
      (next ?cat ?tex)
    )
    :effect (and
      (vase ?h ?cat)
      (not (next ?h ?tex))
    )
  )

  ;; Action: clip
  ;; Preconditions: ?h is hand, ?s is sneeze, ?tex is texture, next ?s ?tex, next ?h ?tex
  ;; Effects: add vase ?h ?s, delete next ?h ?tex
  (:action clip
    :parameters (?h - hand_t ?s - sneeze_t ?tex - object)
    :precondition (and
      (texture ?tex)
      (next ?s ?tex)
      (next ?h ?tex)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?tex))
    )
  )

  ;; Action: wretched
  ;; Preconditions: ?s is sneeze, ?t1 and ?t2 are textures, ?p is stupendous,
  ;;                next ?s ?t1, collect ?t1 ?p, collect ?t2 ?p
  ;; Effects: add next ?s ?t2, delete next ?s ?t1
  (:action wretched
    :parameters (?s - sneeze_t ?t1 - object ?t2 - object ?p - stupendous_t)
    :precondition (and
      (texture ?t1)
      (texture ?t2)
      (collect ?t1 ?p)
      (collect ?t2 ?p)
      (next ?s ?t1)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
    )
  )

  ;; Action: memory
  ;; Preconditions: ?cat is cat, ?s1 and ?s2 are springs, next ?cat ?s1
  ;; Effects: add next ?cat ?s2, delete next ?cat ?s1
  (:action memory
    :parameters (?cat - cat_t ?s1 - object ?s2 - object)
    :precondition (and
      (spring ?s1)
      (spring ?s2)
      (next ?cat ?s1)
    )
    :effect (and
      (next ?cat ?s2)
      (not (next ?cat ?s1))
    )
  )

  ;; Action: tightfisted
  ;; Preconditions: ?h is hand, ?s is sneeze, ?tex is texture, next ?s ?tex, vase ?h ?s
  ;; Effects: add next ?h ?tex, delete vase ?h ?s
  (:action tightfisted
    :parameters (?h - hand_t ?s - sneeze_t ?tex - object)
    :precondition (and
      (texture ?tex)
      (next ?s ?tex)
      (vase ?h ?s)
    )
    :effect (and
      (next ?h ?tex)
      (not (vase ?h ?s))
    )
  )
)