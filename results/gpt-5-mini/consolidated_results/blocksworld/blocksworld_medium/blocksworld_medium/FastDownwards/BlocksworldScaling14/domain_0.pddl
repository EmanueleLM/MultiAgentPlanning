(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent place block - place table - place)

  (:predicates
    (on ?b - block ?p - place)        ; block ?b is on place ?p (block or table)
    (clear ?b - block)               ; no block on top of block ?b
    (holding ?a - agent ?b - block)  ; agent ?a is holding block ?b
    (handfree ?a - agent)            ; agent ?a's single hand is free
  )

  ;; Pick a block up from the table into the agent's single hand
  (:action pick-up
    :parameters (?a - agent ?b - block ?t - table)
    :precondition (and
      (handfree ?a)
      (on ?b ?t)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?t))
      (not (handfree ?a))
      (holding ?a ?b)
      ;; block ?b remains clear (nothing on top of it) while held
    )
  )

  ;; Unstack a block from another block into the agent's single hand
  (:action unstack
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and
      (handfree ?a)
      (on ?b ?c)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?c))
      (not (handfree ?a))
      (holding ?a ?b)
      (clear ?c)  ; the block that had ?b on it becomes clear
      ;; ?b remains clear while held
    )
  )

  ;; Put a held block down on the table
  (:action put-down
    :parameters (?a - agent ?b - block ?t - table)
    :precondition (holding ?a ?b)
    :effect (and
      (not (holding ?a ?b))
      (on ?b ?t)
      (handfree ?a)
      (clear ?b)
    )
  )

  ;; Stack a held block onto another block
  (:action stack
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and
      (holding ?a ?b)
      (clear ?c)
    )
    :effect (and
      (not (holding ?a ?b))
      (on ?b ?c)
      (handfree ?a)
      (not (clear ?c)) ; target block now has something on top
      (clear ?b)       ; placed block is clear (top of stack)
    )
  )
)