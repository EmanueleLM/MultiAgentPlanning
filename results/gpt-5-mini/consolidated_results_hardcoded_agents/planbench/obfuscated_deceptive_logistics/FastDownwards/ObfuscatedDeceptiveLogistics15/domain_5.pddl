(define (domain obfuscated-sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    node
    hand cats sneeze texture spring stupendous - node
  )

  (:predicates
    (next ?x - node ?y - node)
    (vase ?x - node ?y - node)
    (collect ?x - node ?y - node)
  )

  ;; paltry object_0 object_1 object_2.
  ;; Preconditions: ?a is hand, ?b is cats, ?c is texture, vase ?a ?b, next ?b ?c
  ;; Effects: add next ?a ?c, delete vase ?a ?b
  (:action paltry
    :parameters (?a - hand ?b - cats ?c - texture)
    :precondition (and
      (vase ?a ?b)
      (next ?b ?c)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
    )
  )

  ;; sip object_0 object_1 object_2.
  ;; Preconditions: ?a is hand, ?b is cats, ?c is texture, next ?a ?c, next ?b ?c
  ;; Effects: add vase ?a ?b, delete next ?a ?c
  (:action sip
    :parameters (?a - hand ?b - cats ?c - texture)
    :precondition (and
      (next ?a ?c)
      (next ?b ?c)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
    )
  )

  ;; clip object_0 object_1 object_2.
  ;; Preconditions: ?a is hand, ?b is sneeze, ?c is texture, next ?b ?c, next ?a ?c
  ;; Effects: add vase ?a ?b, delete next ?a ?c
  (:action clip
    :parameters (?a - hand ?b - sneeze ?c - texture)
    :precondition (and
      (next ?b ?c)
      (next ?a ?c)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
    )
  )

  ;; wretched object_0 object_1 object_2 object_3.
  ;; Preconditions: ?a is sneeze, ?b is texture, ?c is texture, ?d is stupendous,
  ;;                next ?a ?b, collect ?b ?d, collect ?c ?d
  ;; Effects: add next ?a ?c, delete next ?a ?b
  (:action wretched
    :parameters (?a - sneeze ?b - texture ?c - texture ?d - stupendous)
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

  ;; memory object_0 object_1 object_2.
  ;; Preconditions: ?a is cats, ?b is spring, ?c is spring, next ?a ?b
  ;; Effects: add next ?a ?c, delete next ?a ?b
  (:action memory
    :parameters (?a - cats ?b - spring ?c - spring)
    :precondition (and
      (next ?a ?b)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  ;; tightfisted object_0 object_1 object_2.
  ;; Preconditions: ?a is hand, ?b is sneeze, ?c is texture, next ?b ?c, vase ?a ?b
  ;; Effects: add next ?a ?c, delete vase ?a ?b
  (:action tightfisted
    :parameters (?a - hand ?b - sneeze ?c - texture)
    :precondition (and
      (next ?b ?c)
      (vase ?a ?b)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
    )
  )
)