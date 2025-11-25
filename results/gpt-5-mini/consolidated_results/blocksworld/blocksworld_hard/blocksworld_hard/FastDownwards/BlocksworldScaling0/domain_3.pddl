(define (domain pddl_orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types block step)
  (:predicates
    (on ?x - block ?y - block)        ; ?x is on ?y
    (ontable ?x - block)              ; ?x is on the table
    (clear ?x - block)                ; nothing on top of ?x (and not currently held)
    (holding ?x - block)              ; agent is holding ?x
    (handempty)                       ; agent's hand is empty
    (current ?s - step)               ; current stage/step
    (next ?s1 - step ?s2 - step)      ; successor relation between stages
  )

  ; Pick a clear block from the table into the hand, advance stage
  (:action pick-up
    :parameters (?b - block ?s - step ?s2 - step)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (not (current ?s))
      (current ?s2)
    )
  )

  ; Put the held block down on the table, advance stage
  (:action put-down
    :parameters (?b - block ?s - step ?s2 - step)
    :precondition (and
      (holding ?b)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (current ?s))
      (current ?s2)
    )
  )

  ; Stack the held block onto a clear block, advance stage
  (:action stack
    :parameters (?b - block ?x - block ?s - step ?s2 - step)
    :precondition (and
      (holding ?b)
      (clear ?x)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (on ?b ?x)
      (not (ontable ?b))
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?x))
      (not (current ?s))
      (current ?s2)
    )
  )

  ; Unstack a clear block from on top of another block into the hand, advance stage
  (:action unstack
    :parameters (?b - block ?x - block ?s - step ?s2 - step)
    :precondition (and
      (on ?b ?x)
      (clear ?b)
      (handempty)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (clear ?x)
      (not (on ?b ?x))
      (not (clear ?b))
      (not (handempty))
      (not (current ?s))
      (current ?s2)
    )
  )
)