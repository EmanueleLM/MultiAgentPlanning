(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    ;; Agents
    (agent ?a - agent)

    ;; Positional relations:
    ;; A disk may be immediately on a peg (on-peg) or immediately on another disk (on-disk).
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?p - disk)

    ;; A disk is "top" iff no disk is on it (i.e., it has nothing above).
    (top ?d - disk)

    ;; A peg is empty iff there is no disk immediately on it.
    (empty ?p - peg)

    ;; Static placement permissions:
    ;; A peg accepts any disk as a support.
    (can-place-peg ?p - peg ?d - disk)
    ;; A disk accepts a smaller disk on top of it (can-place-disk support only when the moved disk is smaller).
    (can-place-disk ?p - disk ?d - disk)

    ;; Disk size ordering (static).
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk from one peg to another peg.
  (:action move-from-peg-to-peg
    :parameters (?ag - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (agent ?ag)
      (on-peg ?d ?from)
      (top ?d)
      (empty ?to)
      (can-place-peg ?to ?d)
      ;; Prevent no-op move onto the same place
      (not (on-peg ?d ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (empty ?to))
      (empty ?from)
      ;; top(?d) remains true (disk still has nothing on it)
    )
  )

  ;; Move a top disk from a peg onto a disk (disk must be top and larger).
  (:action move-from-peg-to-disk
    :parameters (?ag - agent ?d - disk ?from - peg ?to - disk)
    :precondition (and
      (agent ?ag)
      (on-peg ?d ?from)
      (top ?d)
      (top ?to)                     ;; destination disk must have nothing on it
      (can-place-disk ?to ?d)       ;; destination disk must be larger than ?d (encoded in problem)
      (not (on-disk ?d ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (not (top ?to))               ;; destination disk now has a disk on top => no longer top
      (empty ?from)
      ;; top(?d) remains true
    )
  )

  ;; Move a top disk from a disk onto a peg.
  (:action move-from-disk-to-peg
    :parameters (?ag - agent ?d - disk ?from - disk ?to - peg)
    :precondition (and
      (agent ?ag)
      (on-disk ?d ?from)
      (top ?d)
      (empty ?to)
      (can-place-peg ?to ?d)
      (not (on-peg ?d ?to))
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (not (empty ?to))
      (top ?from)                   ;; the disk that supported ?d now has nothing on it -> becomes top
      ;; top(?d) remains true
    )
  )

  ;; Move a top disk from a disk onto another disk (destination must be top and larger).
  (:action move-from-disk-to-disk
    :parameters (?ag - agent ?d - disk ?from - disk ?to - disk)
    :precondition (and
      (agent ?ag)
      (on-disk ?d ?from)
      (top ?d)
      (top ?to)
      (can-place-disk ?to ?d)
      (not (on-disk ?d ?to))
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (not (top ?to))               ;; destination disk no longer top
      (top ?from)                   ;; original support disk now has nothing on it -> becomes top
      ;; top(?d) remains true
    )
  )
)