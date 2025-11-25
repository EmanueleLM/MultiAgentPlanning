(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; direct support relations
    (on-peg ?d - disk ?p - peg)       ; ?d is directly on peg ?p (bottom disk of that peg)
    (on-disk ?d - disk ?under - disk) ; ?d is directly on top of disk ?under

    ;; top/empty markers
    (clear-disk ?d - disk)            ; no disk on top of ?d (i.e., ?d is top of its stack)
    (clear-peg ?p - peg)              ; peg ?p has no disks (empty)

    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk)

    ;; discrete stage/time markers
    (time-now ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  ;; Move a top disk that is the bottom disk of a source peg to an empty destination peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)       ;; ?d is top (and hence the only disk) on ?from
      (clear-peg ?to)       ;; destination peg empty
      (time-now ?s)
      (next ?s ?s2)
      (not (= ?from ?to))
    )
    :effect (and
      ;; relocate bottom/top disk from source peg to destination peg
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; source peg becomes empty; destination peg no longer empty
      (clear-peg ?from)
      (not (clear-peg ?to))

      ;; moved disk remains top on its new support
      (clear-disk ?d)

      ;; time progression (single time-now atom moves forward)
      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; Move a top disk that is the bottom disk of a source peg onto a top disk on another peg.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)    ;; ?d is top (and sole) on ?from
      (clear-disk ?to)   ;; destination disk is top
      (smaller ?d ?to)   ;; size constraint: moved disk must be smaller than destination disk
      (time-now ?s)
      (next ?s ?s2)
      ;; standard distinctness checks (types ensure ?from is peg and ?to is disk)
      (not (= ?from ?to))
    )
    :effect (and
      ;; remove bottom/top disk from source peg and place on destination disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; source peg becomes empty
      (clear-peg ?from)

      ;; destination disk no longer top; moved disk becomes top
      (not (clear-disk ?to))
      (clear-disk ?d)

      ;; time progression
      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk to an empty destination peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)    ;; ?d is the top disk of its peg
      (clear-peg ?to)    ;; destination peg empty
      (time-now ?s)
      (next ?s ?s2)
      (not (= ?d ?from))
      (not (= ?from ?to))
    )
    :effect (and
      ;; detach ?d from supporting disk and place as bottom/top on destination peg
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; supporting disk becomes top
      (clear-disk ?from)

      ;; destination peg now occupied
      (not (clear-peg ?to))

      ;; moved disk is top on new support
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
      (clear-disk ?d)    ;; ?d is top of its peg
      (clear-disk ?to)   ;; destination disk is top
      (smaller ?d ?to)   ;; size constraint
      (time-now ?s)
      (next ?s ?s2)
      (not (= ?d ?from))
      (not (= ?d ?to))
      (not (= ?from ?to))
    )
    :effect (and
      ;; reattach moved disk to new supporting disk
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; supporting disk becomes top; destination disk no longer top
      (clear-disk ?from)
      (not (clear-disk ?to))

      ;; moved disk is top
      (clear-disk ?d)

      ;; time progression
      (not (time-now ?s))
      (time-now ?s2)
    )
  )
)