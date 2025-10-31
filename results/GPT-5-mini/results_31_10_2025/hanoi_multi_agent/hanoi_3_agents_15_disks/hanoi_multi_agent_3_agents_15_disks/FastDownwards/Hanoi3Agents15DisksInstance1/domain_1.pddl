(define (domain Hanoi3Agents15DisksInstance1)
  (:requirements :typing :negative-preconditions)
  (:types agent disk peg)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk ?d directly on peg ?p (no disk below)
    (on-disk ?d - disk ?under - disk) ; disk ?d directly on disk ?under
    (clear ?d - disk)                 ; no disk on top of ?d
    (empty ?p - peg)                  ; peg has no disks
    (can-move ?a - agent ?d - disk)   ; agent can move disk
    (smaller ?d1 - disk ?d2 - disk)   ; disk d1 is smaller than disk d2
  )

  ; Move a disk that is directly on a peg to an empty peg
  (:action move-from-peg-to-empty-peg
    :parameters (?ag - agent ?d - disk ?p1 - peg ?p2 - peg)
    :precondition (and
      (can-move ?ag ?d)
      (on-peg ?d ?p1)
      (clear ?d)
      (empty ?p2)
    )
    :effect (and
      (not (on-peg ?d ?p1))
      (on-peg ?d ?p2)
      (not (empty ?p2))
      (empty ?p1)
      (clear ?d)
    )
  )

  ; Move a disk that is directly on a peg onto another disk (which must be clear and larger)
  (:action move-from-peg-to-disk
    :parameters (?ag - agent ?d - disk ?p1 - peg ?v - disk)
    :precondition (and
      (can-move ?ag ?d)
      (on-peg ?d ?p1)
      (clear ?d)
      (clear ?v)
      (smaller ?d ?v)
    )
    :effect (and
      (not (on-peg ?d ?p1))
      (on-disk ?d ?v)
      (not (clear ?v))
      (empty ?p1)
      (clear ?d)
    )
  )

  ; Move a disk that is directly on another disk to an empty peg
  (:action move-from-disk-to-empty-peg
    :parameters (?ag - agent ?d - disk ?u - disk ?p2 - peg)
    :precondition (and
      (can-move ?ag ?d)
      (on-disk ?d ?u)
      (clear ?d)
      (empty ?p2)
    )
    :effect (and
      (not (on-disk ?d ?u))
      (on-peg ?d ?p2)
      (not (empty ?p2))
      (clear ?u)
      (clear ?d)
    )
  )

  ; Move a disk that is directly on another disk onto another disk (dest disk must be clear and larger)
  (:action move-from-disk-to-disk
    :parameters (?ag - agent ?d - disk ?u - disk ?v - disk)
    :precondition (and
      (can-move ?ag ?d)
      (on-disk ?d ?u)
      (clear ?d)
      (clear ?v)
      (smaller ?d ?v)
    )
    :effect (and
      (not (on-disk ?d ?u))
      (on-disk ?d ?v)
      (not (clear ?v))
      (clear ?u)
      (clear ?d)
    )
  )
)