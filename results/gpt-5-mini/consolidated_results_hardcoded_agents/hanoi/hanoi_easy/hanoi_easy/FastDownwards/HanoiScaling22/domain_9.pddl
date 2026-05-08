(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)       ; disk directly on a peg (bottom disk of that peg)
    (on-disk ?d - disk ?below - disk) ; disk directly on top of another disk

    (clear-peg ?p - peg)              ; peg has no disks
    (clear-disk ?d - disk)            ; disk has no disk on top (is top)

    (smaller ?d1 - disk ?d2 - disk)   ; static size ordering: d1 is smaller than d2

    (current ?s - stage)              ; currently active stage
    (succ ?s1 - stage ?s2 - stage)    ; stage successor relation
  )

  ;; Move a disk that is the only disk on its peg to an empty peg (advance stage).
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)    ; must be the top disk (and since it's on-peg it is the only disk on that peg)
      (clear-peg ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; origin peg becomes empty, destination peg no longer empty
      (clear-peg ?from)
      (not (clear-peg ?to))

      ;; moved disk is top at destination
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
      (clear-disk ?d)     ; ?d must be the top disk of its stack
      (clear-peg ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      ;; the disk below becomes the new top of its stack
      (clear-disk ?below)

      ;; destination peg now occupied
      (not (clear-peg ?to))

      ;; moved disk is top at destination
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is the only disk on its peg onto another top disk (advance stage).
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)   ; cannot place larger on smaller
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

      ;; moved disk is top over destination
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

      ;; disk below becomes the new top of its original stack
      (clear-disk ?below)

      ;; destination disk no longer clear (has disk on top)
      (not (clear-disk ?to))

      ;; moved disk is top over destination
      (clear-disk ?d)
    )
  )
)