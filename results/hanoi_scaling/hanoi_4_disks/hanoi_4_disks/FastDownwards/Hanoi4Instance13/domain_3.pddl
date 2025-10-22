(define (domain hanoi4instance13)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    (at ?d - disk ?p - peg)
    (on-peg ?d - disk ?p - peg)     ; disk directly on peg (bottom disk)
    (on-disk ?d - disk ?b - disk)   ; disk ?d directly on disk ?b
    (clear-peg ?p - peg)            ; peg has no disks
    (clear-disk ?d - disk)          ; no disk on top of ?d
    (smaller ?s - disk ?b - disk)   ; ?s is smaller than ?b
    (controls ?ag - agent ?p - peg) ; agent controls peg
  )

  ;; Move a top disk that is directly on a peg onto an empty peg
  (:action move-peg-to-peg-empty
    :parameters (?ag - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (controls ?ag ?from)
      (at ?d ?from)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (at ?d ?from))
      (at ?d ?to)

      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (clear-peg ?from)
      (not (clear-peg ?to))
    )
  )

  ;; Move a top disk that is directly on a peg onto another top disk
  (:action move-peg-to-disk
    :parameters (?ag - agent ?d - disk ?from - peg ?target - disk ?to - peg)
    :precondition (and
      (controls ?ag ?from)
      (at ?d ?from)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?target)
      (smaller ?d ?target)
      (at ?target ?to)
    )
    :effect (and
      (not (at ?d ?from))
      (at ?d ?to)

      (not (on-peg ?d ?from))
      (on-disk ?d ?target)

      (clear-peg ?from)
      (not (clear-disk ?target))
    )
  )

  ;; Move a top disk that is directly on another disk onto an empty peg
  (:action move-disk-to-peg-empty
    :parameters (?ag - agent ?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (controls ?ag ?from)
      (on-disk ?d ?below)
      (at ?d ?from)
      (at ?below ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (not (at ?d ?from))
      (at ?d ?to)

      (on-peg ?d ?to)

      (clear-disk ?below)
      (not (clear-peg ?to))
    )
  )

  ;; Move a top disk that is directly on another disk onto another top disk
  (:action move-disk-to-disk
    :parameters (?ag - agent ?d - disk ?below - disk ?from - peg ?target - disk ?to - peg)
    :precondition (and
      (controls ?ag ?from)
      (on-disk ?d ?below)
      (at ?d ?from)
      (at ?below ?from)
      (clear-disk ?d)
      (clear-disk ?target)
      (smaller ?d ?target)
      (at ?target ?to)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (not (at ?d ?from))
      (at ?d ?to)

      (on-disk ?d ?target)

      (clear-disk ?below)
      (not (clear-disk ?target))
    )
  )
)