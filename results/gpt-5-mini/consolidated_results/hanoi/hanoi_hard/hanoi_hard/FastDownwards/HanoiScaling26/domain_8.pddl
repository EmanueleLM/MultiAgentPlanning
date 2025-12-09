(define (domain tower-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; location relations: a disk is either directly on a peg or directly on another disk
    (on-disk ?d - disk ?s - disk)
    (on-peg  ?d - disk ?p - peg)

    ;; topness / emptiness
    (clear-disk ?d - disk)  ;; no disk on top of ?d
    (clear-peg  ?p - peg)   ;; no disk on top of ?p

    ;; static size ordering (smaller x y means x is strictly smaller than y)
    (smaller ?d1 - disk ?d2 - disk)

    ;; explicit discrete stage progression
    (succ ?t1 - stage ?t2 - stage)
    (current ?t - stage)

    ;; explicit distinctness facts for pegs to forbid no-op moves (source != destination)
    (diff-peg ?p1 - peg ?p2 - peg)
  )

  ;; Move a top disk that is directly on a peg to an empty different peg (peg->peg).
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?t)
      (succ ?t ?t2)
      (diff-peg ?from ?to)
    )
    :effect (and
      ;; relocate disk
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; peg occupancy updates
      (not (clear-peg ?to))
      (clear-peg ?from)

      ;; moved disk is top (no disk above it)
      (clear-disk ?d)

      ;; time progression
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk that is directly on another disk to an empty peg (disk->peg).
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      ;; relocate disk
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; peg occupancy updates
      (not (clear-peg ?to))
      (clear-disk ?from)

      ;; moved disk is top
      (clear-disk ?d)

      ;; time progression
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk that is directly on a peg onto a top disk (peg->disk), enforcing size ordering.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      ;; relocate disk onto target disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; occupancy updates
      (not (clear-disk ?to))
      (clear-peg ?from)

      ;; moved disk is top
      (clear-disk ?d)

      ;; time progression
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk that is directly on another disk onto another top disk (disk->disk), enforcing size ordering.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)   ;; also enforces ?d != ?to because smaller is strict
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      ;; relocate disk onto target disk
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; occupancy updates: the disk that supported ?d becomes top
      (not (clear-disk ?to))
      (clear-disk ?from)

      ;; moved disk is top
      (clear-disk ?d)

      ;; time progression
      (not (current ?t))
      (current ?t2)
    )
  )
)