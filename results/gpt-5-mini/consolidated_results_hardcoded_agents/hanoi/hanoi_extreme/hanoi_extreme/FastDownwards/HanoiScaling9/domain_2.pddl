(define (domain tower-of-hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types mover disk peg stage)

  (:predicates
    (is-mover ?m - mover)

    ;; Disk location: either directly on a peg, or directly on another disk.
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?below - disk)

    ;; "Clear" means nothing is directly on that object (disk or peg).
    (clear-peg ?p - peg)
    (clear-disk ?d - disk)

    ;; Size ordering: smaller ?d1 ?d2 means ?d1 is strictly smaller than ?d2.
    (smaller ?d1 - disk ?d2 - disk)

    ;; Discrete stage progression (single current stage).
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk that is directly on a peg to an empty peg.
  (:action move-peg-to-peg
    :parameters (?m - mover ?d - disk ?from - peg ?to - peg ?s - stage ?ns - stage)
    :precondition (and
      (is-mover ?m)
      (on-peg ?d ?from)
      (clear-disk ?d)        ;; disk ?d must be top of its peg
      (clear-peg ?to)        ;; destination peg must be empty
      (current ?s)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; destination peg is no longer empty
      (not (clear-peg ?to))

      ;; source peg becomes empty because the moved disk was directly on the peg and was top
      (clear-peg ?from)

      ;; stage progression
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a top disk that is directly on a peg onto another top disk.
  (:action move-peg-to-disk
    :parameters (?m - mover ?d - disk ?from - peg ?to - disk ?s - stage ?ns - stage)
    :precondition (and
      (is-mover ?m)
      (on-peg ?d ?from)
      (clear-disk ?d)        ;; ?d must be top on its source peg
      (clear-disk ?to)       ;; destination disk must be top
      (smaller ?d ?to)       ;; cannot place larger on smaller
      (current ?s)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; destination disk now has something on it, so it is not clear
      (not (clear-disk ?to))

      ;; source peg becomes empty because the moved disk was directly on the peg and was top
      (clear-peg ?from)

      ;; stage progression
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a top disk that is directly on another disk onto an empty peg.
  (:action move-disk-to-peg
    :parameters (?m - mover ?d - disk ?below - disk ?to - peg ?s - stage ?ns - stage)
    :precondition (and
      (is-mover ?m)
      (on-disk ?d ?below)
      (clear-disk ?d)        ;; ?d must be top
      (clear-peg ?to)        ;; destination peg must be empty
      (current ?s)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      ;; destination peg no longer empty
      (not (clear-peg ?to))

      ;; the disk below becomes top (clear) after removing ?d
      (clear-disk ?below)

      ;; stage progression
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a top disk that is directly on another disk onto another top disk.
  (:action move-disk-to-disk
    :parameters (?m - mover ?d - disk ?below - disk ?to - disk ?s - stage ?ns - stage)
    :precondition (and
      (is-mover ?m)
      (on-disk ?d ?below)
      (clear-disk ?d)        ;; ?d must be top
      (clear-disk ?to)       ;; destination disk must be top
      (smaller ?d ?to)       ;; cannot place larger on smaller
      (current ?s)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?to)

      ;; destination disk no longer clear
      (not (clear-disk ?to))

      ;; disk below becomes clear/top
      (clear-disk ?below)

      ;; stage progression
      (not (current ?s))
      (current ?ns)
    )
  )
)