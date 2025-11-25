(define (domain orchestrator-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block)

  (:predicates
    (hand-empty ?a - agent)            ; agent's hand is empty
    (holding ?a - agent ?b - block)    ; agent holds block
    (on ?b1 - block ?b2 - block)       ; block b1 is on block b2
    (on-table ?b - block)              ; block is on the table
    (clear ?b - block)                 ; nothing is on top of block
  )

  ; Pick up a clear block from the table into an agent's single hand
  (:action pickup-from-table
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (hand-empty ?ag)
      (on-table ?b)
      (clear ?b)
    )
    :effect (and
      (not (hand-empty ?ag))
      (holding ?ag ?b)
      (not (on-table ?b))
      ; the held block remains clear (nothing on top of it)
    )
  )

  ; Unstack a clear block from another block into an agent's single hand
  (:action unstack
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and
      (hand-empty ?ag)
      (on ?b ?c)
      (clear ?b)
    )
    :effect (and
      (not (hand-empty ?ag))
      (holding ?ag ?b)
      (not (on ?b ?c))
      (clear ?c)
      ; held block remains clear
    )
  )

  ; Put a held block down onto the table
  (:action put-down-on-table
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (holding ?ag ?b)
    )
    :effect (and
      (hand-empty ?ag)
      (not (holding ?ag ?b))
      (on-table ?b)
      (clear ?b)
    )
  )

  ; Stack a held block onto another clear block
  (:action stack
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and
      (holding ?ag ?b)
      (clear ?c)
      (not (= ?b ?c))
    )
    :effect (and
      (hand-empty ?ag)
      (not (holding ?ag ?b))
      (on ?b ?c)
      (not (clear ?c))
      (clear ?b)
    )
  )
)