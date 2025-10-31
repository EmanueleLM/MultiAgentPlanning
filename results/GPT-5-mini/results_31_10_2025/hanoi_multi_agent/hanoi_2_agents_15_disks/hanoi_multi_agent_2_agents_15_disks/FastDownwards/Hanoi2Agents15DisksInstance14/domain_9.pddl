(define (domain hanoi_multi_agent_exact)
  (:requirements :strips :typing :negative-preconditions)
  (:types pos - object
          disk peg - pos
          agent - object)
  (:predicates
    (on ?d - disk ?x - pos)
    (top ?p - peg ?d - disk)
    (empty ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
    (can_move ?a - agent ?d - disk)
  )

  ;; Move a top disk ?d from ?from to an empty peg ?to when the disk under ?d is another disk ?under.
  (:action move-to-empty-under-disk
    :parameters (?ag - agent ?d - disk ?from - peg ?to - peg ?under - disk)
    :precondition (and
      (top ?from ?d)
      (on ?d ?under)
      (empty ?to)
      (can_move ?ag ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from ?under)
      (not (on ?d ?under))
      (on ?d ?to)
      (not (empty ?to))
      (top ?to ?d)
    )
  )

  ;; Move a top disk ?d from ?from to an empty peg ?to when the disk under ?d is the peg ?under (i.e., ?d was the only disk).
  (:action move-to-empty-under-peg
    :parameters (?ag - agent ?d - disk ?from - peg ?to - peg ?under - peg)
    :precondition (and
      (top ?from ?d)
      (on ?d ?under)
      (empty ?to)
      (can_move ?ag ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (on ?d ?under))
      (on ?d ?to)
      (not (empty ?to))
      (top ?to ?d)
      (empty ?from)
    )
  )

  ;; Move a top disk ?d from ?from to a peg ?to where top disk is ?d2, and the disk under ?d is a disk ?under.
  (:action move-onto-disk-under-disk
    :parameters (?ag - agent ?d - disk ?from - peg ?to - peg ?d2 - disk ?under - disk)
    :precondition (and
      (top ?from ?d)
      (on ?d ?under)
      (top ?to ?d2)
      (smaller ?d ?d2)
      (can_move ?ag ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from ?under)
      (not (on ?d ?under))
      (on ?d ?to)
      (not (top ?to ?d2))
      (top ?to ?d)
    )
  )

  ;; Move a top disk ?d from ?from to a peg ?to where top disk is ?d2, and the disk under ?d is the peg ?under (i.e., ?d was sole disk on ?from).
  (:action move-onto-disk-under-peg
    :parameters (?ag - agent ?d - disk ?from - peg ?to - peg ?d2 - disk ?under - peg)
    :precondition (and
      (top ?from ?d)
      (on ?d ?under)
      (top ?to ?d2)
      (smaller ?d ?d2)
      (can_move ?ag ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (on ?d ?under))
      (on ?d ?to)
      (not (top ?to ?d2))
      (top ?to ?d)
      (empty ?from)
    )
  )
)