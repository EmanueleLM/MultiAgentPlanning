(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; Direct support relations
    (on-peg ?d - disk ?p - peg)     ; ?d is directly on peg ?p (bottom of that peg's stack)
    (on-disk ?d - disk ?under - disk) ; ?d is directly on top of disk ?under

    ;; Top markers
    (clear-disk ?d - disk)         ; no disk on top of ?d (i.e., ?d is top of its stack)
    (clear-peg ?p - peg)           ; peg ?p has no disks (empty)

    ;; Size ordering (static)
    (smaller ?d1 - disk ?d2 - disk)

    ;; Discrete stage/time markers
    (time-now ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  ;; Move a top disk that is directly on a peg to an empty peg.
  ;; Preconditions guarantee that the disk is the only disk on its source peg, so source peg becomes empty.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (time-now ?s)
      (next ?s ?s2)
      (not (= ?from ?to))
    )
    :effect (and
      ;; change support of ?d
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; source peg becomes empty; destination peg no longer empty
      (clear-peg ?from)
      (not (clear-peg ?to))

      ;; moved disk is top on its new support (it was already clear)
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
      (not (= ?d ?to))
    )
    :effect (and
      ;; relocate disk from its peg to be on top of destination disk
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

  ;; Move a top disk that is directly on another disk to an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (time-now ?s)
      (next ?s ?s2)
      (not (= ?d ?from))
    )
    :effect (and
      ;; remove old support and place on peg
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
      (not (= ?d ?from))
      (not (= ?d ?to))
      (not (= ?from ?to))
    )
    :effect (and
      ;; change support: remove old and add new
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; supporting disk becomes top, destination disk no longer top
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