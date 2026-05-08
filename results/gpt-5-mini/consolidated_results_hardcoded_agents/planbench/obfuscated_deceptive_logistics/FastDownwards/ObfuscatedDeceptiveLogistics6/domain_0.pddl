(define (domain orchestrated-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (sneeze ?o - object)
    (texture ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (collect ?c - object ?i - object)
    (vase ?a - object ?b - object)
    (next ?a - object ?b - object)
    (startled ?o - object)
  )

  ; Move: replace an existing successor of ?x (?old) with ?y.
  (:action move
    :parameters (?x - object ?old - object ?y - object)
    :precondition (and
      (next ?x ?old)
    )
    :effect (and
      (not (next ?x ?old))
      (next ?x ?y)
    )
  )

  ; Add a collect relation if it does not already exist.
  (:action add_collect
    :parameters (?c - object ?i - object)
    :precondition (and
      (not (collect ?c ?i))
    )
    :effect (and
      (collect ?c ?i)
    )
  )

  ; Remove a collect relation that currently exists.
  (:action remove_collect
    :parameters (?c - object ?i - object)
    :precondition (and
      (collect ?c ?i)
    )
    :effect (and
      (not (collect ?c ?i))
    )
  )

  ; Sneeze_emit: cause a specific successor ?t of ?s to become startled.
  ; (sneeze_emit ?s ?t) requires next(?s,?t) so it is explicit and deterministic.
  (:action sneeze_emit
    :parameters (?s - object ?t - object)
    :precondition (and
      (sneeze ?s)
      (next ?s ?t)
    )
    :effect (and
      (startled ?t)
    )
  )

  ; Press_spring: a hand H pointing at spring S ejects a specific collected item I
  ; by removing the collect and making I the successor of S, replacing an existing successor ?old.
  (:action press_spring_replace
    :parameters (?h - object ?s - object ?old - object ?i - object)
    :precondition (and
      (hand ?h)
      (spring ?s)
      (next ?h ?s)
      (collect ?s ?i)
      (next ?s ?old)
    )
    :effect (and
      (not (collect ?s ?i))
      (not (next ?s ?old))
      (next ?s ?i)
    )
  )

  ; The domain action schemas provided in the specification are encoded below.
  ; Where an action adds next(?x, ?z) the schema enforces the functional-next invariant
  ; by requiring and deleting the current next(?x, ?old) (an explicit parameter).
  ; This avoids implicit bookkeeping shortcuts and maintains a deterministic update of next.

  (:action paltry
    :parameters (?x - object ?y - object ?z - object ?old - object)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
      (next ?x ?old)
    )
    :effect (and
      (not (vase ?x ?y))
      (not (next ?x ?old))
      (next ?x ?z)
    )
  )

  (:action sip
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
    )
  )

  (:action clip
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
    )
  )

  (:action wretched
    :parameters (?x - object ?y - object ?z - object ?w - object)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?w)
      (next ?x ?y)
      (collect ?y ?w)
      (collect ?z ?w)
    )
    :effect (and
      (not (next ?x ?y))
      (next ?x ?z)
    )
  )

  (:action memory
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
    )
    :effect (and
      (not (next ?x ?y))
      (next ?x ?z)
    )
  )

  ; tightfisted adds next(?x,?z) when vase(?x,?y) and next(?y,?z) hold.
  ; Enforce uniqueness of next by replacing an explicit existing successor ?old of ?x.
  (:action tightfisted
    :parameters (?x - object ?y - object ?z - object ?old - object)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
      (next ?x ?old)
    )
    :effect (and
      (not (vase ?x ?y))
      (not (next ?x ?old))
      (next ?x ?z)
    )
  )
)