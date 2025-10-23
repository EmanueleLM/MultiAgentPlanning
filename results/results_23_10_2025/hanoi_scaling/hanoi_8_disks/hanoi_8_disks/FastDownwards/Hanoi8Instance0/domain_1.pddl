(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  ;; Types: peg and disk are both subtypes of place so disks can be placed on pegs or on other disks.
  (:types disk peg - place)

  (:predicates
    ; disk ?d is directly on place ?p (place = peg or disk)
    (on ?d - disk ?p - place)
    ; nothing is on top of place ?p (peg or disk)
    (clear ?p - place)
    ; static relation: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Actions for the three peg agents. Each agent can move a clear top disk from any place onto a clear peg,
  ;; or onto a clear disk that is larger than the moved disk.
  ;; All actions require the disk being moved to be clear and the destination to be clear.
  ;; Effects update the on/clear relations so that exactly one disk moves per action.

  ;; Moves performed by the left_peg agent (conceptual agent name reflected in action name).
  (:action move-by-left_peg-onto-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  (:action move-by-left_peg-onto-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?from ?to))
      (not (= ?d ?to))
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  ;; Moves performed by the middle_peg agent.
  (:action move-by-middle_peg-onto-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  (:action move-by-middle_peg-onto-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?from ?to))
      (not (= ?d ?to))
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  ;; Moves performed by the right_peg agent.
  (:action move-by-right_peg-onto-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  (:action move-by-right_peg-onto-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?from ?to))
      (not (= ?d ?to))
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )
)