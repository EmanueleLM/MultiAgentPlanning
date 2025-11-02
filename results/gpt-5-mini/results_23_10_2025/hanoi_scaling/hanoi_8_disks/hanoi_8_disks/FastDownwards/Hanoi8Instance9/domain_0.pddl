(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types place disk peg)
  ;; Declare disk and peg as subtypes of place
  ;; Note: PDDL allows subtype syntax; here we will use variables' types directly
  (:predicates
    (on ?d - disk ?p - place)         ; disk ?d is directly on place ?p (place = disk or peg)
    (clear ?p - place)               ; nothing is on top of place (disk or peg)
    (smaller ?d1 - disk ?d2 - disk)  ; ?d1 is strictly smaller than ?d2
  )

  ;; Move a topmost disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
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

  ;; Move a topmost disk onto a larger disk (destination disk must be clear and larger)
  (:action move-onto-disk
    :parameters (?d - disk ?from - place ?target - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?target)
      (smaller ?d ?target)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?target)
      (not (clear ?target))
      (clear ?from)
    )
  )
)