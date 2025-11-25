(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; A disk is directly on a peg (i.e., its support is the peg)
    (on-peg ?d - disk ?p - peg)
    ;; A disk is directly on top of another disk
    (on-disk ?d - disk ?under - disk)

    ;; No disk directly on top of ?d (i.e., ?d is the top disk of its stack)
    (clear-disk ?d - disk)
    ;; Peg has no disks (empty)
    (clear-peg ?p - peg)

    ;; Strict size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; Global stage marker and successor relation to enforce discrete time progression
    (time-now ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  ;; Move a top disk that sits directly on a peg to an empty peg.
  ;; Preconditions: disk must be directly on source peg and be top; destination peg must be empty; stage progression enforced.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (time-now ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; relocate disk from source peg to destination peg
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; source peg becomes empty (it had the moved disk as its direct occupant)
      (clear-peg ?from)
      ;; destination peg is no longer empty
      (not (clear-peg ?to))

      ;; moved disk remains top of its new stack
      (clear-disk ?d)

      ;; stage progression
      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; Move a top disk that sits directly on a peg onto a top disk on another peg.
  ;; Destination disk must be top and strictly larger than moving disk.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (time-now ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; relocate: remove peg relation, add on-disk relation to destination disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; source peg becomes empty (disk was its direct occupant)
      (clear-peg ?from)
      ;; destination disk is no longer clear (it now has a disk on top)
      (not (clear-disk ?to))

      ;; moved disk is the top disk on its new support
      (clear-disk ?d)

      ;; stage progression
      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; Move a top disk that sits directly on another disk to an empty peg.
  ;; The supporting disk becomes top after the move.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (time-now ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove support relation and place disk on destination peg
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; the supporting disk ?from becomes top
      (clear-disk ?from)

      ;; destination peg is no longer empty
      (not (clear-peg ?to))

      ;; moved disk is the top disk on its new support
      (clear-disk ?d)

      ;; stage progression
      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; Move a top disk that sits directly on another disk onto a top disk on another peg.
  ;; Destination disk must be top and strictly larger than the moving disk.
  ;; The previous supporting disk becomes top after the move.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (time-now ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; relocate: remove old support and add new support
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; supporting disk ?from becomes top
      (clear-disk ?from)
      ;; destination disk is no longer top
      (not (clear-disk ?to))

      ;; moved disk is top on its new support
      (clear-disk ?d)

      ;; stage progression
      (not (time-now ?s))
      (time-now ?s2)
    )
  )
)