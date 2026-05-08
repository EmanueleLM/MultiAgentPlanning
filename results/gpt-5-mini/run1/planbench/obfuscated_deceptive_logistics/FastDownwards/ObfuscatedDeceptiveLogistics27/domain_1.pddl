(define (domain orchestrator-domain)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?a ?b - obj)
    (next ?a ?b - obj)
    (sneeze ?o - obj)
    (stupendous ?o - obj)
    (collect ?a ?b - obj)
    (spring ?o - obj)
  )

  ;; paltry: hand A, cats B, texture C, vase A B, next B C -> add next A C, delete vase A B
  (:action orchestrator-paltry
    :parameters (?a ?b ?c - obj)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?a ?b)
      (next ?b ?c)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
    )
  )

  ;; sip: hand A, cats B, texture C, next A C, next B C -> add vase A B, delete next A C
  (:action orchestrator-sip
    :parameters (?a ?b ?c - obj)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (next ?a ?c)
      (next ?b ?c)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
    )
  )

  ;; clip: hand A, sneeze B, texture C, next B C, next A C -> add vase A B, delete next A C
  (:action orchestrator-clip
    :parameters (?a ?b ?c - obj)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (next ?a ?c)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
    )
  )

  ;; wretched: sneeze A, texture B, texture C, stupendous D, next A B, collect B D, collect C D
  ;; -> add next A C, delete next A B
  (:action orchestrator-wretched
    :parameters (?a ?b ?c ?d - obj)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  ;; memory: cats A, spring B, spring C, next A B -> add next A C, delete next A B
  (:action orchestrator-memory
    :parameters (?a ?b ?c - obj)
    :precondition (and
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  ;; tightfisted: hand A, sneeze B, texture C, next B C, vase A B -> add next A C, delete vase A B
  (:action orchestrator-tightfisted
    :parameters (?a ?b ?c - obj)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (vase ?a ?b)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
    )
  )

)