(define (domain hanoi-3peg)
  (:requirements :strips :typing :negative-preconditions :conditional-effects :quantified-preconditions)
  (:types agent disk peg)
  (:predicates
    (on ?d - disk ?p - peg)
    (top ?d - disk ?p - peg)
    (clear ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
    (controls ?a - agent ?d - disk)
  )

  (:action move
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (controls ?a ?d)
      (on ?d ?from)
      ; top at source: no smaller disk is on the source peg
      (forall (?x - disk) (implies (smaller ?x ?d) (not (on ?x ?from))))
      ; size legality at destination: no smaller disk than d is on the destination peg
      (forall (?x - disk) (implies (smaller ?x ?d) (not (on ?x ?to))))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ; update clearness
      (not (clear ?to))
      (not (clear ?from))
      (when (forall (?x - disk) (not (on ?x ?from)))
        (clear ?from))

      ; recompute top predicates for source and destination
      (forall (?x - disk) (not (top ?x ?from)))
      (forall (?x - disk) (not (top ?x ?to)))
      (forall (?x - disk)
        (when (and (on ?x ?from)
                   (forall (?y - disk) (implies (smaller ?y ?x) (not (on ?y ?from)))))
          (top ?x ?from)))
      (forall (?x - disk)
        (when (and (on ?x ?to)
                   (forall (?y - disk) (implies (smaller ?y ?x) (not (on ?y ?to)))))
          (top ?x ?to)))
    )
  )
)