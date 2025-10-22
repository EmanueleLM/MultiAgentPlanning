(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)         ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)               ; place ?p has no disk on top of it
    (smaller ?d1 - disk ?d2 - disk)  ; ?d1 is strictly smaller than ?d2
  )

  ; Move a top disk onto an empty place (peg)
  (:action move-to-empty
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)       ; must be top disk
      (clear ?to)      ; target place must be empty (no disk on it)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)    ; the support becomes clear after removing ?d
      (not (clear ?to)) ; target is no longer clear after placing ?d
    )
  )

  ; Move a top disk onto another top disk (must be smaller than that disk)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?t - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)         ; ?d must be top of its stack
      (clear ?t)         ; ?t must be top of its stack (so we place onto it)
      (smaller ?d ?t)    ; cannot place larger onto smaller
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (clear ?from)      ; the support becomes clear after removing ?d
      (not (clear ?t))   ; ?t is no longer clear after placing ?d on it
    )
  )
)