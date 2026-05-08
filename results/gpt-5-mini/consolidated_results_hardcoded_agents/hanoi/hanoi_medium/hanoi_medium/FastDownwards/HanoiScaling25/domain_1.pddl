(define (domain tower-of-hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; structural relations
    (on-disk ?upper - disk ?lower - disk)   ; direct support: upper is directly on lower
    (on-peg  ?b - disk ?p - peg)            ; base disk directly on a peg
    (top ?p - peg ?d - disk)               ; current top disk on a peg

    ;; size membership (unary predicates reduce the need to enumerate all pairwise size facts in :init)
    (is-s1 ?d - disk)
    (is-s2 ?d - disk)
    (is-s3 ?d - disk)
    (is-s4 ?d - disk)
    (is-s5 ?d - disk)

    ;; marker for base sentinel disks
    (is-base ?d - disk)
  )

  ;; Move actions are specialised by the size class of the moved disk.
  ;; Size constraints on destination top are encoded with (not ...) negative preconditions
  ;; so size pair combinations do not need to be enumerated in the problem :init.
  ;; All actions require the disk to be the top on its source peg and update top and on-disk relations.
  (:action move-s1
    :parameters (?d - disk ?belowFrom - disk ?from - peg ?topTo - disk ?to - peg)
    :precondition (and
      (is-s1 ?d)
      (top ?from ?d)
      (on-disk ?d ?belowFrom)
      (top ?to ?topTo)
      ;; prevent moving base sentinels
      (not (is-base ?d))
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from ?belowFrom)
      (not (top ?to ?topTo))
      (top ?to ?d)
      (not (on-disk ?d ?belowFrom))
      (on-disk ?d ?topTo)
    )
  )

  (:action move-s2
    :parameters (?d - disk ?belowFrom - disk ?from - peg ?topTo - disk ?to - peg)
    :precondition (and
      (is-s2 ?d)
      (top ?from ?d)
      (on-disk ?d ?belowFrom)
      (top ?to ?topTo)
      (not (is-base ?d))
      ;; destination top must not be s1 or s2 (i.e., must be strictly larger)
      (not (is-s1 ?topTo))
      (not (is-s2 ?topTo))
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from ?belowFrom)
      (not (top ?to ?topTo))
      (top ?to ?d)
      (not (on-disk ?d ?belowFrom))
      (on-disk ?d ?topTo)
    )
  )

  (:action move-s3
    :parameters (?d - disk ?belowFrom - disk ?from - peg ?topTo - disk ?to - peg)
    :precondition (and
      (is-s3 ?d)
      (top ?from ?d)
      (on-disk ?d ?belowFrom)
      (top ?to ?topTo)
      (not (is-base ?d))
      ;; destination top must be strictly larger than s3
      (not (is-s1 ?topTo))
      (not (is-s2 ?topTo))
      (not (is-s3 ?topTo))
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from ?belowFrom)
      (not (top ?to ?topTo))
      (top ?to ?d)
      (not (on-disk ?d ?belowFrom))
      (on-disk ?d ?topTo)
    )
  )

  (:action move-s4
    :parameters (?d - disk ?belowFrom - disk ?from - peg ?topTo - disk ?to - peg)
    :precondition (and
      (is-s4 ?d)
      (top ?from ?d)
      (on-disk ?d ?belowFrom)
      (top ?to ?topTo)
      (not (is-base ?d))
      ;; destination top must be strictly larger than s4
      (not (is-s1 ?topTo))
      (not (is-s2 ?topTo))
      (not (is-s3 ?topTo))
      (not (is-s4 ?topTo))
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from ?belowFrom)
      (not (top ?to ?topTo))
      (top ?to ?d)
      (not (on-disk ?d ?belowFrom))
      (on-disk ?d ?topTo)
    )
  )

  (:action move-s5
    :parameters (?d - disk ?belowFrom - disk ?from - peg ?topTo - disk ?to - peg)
    :precondition (and
      (is-s5 ?d)
      (top ?from ?d)
      (on-disk ?d ?belowFrom)
      (top ?to ?topTo)
      (not (is-base ?d))
      ;; s5 is the largest real disk; it can only be placed on a base sentinel
      (is-base ?topTo)
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from ?belowFrom)
      (not (top ?to ?topTo))
      (top ?to ?d)
      (not (on-disk ?d ?belowFrom))
      (on-disk ?d ?topTo)
    )
  )
)