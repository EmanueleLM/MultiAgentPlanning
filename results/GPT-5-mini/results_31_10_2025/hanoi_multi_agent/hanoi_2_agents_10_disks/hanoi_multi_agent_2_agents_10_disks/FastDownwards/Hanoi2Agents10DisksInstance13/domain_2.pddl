(define (domain hanoi-2agents-10)
  (:requirements :strips :typing :negative-preconditions)
  ;; peg and disk are subtypes of place
  (:types peg disk - place)

  (:predicates
    ;; disk is directly on a place (either peg or another disk)
    (on ?d - disk ?p - place)
    ;; nothing on top of this place (peg or disk)
    (clear ?p - place)
    ;; size ordering: ?a is strictly smaller than ?b
    (smaller ?a - disk ?b - disk)
    ;; ownership / move permission
    (agent1disk ?d - disk)
    (agent2disk ?d - disk)
  )

  ;; Agent 1: move a top disk to an empty peg
  (:action agent1-move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (agent1disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 1: move a top disk onto another (clear) disk (respecting size)
  (:action agent1-move-to-disk
    :parameters (?d - disk ?from - place ?dst - disk)
    :precondition (and
      (agent1disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?dst)
      (smaller ?d ?dst)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?dst)
      (clear ?from)
      (not (clear ?dst))
    )
  )

  ;; Agent 2: move a top disk to an empty peg
  (:action agent2-move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (agent2disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 2: move a top disk onto another (clear) disk (respecting size)
  (:action agent2-move-to-disk
    :parameters (?d - disk ?from - place ?dst - disk)
    :precondition (and
      (agent2disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?dst)
      (smaller ?d ?dst)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?dst)
      (clear ?from)
      (not (clear ?dst))
    )
  )
)