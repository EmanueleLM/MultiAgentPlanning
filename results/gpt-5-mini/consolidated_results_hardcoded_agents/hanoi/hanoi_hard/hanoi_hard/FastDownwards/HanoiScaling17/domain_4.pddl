(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk placement relations
    (on-peg ?d - disk ?p - peg)       ; ?d is directly on ?p (bottom-most disk of that peg)
    (on-disk ?d - disk ?below - disk) ; ?d is directly on top of ?below

    ;; top-of-peg and peg emptiness
    (top ?d - disk ?p - peg)          ; ?d is the top disk of peg ?p
    (empty ?p - peg)                  ; peg ?p has no disks

    ;; static size ordering (a partial order relation)
    (smaller ?d1 - disk ?d2 - disk)

    ;; stage control for explicit discrete time progression
    (current ?s - stage)
    (succ ?s - stage ?s2 - stage)

    ;; explicit disequality facts for pegs (use facts in problem instance)
    (diff ?p - peg ?q - peg)
  )

  ;; Move when the moved disk is the only disk on the source peg and target peg is empty.
  (:action move-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (top ?d ?from)
      (on-peg ?d ?from)
      (empty ?to)
      (diff ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; source: remove disk from source peg (source becomes empty)
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (empty ?from)

      ;; target: place disk as bottom/top (only disk)
      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?d ?to)
    )
  )

  ;; Move when the moved disk is the only disk on the source peg and target peg is non-empty (onto top disk).
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (top ?d ?from)
      (on-peg ?d ?from)
      (top ?below ?to)
      (smaller ?d ?below)
      (diff ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; source: remove disk from source peg (source becomes empty)
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (empty ?from)

      ;; target: place moved disk on top of ?below, update tops
      (on-disk ?d ?below)
      (top ?d ?to)
      (not (top ?below ?to))
      (not (empty ?to))
    )
  )

  ;; Move when the moved disk is on top of another disk at source and target peg is empty.
  (:action move-disk-to-empty
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (top ?d ?from)
      (on-disk ?d ?below)
      (empty ?to)
      (diff ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; source: detach ?d from ?below and update source top
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (top ?below ?from)

      ;; target: place ?d as sole/top disk on ?to
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
    )
  )

  ;; Move when the moved disk is on top of another disk at source to be placed on top of another disk at target.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?above - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (top ?d ?from)
      (on-disk ?d ?below)
      (top ?above ?to)
      (smaller ?d ?above)
      (diff ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; source: detach ?d from ?below and update source top
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (top ?below ?from)

      ;; target: place ?d on top of ?above, update tops
      (on-disk ?d ?above)
      (top ?d ?to)
      (not (top ?above ?to))
      (not (empty ?to))
    )
  )
)