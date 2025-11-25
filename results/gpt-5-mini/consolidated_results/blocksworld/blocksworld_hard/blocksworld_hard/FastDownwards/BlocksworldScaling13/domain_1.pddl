(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)    ; ?x is directly on ?y
    (ontable ?x - block)          ; ?x is directly on the table
    (clear ?x - block)            ; no block is on ?x
    (holding ?x - block)          ; the agent is holding ?x
    (handempty)                   ; the agent's hand is empty
    (stage ?s - stage)            ; stage marker type membership (static)
    (next ?s1 - stage ?s2 - stage) ; stage successor relation (static)
    (at-stage ?s - stage)         ; current stage marker (exactly one true)
  )

  ; Pick up a clear block from the table into the hand, advancing one stage
  (:action pickup
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ; Put down a held block onto the table, advancing one stage
  (:action putdown
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?b))
      (handempty)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ; Unstack a clear block from another block into the hand, advancing one stage
  (:action unstack
    :parameters (?b - block ?below - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?b ?below)
      (clear ?b)
      (handempty)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (clear ?below)
      (not (on ?b ?below))
      (not (clear ?b))
      (not (handempty))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ; Stack a held block onto a clear block, advancing one stage
  (:action stack
    :parameters (?b - block ?below - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?below)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (on ?b ?below)
      (clear ?b)
      (not (clear ?below))
      (not (holding ?b))
      (handempty)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)