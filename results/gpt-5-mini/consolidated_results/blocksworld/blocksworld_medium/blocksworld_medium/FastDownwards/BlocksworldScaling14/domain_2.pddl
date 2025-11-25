(define (domain blocks-multiagent-sequential)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table agent stage)

  (:predicates
    (on ?b - block ?c - block)        ; block ?b is on block ?c
    (on-table ?b - block ?t - table)  ; block ?b is on table ?t
    (clear ?b - block)                ; no block on top of block ?b
    (holding ?a - agent ?b - block)   ; agent ?a is holding block ?b
    (handfree ?a - agent)             ; agent ?a's hand is empty
    (current-stage ?s - stage)        ; the system is at stage ?s
    (succ ?s1 - stage ?s2 - stage)    ; s2 is the successor of s1
  )

  ;; Pick up a clear block from the table
  (:action pick-up
    :parameters (?a - agent ?b - block ?t - table ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (handfree ?a)
      (on-table ?b ?t)
      (clear ?b)
    )
    :effect (and
      (not (on-table ?b ?t))
      (not (handfree ?a))
      (holding ?a ?b)
      ;; the picked block remains clear (no block on it): keep or reassert clear
      (clear ?b)
      ;; advance stage
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
      ;; the block under becomes clear after removal
      (clear ?c)
      ;; the held block remains clear
      (clear ?b)
      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Put down a held block onto the table
  (:action put-down
    :parameters (?a - agent ?b - block ?t - table ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (holding ?a ?b)
    )
    :effect (and
      (not (holding ?a ?b))
      (on-table ?b ?t)
      (handfree ?a)
      ;; block on table is top and hence clear
      (clear ?b)
      ;; advance stage
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
      ;; target block no longer clear
      (not (clear ?c))
      ;; placed block is top and clear
      (clear ?b)
      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)