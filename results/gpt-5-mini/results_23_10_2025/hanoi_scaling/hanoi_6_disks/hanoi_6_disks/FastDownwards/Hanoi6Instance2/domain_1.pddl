(define (domain hanoi)
  (:requirements :strips :typing)
  (:types disk peg - place)

  (:predicates
    ;; disk is directly on a place (either a peg or another disk)
    (on ?d - disk ?p - place)
    ;; place (disk or peg) has nothing directly on it
    (clear ?p - place)
    ;; static size relation: smaller ?a ?b means disk ?a is strictly smaller than ?b
    (smaller ?a - disk ?b - disk)
  )

  ;; Move a top disk onto an empty peg.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)    ; disk ?d sits directly on ?from (disk or peg)
      (clear ?d)       ; ?d is the top disk of its stack
      (clear ?to)      ; target peg is empty (no disk directly on it)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)    ; after moving, what supported ?d becomes clear
      (not (clear ?to)) ; the target peg is no longer clear (now has ?d)
    )
  )

  ;; Move a top disk onto another disk (must be smaller than the destination disk).
  (:action move-onto-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)           ; destination disk must be top of its stack
      (smaller ?d ?to)      ; cannot place larger on smaller
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)