(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)      ; disk directly on a peg (i.e., bottom disk on that peg)
    (on-disk ?d - disk ?below - disk)    ; disk directly on top of another disk

    (clear-peg ?p - peg)             ; peg has no disks on it
    (clear-disk ?d - disk)           ; disk has no disk on top of it (is top)

    (smaller ?d1 - disk ?d2 - disk)  ; static size ordering: d1 is smaller than d2

    (current ?s - stage)             ; currently active stage
    (succ ?s1 - stage ?s2 - stage)   ; stage successor relation (discrete time progression)
  )

  ;; Move a top disk that is the only disk on its peg to an empty peg (advance stage).
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

      ;; origin peg becomes empty, destination peg no longer empty
      (clear-peg ?from)
      (not (clear-peg ?to))

      ;; moved disk remains the top disk
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is on another disk to an empty peg (advance stage).
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

      ;; below disk becomes top
      (clear-disk ?below)

      ;; destination peg no longer empty
      (not (clear-peg ?to))

      ;; moved disk remains top
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is the only disk on its peg onto a top disk (advance stage).
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

      ;; origin peg becomes empty
      (clear-peg ?from)

      ;; destination disk no longer clear (has disk on top)
      (not (clear-disk ?to))

      ;; moved disk remains top
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is on another disk onto another top disk (advance stage).
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

      ;; below disk becomes top
      (clear-disk ?below)

      ;; destination disk no longer clear
      (not (clear-disk ?to))

      ;; moved disk remains top
      (clear-disk ?d)
    )
  )
)