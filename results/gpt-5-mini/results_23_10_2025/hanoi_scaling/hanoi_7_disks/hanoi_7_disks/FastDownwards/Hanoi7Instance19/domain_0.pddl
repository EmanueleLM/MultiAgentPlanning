(define (domain hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on ?d - disk ?under - disk)        ; disk ?d is directly on top of disk ?under
    (on-peg ?d - disk ?p - peg)         ; disk ?d is directly on peg ?p (i.e., it is the top of that peg)
    (clear ?d - disk)                   ; no disk on top of ?d
    (clear-peg ?p - peg)                ; peg ?p has no disks on it
    (smaller ?d1 - disk ?d2 - disk)     ; ?d1 is strictly smaller than ?d2
  )

  ;; Move a disk that is on another disk onto another disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Move a disk that is on another disk onto an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?p - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear-peg ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (on-peg ?d ?p)
      (not (clear-peg ?p))
      (clear ?from)
    )
  )

  ;; Move a top disk from a peg onto another disk
  (:action move-peg-to-disk
    :parameters (?d - disk ?pfrom - peg ?to - disk)
    :precondition (and
      (on-peg ?d ?pfrom)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-peg ?d ?pfrom))
      (on ?d ?to)
      (not (clear ?to))
      (clear-peg ?pfrom)
    )
  )

  ;; Move a top disk from one peg to an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?pfrom - peg ?pto - peg)
    :precondition (and
      (on-peg ?d ?pfrom)
      (clear ?d)
      (clear-peg ?pto)
    )
    :effect (and
      (not (on-peg ?d ?pfrom))
      (on-peg ?d ?pto)
      (not (clear-peg ?pto))
      (clear-peg ?pfrom)
    )
  )
)