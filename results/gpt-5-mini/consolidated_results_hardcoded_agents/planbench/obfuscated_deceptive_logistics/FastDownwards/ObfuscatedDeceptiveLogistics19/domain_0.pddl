(define (domain linking-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (next ?a - obj ?b - obj)
    (has-successor ?a - obj)
    (has-predecessor ?b - obj)
  )

  ;; Agent 1 actions
  (:action ag1_link
    :parameters (?x - obj ?y - obj)
    :precondition (and
      (not (has-successor ?x))
      (not (has-predecessor ?y))
    )
    :effect (and
      (next ?x ?y)
      (has-successor ?x)
      (has-predecessor ?y)
    )
  )

  (:action ag1_unlink
    :parameters (?x - obj ?y - obj)
    :precondition (and
      (next ?x ?y)
    )
    :effect (and
      (not (next ?x ?y))
      (not (has-successor ?x))
      (not (has-predecessor ?y))
    )
  )

  ;; Agent 2 actions (distinct from agent 1)
  (:action ag2_link
    :parameters (?x - obj ?y - obj)
    :precondition (and
      (not (has-successor ?x))
      (not (has-predecessor ?y))
    )
    :effect (and
      (next ?x ?y)
      (has-successor ?x)
      (has-predecessor ?y)
    )
  )

  (:action ag2_unlink
    :parameters (?x - obj ?y - obj)
    :precondition (and
      (next ?x ?y)
    )
    :effect (and
      (not (next ?x ?y))
      (not (has-successor ?x))
      (not (has-predecessor ?y))
    )
  )
)