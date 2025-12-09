(define (domain hanoi)
  (:requirements :typing :negative-preconditions :strips)
  (:types support disk peg)
  ;; peg and disk are supports (a disk can be a support for another disk; peg is bottom support)
  (:predicates
    ;; on D S  -- disk D is directly on support S (S is either another disk or a peg)
    (on ?d - disk ?s - support)
    ;; smaller X Y -- disk X is strictly smaller than disk Y
    (smaller ?x - disk ?y - disk)
  )

  ;; Move a top disk from a disk to another disk (both supports are disks).
  ;; Preconditions:
  ;;  - ?d is on ?from
  ;;  - ?d has nothing on it (it is the top disk): no disk ?n_i is on ?d
  ;;  - ?to is a top disk (no disk ?n_i is on ?to)
  ;;  - size rule: ?d is smaller than ?to
  (:action move-disk-from-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk
                 ?n1 - disk ?n2 - disk ?n3 - disk ?n4 - disk ?n5 - disk ?n6 - disk ?n7 - disk)
    :precondition (and
      (on ?d ?from)
      (smaller ?d ?to)
      ;; ensure ?d is top (no disk on ?d)
      (not (on ?n1 ?d)) (not (on ?n2 ?d)) (not (on ?n3 ?d)) (not (on ?n4 ?d))
      (not (on ?n5 ?d)) (not (on ?n6 ?d)) (not (on ?n7 ?d))
      ;; ensure ?to is top (we place on top of ?to)
      (not (on ?n1 ?to)) (not (on ?n2 ?to)) (not (on ?n3 ?to)) (not (on ?n4 ?to))
      (not (on ?n5 ?to)) (not (on ?n6 ?to)) (not (on ?n7 ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  ;; Move a top disk from a disk to an empty peg.
  ;; Preconditions:
  ;;  - ?d is on ?from
  ;;  - ?d has nothing on it
  ;;  - target peg ?to has no disks on it (peg must be empty to place directly on peg)
  (:action move-disk-from-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg
                 ?n1 - disk ?n2 - disk ?n3 - disk ?n4 - disk ?n5 - disk ?n6 - disk ?n7 - disk)
    :precondition (and
      (on ?d ?from)
      ;; ensure ?d is top
      (not (on ?n1 ?d)) (not (on ?n2 ?d)) (not (on ?n3 ?d)) (not (on ?n4 ?d))
      (not (on ?n5 ?d)) (not (on ?n6 ?d)) (not (on ?n7 ?d))
      ;; ensure target peg is empty (no disk is directly on the peg)
      (not (on ?n1 ?to)) (not (on ?n2 ?to)) (not (on ?n3 ?to)) (not (on ?n4 ?to))
      (not (on ?n5 ?to)) (not (on ?n6 ?to)) (not (on ?n7 ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  ;; Move a top disk from an empty-or-nonempty peg where the disk is directly on the peg,
  ;; to a top disk (i.e., onto another disk).
  ;; Preconditions:
  ;;  - ?d is on ?from (where ?from is peg)
  ;;  - ?d has nothing on it
  ;;  - ?to is top (no disk on it)
  ;;  - size rule: ?d is smaller than ?to
  (:action move-disk-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk
                 ?n1 - disk ?n2 - disk ?n3 - disk ?n4 - disk ?n5 - disk ?n6 - disk ?n7 - disk)
    :precondition (and
      (on ?d ?from)
      (smaller ?d ?to)
      ;; ensure ?d is top
      (not (on ?n1 ?d)) (not (on ?n2 ?d)) (not (on ?n3 ?d)) (not (on ?n4 ?d))
      (not (on ?n5 ?d)) (not (on ?n6 ?d)) (not (on ?n7 ?d))
      ;; ensure ?to is top
      (not (on ?n1 ?to)) (not (on ?n2 ?to)) (not (on ?n3 ?to)) (not (on ?n4 ?to))
      (not (on ?n5 ?to)) (not (on ?n6 ?to)) (not (on ?n7 ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )

  ;; Move a top disk from a peg to an empty peg.
  ;; Preconditions:
  ;;  - ?d is on ?from (peg)
  ;;  - ?d has nothing on it
  ;;  - target peg ?to is empty
  (:action move-disk-from-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg
                 ?n1 - disk ?n2 - disk ?n3 - disk ?n4 - disk ?n5 - disk ?n6 - disk ?n7 - disk)
    :precondition (and
      (on ?d ?from)
      ;; ensure ?d is top
      (not (on ?n1 ?d)) (not (on ?n2 ?d)) (not (on ?n3 ?d)) (not (on ?n4 ?d))
      (not (on ?n5 ?d)) (not (on ?n6 ?d)) (not (on ?n7 ?d))
      ;; ensure target peg empty
      (not (on ?n1 ?to)) (not (on ?n2 ?to)) (not (on ?n3 ?to)) (not (on ?n4 ?to))
      (not (on ?n5 ?to)) (not (on ?n6 ?to)) (not (on ?n7 ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
    )
  )
)