(define (domain blocks-multiagent-sequential)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent stage)

  (:predicates
    (on ?b - block ?c - block)        ; block ?b is on block ?c
    (on-table ?b - block)             ; block ?b is on the table
    (clear ?b - block)                ; no block on top of block ?b AND the block is not being held
    (holding ?a - agent ?b - block)   ; agent ?a is holding block ?b
    (handfree ?a - agent)             ; agent ?a's hand is empty
    (current-stage ?s - stage)        ; the system is at stage ?s
    (succ ?s1 - stage ?s2 - stage)    ; s2 is the successor of s1
  )

  ;; Pick up a clear block from the table
  (:action pick-up
    :parameters (?a - agent ?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (handfree ?a)
      (on-table ?b)
      (clear ?b)
    )
    :effect (and
      (not (on-table ?b))
      (not (handfree ?a))
      (holding ?a ?b)
      ;; when a block is picked up it is no longer considered clear (it's being held)
      (not (clear ?b))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Unstack a clear block from on top of another block
  (:action unstack
    :parameters (?a - agent ?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (handfree ?a)
      (on ?b ?c)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?c))
      (not (handfree ?a))
      (holding ?a ?b)
      ;; the block that was underneath becomes clear when the top block is removed
      (clear ?c)
      ;; the held block is not clear while being held
      (not (clear ?b))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Put down a held block onto the table
  (:action put-down
    :parameters (?a - agent ?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (holding ?a ?b)
    )
    :effect (and
      (not (holding ?a ?b))
      (on-table ?b)
      (handfree ?a)
      ;; a block put on the table has no block on top (is clear)
      (clear ?b)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Stack a held block on top of another clear block
  (:action stack
    :parameters (?a - agent ?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (holding ?a ?b)
      (clear ?c)
    )
    :effect (and
      (not (holding ?a ?b))
      (on ?b ?c)
      (handfree ?a)
      ;; the block underneath is no longer clear
      (not (clear ?c))
      ;; the placed block is clear (no block on top)
      (clear ?b)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)