(define (domain pddl_orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)        ; ?x is on ?y
    (ontable ?x - block)              ; ?x is on the table
    (clear ?x - block)                ; nothing on top of ?x
    (holding ?x - block)              ; agent is holding ?x
    (handempty)                       ; agent's hand is empty
  )

  ; Pick a clear block from the table into the hand
  (:action pick-up
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
    )
  )

  ; Put the held block down on the table
  (:action put-down
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  ; Stack the held block onto a clear block
  (:action stack
    :parameters (?b - block ?x - block)
    :precondition (and (holding ?b) (clear ?x) (not (= ?b ?x)))
    :effect (and
      (on ?b ?x)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?x))
    )
  )

  ; Unstack a clear block from on top of another block into the hand
  (:action unstack
    :parameters (?b - block ?x - block)
    :precondition (and (on ?b ?x) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (clear ?x)
      (not (on ?b ?x))
      (not (clear ?b))
      (not (handempty))
    )
  )
)