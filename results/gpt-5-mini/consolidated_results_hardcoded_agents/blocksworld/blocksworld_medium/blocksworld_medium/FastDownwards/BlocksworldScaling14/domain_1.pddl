(define (domain blocks-multiagent-sequential)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table - place agent stage place)

  (:predicates
    (on ?b - block ?p - place)          ; block ?b is directly on place ?p (block or table)
    (clear ?b - block)                  ; no block is on top of block ?b
    (holding ?a - agent ?b - block)     ; agent ?a is holding block ?b
    (handfree ?a - agent)               ; agent ?a's hand is empty
    (current-stage ?s - stage)          ; the system is at stage ?s
    (succ ?s1 - stage ?s2 - stage)      ; s2 is the successor of s1 (linear time progression)
  )

  ;; All manipulation actions consume exactly one stage step:
  ;; they require the current stage and advance to its successor. This enforces
  ;; single-action-at-a-time, contiguous stage occupancy, and a strict ordering.

  (:action pick-up
    :parameters (?a - agent ?b - block ?t - table ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (handfree ?a)
      (on ?b ?t)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?t))
      (not (handfree ?a))
      (holding ?a ?b)
      ;; kept clear ?b because a held block has nothing on top of it
      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

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
      (clear ?c)   ; the block underneath becomes clear after removing top
      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action put-down
    :parameters (?a - agent ?b - block ?t - table ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (holding ?a ?b)
    )
    :effect (and
      (not (holding ?a ?b))
      (on ?b ?t)
      (handfree ?a)
      (clear ?b)   ; block on table is top and hence clear
      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

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
      (not (clear ?c)) ; target block now has something on top
      (clear ?b)       ; placed block is top and clear
      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)