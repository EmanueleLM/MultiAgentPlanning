(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ; direct support relationships
    (on-disk ?d - disk ?s - disk)    ; disk ?d is directly on disk ?s
    (on-peg  ?d - disk ?p - peg)     ; disk ?d is directly on peg ?p

    ; top-of-peg and emptiness bookkeeping
    (top   ?d - disk ?p - peg)       ; disk ?d is the top disk on peg ?p
    (empty ?p - peg)                 ; peg ?p has no disks

    ; static size ordering
    (smaller ?d1 - disk ?d2 - disk)
  )

  ; Move a disk that is the only disk (directly on the source peg) to an empty destination peg.
  (:action move-bottom-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on-peg ?d ?from)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      ; remove from source support
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (not (empty ?to))

      ; place on destination peg
      (on-peg ?d ?to)
      (top ?d ?to)

      ; source peg becomes empty
      (empty ?from)
    )
  )

  ; Move a disk that is the only disk on the source peg onto the top disk of the destination peg.
  (:action move-bottom-to-top
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?d ?from)
      (on-peg ?d ?from)
      (top ?t ?to)
      (smaller ?d ?t)
      (not (= ?from ?to))
    )
    :effect (and
      ; remove from source support
      (not (on-peg ?d ?from))
      (not (top ?d ?from))

      ; place on the destination disk
      (on-disk ?d ?t)
      (on-peg ?d ?to)
      (top ?d ?to)

      ; destination top disk is no longer top
      (not (top ?t ?to))

      ; source peg becomes empty (since ?d was bottom on that peg)
      (empty ?from)
    )
  )

  ; Move a disk that sits on another disk (not directly on the source peg) to an empty destination peg.
  (:action move-notbottom-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (top ?d ?from)
      (on-disk ?d ?below)
      (on-peg ?d ?from)
      (on-peg ?below ?from)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      ; remove the direct support relation of the moved disk
      (not (on-disk ?d ?below))
      (not (top ?d ?from))

      ; moved disk is now on destination peg and top there
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))

      ; the disk that was below becomes the new top on the source peg
      (top ?below ?from)
      ; moved disk is no longer on the source peg
      (not (on-peg ?d ?from))
    )
  )

  ; Move a disk that sits on another disk onto the top disk of the destination peg.
  (:action move-notbottom-to-top
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?t - disk)
    :precondition (and
      (top ?d ?from)
      (on-disk ?d ?below)
      (on-peg ?d ?from)
      (on-peg ?below ?from)
      (top ?t ?to)
      (smaller ?d ?t)
      (not (= ?from ?to))
    )
    :effect (and
      ; remove the direct support relation of the moved disk
      (not (on-disk ?d ?below))
      (not (top ?d ?from))

      ; moved disk is now directly on disk ?t and top on that peg
      (on-disk ?d ?t)
      (on-peg ?d ?to)
      (top ?d ?to)

      ; destination previous top is no longer top
      (not (top ?t ?to))

      ; the disk that was below becomes the new top on the source peg
      (top ?below ?from)
      ; moved disk is no longer on the source peg
      (not (on-peg ?d ?from))
    )
  )
)