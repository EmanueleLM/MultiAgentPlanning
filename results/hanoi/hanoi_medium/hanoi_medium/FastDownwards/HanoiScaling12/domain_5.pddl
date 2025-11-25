(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; A disk is directly supported by a peg
    (on-peg ?d - disk ?p - peg)
    ;; A disk is directly supported by another disk
    (on-disk ?d - disk ?under - disk)

    ;; No disk directly on top of ?d (i.e., ?d is the top disk of its stack)
    (clear-disk ?d - disk)
    ;; Peg has no disks (empty)
    (clear-peg ?p - peg)

    ;; Strict size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; Discrete time/stage marker and successor relation
    (time-now ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  ;; Move a top disk that is directly on a peg to an empty peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (time-now ?s)
      (next ?s ?s2)
      ;; distinct pegs
      (not (= ?from ?to))
    )
    :effect (and
      ;; relocate disk
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; update peg emptiness
      (clear-peg ?from)
      (not (clear-peg ?to))

      ;; moved disk is top on its new support
      (clear-disk ?d)

      ;; time progression
      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; Move a top disk that is directly on a peg onto a top disk on another peg.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (time-now ?s)
      (next ?s ?s2)
      ;; ensure disk and peg are distinct entities (redundant by typing but explicit)
      (not (= ?d ?to))
    )
    :effect (and
      ;; relocate: disk now on top of destination disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; source peg becomes empty
      (clear-peg ?from)
      ;; destination disk is no longer clear
      (not (clear-disk ?to))

      ;; moved disk is top on its new support
      (clear-disk ?d)

      ;; time progression
      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk to an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (time-now ?s)
      (next ?s ?s2)
      ;; moved disk distinct from its support and destination (typed distinctness explicit)
      (not (= ?d ?from))
    )
    :effect (and
      ;; remove old support and place disk on peg
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; supporting disk becomes top
      (clear-disk ?from)

      ;; destination peg no longer empty
      (not (clear-peg ?to))

      ;; moved disk is top on its new support
      (clear-disk ?d)

      ;; time progression
      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk onto a top disk on another peg.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (time-now ?s)
      (next ?s ?s2)
      ;; enforce distinctness between involved disks to avoid self-support cycles
      (not (= ?d ?from))
      (not (= ?d ?to))
      (not (= ?from ?to))
    )
    :effect (and
      ;; relocate: remove old support and add new support
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; supporting disk becomes top
      (clear-disk ?from)
      ;; destination disk is no longer top
      (not (clear-disk ?to))

      ;; moved disk is top on its new support
      (clear-disk ?d)

      ;; time progression
      (not (time-now ?s))
      (time-now ?s2)
    )
  )
)