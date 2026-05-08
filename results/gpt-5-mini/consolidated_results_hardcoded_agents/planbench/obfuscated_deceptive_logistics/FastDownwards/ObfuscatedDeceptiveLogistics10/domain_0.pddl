(define (domain orchestrated)
  (:requirements :strips :typing)
  (:types object)

  (:predicates
    ;; static/classification predicates (not produced/consumed by operators)
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (collect ?o1 - object ?o2 - object)

    ;; fluents modified by actions
    (vase ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)
  )

  ;; Action: paltry
  ;; Preconditions: hand ?h, cats ?cat, texture ?tex, vase ?h ?cat, next ?cat ?tex
  ;; Effects: add next ?h ?tex, delete vase ?h ?cat
  (:action paltry
    :parameters (?h - object ?cat - object ?tex - object)
    :precondition (and
      (hand ?h)
      (cats ?cat)
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
  ;; Preconditions: hand ?h, cats ?cat, texture ?tex, next ?h ?tex, next ?cat ?tex
  ;; Effects: add vase ?h ?cat, delete next ?h ?tex
  (:action sip
    :parameters (?h - object ?cat - object ?tex - object)
    :precondition (and
      (hand ?h)
      (cats ?cat)
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
  ;; Preconditions: hand ?h, sneeze ?s, texture ?tex, next ?s ?tex, next ?h ?tex
  ;; Effects: add vase ?h ?s, delete next ?h ?tex
  (:action clip
    :parameters (?h - object ?s - object ?tex - object)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
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
  ;; Preconditions: sneeze ?s, texture ?t1, texture ?t2, stupendous ?p,
  ;;                next ?s ?t1, collect ?t1 ?p, collect ?t2 ?p
  ;; Effects: add next ?s ?t2, delete next ?s ?t1
  (:action wretched
    :parameters (?s - object ?t1 - object ?t2 - object ?p - object)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?p)
      (next ?s ?t1)
      (collect ?t1 ?p)
      (collect ?t2 ?p)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
    )
  )

  ;; Action: memory
  ;; Preconditions: cats ?cat, spring ?s1, spring ?s2, next ?cat ?s1
  ;; Effects: add next ?cat ?s2, delete next ?cat ?s1
  (:action memory
    :parameters (?cat - object ?s1 - object ?s2 - object)
    :precondition (and
      (cats ?cat)
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
  ;; Preconditions: hand ?h, sneeze ?s, texture ?tex, next ?s ?tex, vase ?h ?s
  ;; Effects: add next ?h ?tex, delete vase ?h ?s
  (:action tightfisted
    :parameters (?h - object ?s - object ?tex - object)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?tex)
      (next ?s ?tex)
      (vase ?h ?s)
    )
    :effect (and
      (next ?h ?tex)
      (not (vase ?h ?s))
    )
  )

  ;; Conservative seed action to break vase<->next causal cycle if the problem
  ;; does not provide initial next facts for hand objects. This action is
  ;; deliberately minimal: it only requires static type facts (hand, texture)
  ;; and produces next(?h,?tex).
  (:action seed_next_for_hand
    :parameters (?h - object ?tex - object)
    :precondition (and
      (hand ?h)
      (texture ?tex)
    )
    :effect (and
      (next ?h ?tex)
    )
  )
)