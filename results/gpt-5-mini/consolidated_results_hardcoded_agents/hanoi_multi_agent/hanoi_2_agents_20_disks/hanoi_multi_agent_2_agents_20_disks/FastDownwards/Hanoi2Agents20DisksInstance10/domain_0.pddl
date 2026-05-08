(define (domain orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types place peg disk smalldisk largedisk)
  ;; declare hierarchy: smalldisk and largedisk are subtypes of disk; disk and peg are subtypes of place
  ;; Note: type hierarchy implied by usage in action signatures below.

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (place is a disk or a peg)
    (clear ?p - place)              ; nothing is on top of place ?p
    (smaller ?d1 - disk ?d2 - disk) ; ?d1 is strictly smaller than ?d2
  )

  ;; Agent 1 actions: can move only smalldisks (A..J)
  (:action move_agent1_to_peg
    :parameters (?d - smalldisk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_agent1_to_disk
    :parameters (?d - smalldisk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Agent 2 actions: can move only largedisks (K..T)
  (:action move_agent2_to_peg
    :parameters (?d - largedisk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_agent2_to_disk
    :parameters (?d - largedisk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)