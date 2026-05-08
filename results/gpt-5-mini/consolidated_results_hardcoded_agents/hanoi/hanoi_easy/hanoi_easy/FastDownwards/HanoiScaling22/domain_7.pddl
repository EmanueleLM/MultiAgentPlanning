(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)      ; disk directly supported by a peg (bottom of a stack)
    (on-disk ?d - disk ?p - disk)    ; disk directly supported by another disk

    (clear-peg ?p - peg)             ; peg has no disks on it
    (clear-disk ?d - disk)           ; disk has no disk on top of it (is top)

    (smaller ?d1 - disk ?d2 - disk)  ; static size ordering: d1 is smaller than d2

    (current ?s - stage)             ; currently active stage
    (succ ?s1 - stage ?s2 - stage)   ; stage successor relation (discrete time progression)
  )

  ;; Move a top disk that is directly on a peg to an empty peg (advance stage).
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (clear-peg ?from)
      (not (clear-peg ?to))

      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is directly on another disk to an empty peg (advance stage).
  (:action move-disk-to-peg
    :parameters (?d - disk ?below - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      (clear-disk ?below)
      (not (clear-peg ?to))

      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is directly on a peg onto a top disk (advance stage).
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      (clear-peg ?from)
      (not (clear-disk ?to))

      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is directly on another disk onto another top disk (advance stage).
  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?below))
      (on-disk ?d ?to)

      (clear-disk ?below)
      (not (clear-disk ?to))

      (clear-disk ?d)
    )
  )
)