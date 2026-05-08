(define (domain hanoi6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (at ?d - disk ?p - peg)         ; disk is on peg ?p (peg membership)
    (on ?d - disk ?under - disk)    ; disk ?d is directly on top of disk ?under
    (on-base ?d - disk ?p - peg)   ; disk ?d is directly on the base of peg ?p (no disk under)
    (clear ?d - disk)               ; disk is top on its peg
    (empty ?p - peg)                ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk) ; static size ordering: d1 is smaller than d2
    (current ?s - step)             ; current stage/step
    (succ ?s1 - step ?s2 - step)    ; immediate successor relation between steps
  )

  ;; Move a top disk that is on another disk onto another top disk.
  (:action move-disk-from-disk-to-disk
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?under - disk ?destTop - disk)
    :precondition (and
      (current ?s) (succ ?s ?s2)

      ;; disk to move is at source peg and is top
      (at ?d ?from)
      (clear ?d)

      ;; disk is directly on top of another disk ?under on the same source peg
      (on ?d ?under)
      (at ?under ?from)

      ;; destination has a top disk ?destTop on the target peg and is clear
      (at ?destTop ?to)
      (clear ?destTop)

      ;; size ordering: moved disk smaller than destination top
      (smaller ?d ?destTop)
    )
    :effect (and
      ;; advance step
      (not (current ?s)) (current ?s2)

      ;; move disk membership
      (not (at ?d ?from)) (at ?d ?to)

      ;; update support relations: remove old support, set new support on destination top
      (not (on ?d ?under)) (on ?d ?destTop)

      ;; destination top is no longer clear; moved disk becomes clear
      (not (clear ?destTop))
      (clear ?d)

      ;; the disk that lost its top becomes clear
      (clear ?under)
    )
  )

  ;; Move a top disk that is on another disk onto an empty peg base.
  (:action move-disk-from-disk-to-base
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?under - disk)
    :precondition (and
      (current ?s) (succ ?s ?s2)

      (at ?d ?from)
      (clear ?d)

      (on ?d ?under)
      (at ?under ?from)

      (empty ?to)
    )
    :effect (and
      (not (current ?s)) (current ?s2)

      (not (at ?d ?from)) (at ?d ?to)

      (not (on ?d ?under)) (on-base ?d ?to)

      ;; destination ceases to be empty
      (not (empty ?to))

      ;; moved disk is top at destination
      (clear ?d)

      ;; the disk that lost its top becomes clear
      (clear ?under)
    )
  )

  ;; Move a top disk that is on the peg base onto another top disk.
  (:action move-disk-from-base-to-disk
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?destTop - disk)
    :precondition (and
      (current ?s) (succ ?s ?s2)

      (at ?d ?from)
      (clear ?d)

      (on-base ?d ?from)

      (at ?destTop ?to)
      (clear ?destTop)

      (smaller ?d ?destTop)
    )
    :effect (and
      (not (current ?s)) (current ?s2)

      (not (at ?d ?from)) (at ?d ?to)

      (not (on-base ?d ?from)) (on ?d ?destTop)

      ;; destination top no longer clear; moved disk becomes clear
      (not (clear ?destTop))
      (clear ?d)

      ;; source peg becomes empty (disk was on base)
      (empty ?from)
    )
  )

  ;; Move a top disk that is on the peg base onto an empty peg base.
  (:action move-disk-from-base-to-base
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (current ?s) (succ ?s ?s2)

      (at ?d ?from)
      (clear ?d)

      (on-base ?d ?from)

      (empty ?to)
    )
    :effect (and
      (not (current ?s)) (current ?s2)

      (not (at ?d ?from)) (at ?d ?to)

      (not (on-base ?d ?from)) (on-base ?d ?to)

      ;; destination ceases to be empty; source becomes empty
      (not (empty ?to))
      (empty ?from)

      ;; moved disk is top at destination
      (clear ?d)
    )
  )
)