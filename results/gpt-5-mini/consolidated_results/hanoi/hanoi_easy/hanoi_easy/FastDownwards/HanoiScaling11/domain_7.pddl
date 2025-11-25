(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk stage)

  (:predicates
    ;; disk d is directly on peg p (no disk below)
    (on-peg ?d - disk ?p - peg)
    ;; disk d is directly on top of disk below, and that pair is on peg p
    (on-disk ?d - disk ?below - disk ?p - peg)
    ;; d is the top disk on peg p
    (top ?d - disk ?p - peg)
    ;; peg is empty (has no disks)
    (empty ?p - peg)
    ;; size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; discrete stage/time bookkeeping
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
    )
    :effect (and
      (not (on-peg ?d ?pfrom))
      (not (top ?d ?pfrom))
      (empty ?pfrom)
      (on-peg ?d ?pto)
      (top ?d ?pto)
      (not (empty ?pto))
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
    )
    :effect (and
      (not (on-peg ?d ?pfrom))
      (not (top ?d ?pfrom))
      (empty ?pfrom)
      (on-disk ?d ?t ?pto)
      (top ?d ?pto)
      (not (top ?t ?pto))
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
    )
    :effect (and
      (not (on-disk ?d ?below ?pfrom))
      (not (top ?d ?pfrom))
      ;; the disk below becomes the new top on pfrom
      (top ?below ?pfrom)
      (on-peg ?d ?pto)
      (top ?d ?pto)
      (not (empty ?pto))
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
    )
    :effect (and
      (not (on-disk ?d ?below ?pfrom))
      (not (top ?d ?pfrom))
      (top ?below ?pfrom)
      (on-disk ?d ?t ?pto)
      (top ?d ?pto)
      (not (top ?t ?pto))
      (not (current ?s))
      (current ?ns)
    )
  )
)