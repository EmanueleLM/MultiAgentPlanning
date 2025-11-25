(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place stage)

  (:predicates
    ;; immediate support relation: a disk is directly on a place (a peg or another disk)
    (on ?d - disk ?p - place)

    ;; a place (peg or disk) has nothing directly on it
    (clear ?p - place)

    ;; size ordering: smaller ?x ?y means disk ?x is strictly smaller than disk ?y
    (smaller ?x - disk ?y - disk)

    ;; explicit stage / turn token to enforce ordered stages
    (curr ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move a clear disk from a place (disk or peg) onto an empty peg,
  ;; advancing the current stage along the provided next relation.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (curr ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; update support relation
      (not (on ?d ?from))
      (on ?d ?to)

      ;; maintain clear-ness invariants: the destination is no longer clear, the former support becomes clear
      (not (clear ?to))
      (clear ?from)

      ;; advance the stage token (ensures one move consumes the current stage)
      (not (curr ?s))
      (curr ?s2)
    )
  )

  ;; Move a clear disk from a place onto a clear disk larger than it,
  ;; advancing the current stage along the provided next relation.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (curr ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; update support relation
      (not (on ?d ?from))
      (on ?d ?to)

      ;; maintain clear-ness invariants
      (not (clear ?to))
      (clear ?from)

      ;; advance the stage token
      (not (curr ?s))
      (curr ?s2)
    )
  )
)