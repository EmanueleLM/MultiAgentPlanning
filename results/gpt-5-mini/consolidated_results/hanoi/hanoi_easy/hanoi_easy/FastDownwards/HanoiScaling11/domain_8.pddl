(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk stage)

  (:predicates
    ;; disk d is directly on peg p (i.e., it has no disk below it)
    (on-peg ?d - disk ?p - peg)
    ;; disk d is directly on top of disk below, and that pair is on peg p
    (on-disk ?d - disk ?below - disk ?p - peg)
    ;; d is the top disk on peg p
    (top ?d - disk ?p - peg)
    ;; peg is empty (has no disks)
    (empty ?p - peg)
    ;; size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; discrete stage/time bookkeeping: current stage and successor relation
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Move a disk that is directly on a peg to an empty peg
  (:action move-onpeg-to-empty
    :parameters (?d - disk ?pfrom - peg ?pto - peg ?s - stage ?ns - stage)
    :precondition (and
      (current ?s)
      (on-peg ?d ?pfrom)
      (top ?d ?pfrom)
      (empty ?pto)
      (succ ?s ?ns)
      (not (= ?pfrom ?pto))
    )
    :effect (and
      ;; source: remove disk from being directly on source peg and as top there
      (not (on-peg ?d ?pfrom))
      (not (top ?d ?pfrom))
      ;; source peg becomes empty (was directly-on-peg so no disk below)
      (empty ?pfrom)

      ;; destination: disk is now directly on destination peg and top there
      (on-peg ?d ?pto)
      (top ?d ?pto)
      (not (empty ?pto))

      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a disk that is directly on a peg onto another top disk
  (:action move-onpeg-to-ondisk
    :parameters (?d - disk ?pfrom - peg ?t - disk ?pto - peg ?s - stage ?ns - stage)
    :precondition (and
      (current ?s)
      (on-peg ?d ?pfrom)
      (top ?d ?pfrom)
      (top ?t ?pto)
      (smaller ?d ?t)
      (succ ?s ?ns)
      (not (= ?pfrom ?pto))
      (not (= ?d ?t))
    )
    :effect (and
      ;; source: remove disk from being directly on source peg and as top there
      (not (on-peg ?d ?pfrom))
      (not (top ?d ?pfrom))
      ;; source peg becomes empty (since disk was directly on peg)
      (empty ?pfrom)

      ;; destination: disk is now directly on the target disk and top there
      (on-disk ?d ?t ?pto)
      (top ?d ?pto)
      ;; the previous top on destination is no longer top
      (not (top ?t ?pto))

      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a disk that is directly on another disk to an empty peg
  (:action move-ondisk-to-empty
    :parameters (?d - disk ?below - disk ?pfrom - peg ?pto - peg ?s - stage ?ns - stage)
    :precondition (and
      (current ?s)
      (on-disk ?d ?below ?pfrom)
      (top ?d ?pfrom)
      (empty ?pto)
      (succ ?s ?ns)
      (not (= ?pfrom ?pto))
      (not (= ?d ?below))
    )
    :effect (and
      ;; remove the moved disk's direct-on-disk relation and its top status on source
      (not (on-disk ?d ?below ?pfrom))
      (not (top ?d ?pfrom))
      ;; the disk that was below becomes the new top on the source peg
      (top ?below ?pfrom)

      ;; destination: disk is now directly on destination peg and top there
      (on-peg ?d ?pto)
      (top ?d ?pto)
      (not (empty ?pto))

      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a disk that is directly on another disk onto another top disk
  (:action move-ondisk-to-ondisk
    :parameters (?d - disk ?below - disk ?pfrom - peg ?t - disk ?pto - peg ?s - stage ?ns - stage)
    :precondition (and
      (current ?s)
      (on-disk ?d ?below ?pfrom)
      (top ?d ?pfrom)
      (top ?t ?pto)
      (smaller ?d ?t)
      (succ ?s ?ns)
      (not (= ?pfrom ?pto))
      (not (= ?d ?below))
      (not (= ?d ?t))
    )
    :effect (and
      ;; source: remove moved disk's relation and its top status
      (not (on-disk ?d ?below ?pfrom))
      (not (top ?d ?pfrom))
      ;; disk below becomes the new top on the source peg
      (top ?below ?pfrom)

      ;; destination: disk is now directly on the target disk and top there
      (on-disk ?d ?t ?pto)
      (top ?d ?pto)
      ;; the previous top on destination is no longer top
      (not (top ?t ?pto))

      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )
)