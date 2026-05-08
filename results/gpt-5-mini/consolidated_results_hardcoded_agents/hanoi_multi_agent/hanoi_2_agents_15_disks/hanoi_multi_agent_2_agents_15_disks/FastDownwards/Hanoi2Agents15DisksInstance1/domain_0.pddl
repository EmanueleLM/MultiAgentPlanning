(define (domain hanoi_agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk agent1disk agent2disk peg)

  (:predicates
    (on ?d - disk ?p - peg)           ; disk ?d is on peg ?p (somewhere in stack)
    (above ?d1 - disk ?d2 - disk)     ; ?d1 is immediately above ?d2 on the same peg
    (clear ?d - disk)                 ; ?d is the top disk on its peg (no disk above it)
    (empty ?p - peg)                  ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk)   ; ?d1 is smaller than ?d2 (allowed to place ?d1 on ?d2)
  )

  ;; Agent 1 moves (may move only agent1disk)
  (:action agent1-move-to-empty
    :parameters (?d - agent1disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (empty ?to))
      ;; ?d becomes the top on destination
      (clear ?d)
      ;; source peg may or may not become empty; conservatively remove top status from ?d at source
      (not (clear ?d))
    )
  )

  (:action agent1-move-onto
    :parameters (?d - agent1disk ?from - peg ?to - peg ?top - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (on ?top ?to)
      (clear ?top)
      (smaller ?d ?top)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; update clear predicates: new top on destination is ?d
      (not (clear ?top))
      (clear ?d)
      ;; establish local adjacency: ?d is now immediately above ?top
      (above ?d ?top)
      ;; remove previous top status of ?d at source (conservative)
      (not (clear ?d))
    )
  )

  ;; Agent 2 moves (may move only agent2disk)
  (:action agent2-move-to-empty
    :parameters (?d - agent2disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (empty ?to))
      (clear ?d)
      (not (clear ?d))
    )
  )

  (:action agent2-move-onto
    :parameters (?d - agent2disk ?from - peg ?to - peg ?top - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (on ?top ?to)
      (clear ?top)
      (smaller ?d ?top)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?top))
      (clear ?d)
      (above ?d ?top)
      (not (clear ?d))
    )
  )

)