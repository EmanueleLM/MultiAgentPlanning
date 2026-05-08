(define (domain tower-of-hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-disk ?upper - disk ?lower - disk)   ; upper is directly on lower
    (on-peg  ?b - disk ?p - peg)            ; base disk directly on a peg
    (top ?p - peg ?d - disk)               ; current top disk on a peg

    (is-s1 ?d - disk)
    (is-s2 ?d - disk)
    (is-s3 ?d - disk)
    (is-s4 ?d - disk)
    (is-s5 ?d - disk)

    (is-base ?d - disk)

    (successor ?s - stage ?s2 - stage)
    (stage-active ?s - stage)
  )

  ;; move smallest class (s1)
  (:action move-s1
    :parameters (?d - disk ?belowFrom - disk ?from - peg ?topTo - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (is-s1 ?d)
      (top ?from ?d)
      (on-disk ?d ?belowFrom)
      (top ?to ?topTo)
      (not (is-base ?d))
      (stage-active ?s)
      (successor ?s ?s2)
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from ?belowFrom)
      (not (top ?to ?topTo))
      (top ?to ?d)
      (not (on-disk ?d ?belowFrom))
      (on-disk ?d ?topTo)
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )

  (:action move-s2
    :parameters (?d - disk ?belowFrom - disk ?from - peg ?topTo - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (is-s2 ?d)
      (top ?from ?d)
      (on-disk ?d ?belowFrom)
      (top ?to ?topTo)
      (not (is-base ?d))
      ;; destination top must be strictly larger than s2
      (not (is-s1 ?topTo))
      (not (is-s2 ?topTo))
      (stage-active ?s)
      (successor ?s ?s2)
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from ?belowFrom)
      (not (top ?to ?topTo))
      (top ?to ?d)
      (not (on-disk ?d ?belowFrom))
      (on-disk ?d ?topTo)
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )

  (:action move-s3
    :parameters (?d - disk ?belowFrom - disk ?from - peg ?topTo - disk ?to - peg ?s - stage ?s2 - stage)
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
      (stage-active ?s)
      (successor ?s ?s2)
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from ?belowFrom)
      (not (top ?to ?topTo))
      (top ?to ?d)
      (not (on-disk ?d ?belowFrom))
      (on-disk ?d ?topTo)
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )

  (:action move-s4
    :parameters (?d - disk ?belowFrom - disk ?from - peg ?topTo - disk ?to - peg ?s - stage ?s2 - stage)
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
      (stage-active ?s)
      (successor ?s ?s2)
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from ?belowFrom)
      (not (top ?to ?topTo))
      (top ?to ?d)
      (not (on-disk ?d ?belowFrom))
      (on-disk ?d ?topTo)
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )

  (:action move-s5
    :parameters (?d - disk ?belowFrom - disk ?from - peg ?topTo - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (is-s5 ?d)
      (top ?from ?d)
      (on-disk ?d ?belowFrom)
      (top ?to ?topTo)
      (not (is-base ?d))
      ;; s5 is the largest real disk; it can only be placed on a base sentinel (which represents emptiness)
      (is-base ?topTo)
      (stage-active ?s)
      (successor ?s ?s2)
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from ?belowFrom)
      (not (top ?to ?topTo))
      (top ?to ?d)
      (not (on-disk ?d ?belowFrom))
      (on-disk ?d ?topTo)
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )
)