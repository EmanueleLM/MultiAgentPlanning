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
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?s)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (not (clear-peg ?to))
      (clear-peg ?from)

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
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?s)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      (not (clear-disk ?to))
      (clear-peg ?from)

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
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?s)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      (not (clear-peg ?to))
      (clear-disk ?below)

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
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?s)
      (succ ?s ?ns)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?to)

      (not (clear-disk ?to))
      (clear-disk ?below)

      (not (current ?s))
      (current ?ns)
    )
  )
)