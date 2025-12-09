(define (domain hanoi-7)
  (:requirements :strips :typing :negative-preconditions :adl)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)    ; disk ?d is directly on place ?p (disk or peg)
    (clear ?p - place)          ; no disk directly on place ?p (top is free)
    (next ?smaller - disk ?larger - disk) ; immediate size successor: ?larger is the next larger than ?smaller
  )

  ; transitive "larger" derived from the immediate successor chain (keeps :init small)
  (:derived (larger ?big - disk ?small - disk)
    (or
      (next ?small ?big)
      (exists (?mid - disk) (and (next ?small ?mid) (larger ?big ?mid)))
    )
  )

  ; move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?peg - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?peg)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)
      (not (clear ?peg))
    )
  )

  ; move a top disk onto the top of a larger disk
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?target - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?target)
      (larger ?target ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?target)
      (clear ?from)
      (not (clear ?target))
    )
  )
)