(define (domain hanoi)
  (:requirements :strips :typing)
  (:types disk peg - support)
  (:predicates
    (on ?d - disk ?s - support)        ; disk ?d is directly on support ?s (support = peg or disk)
    (clear ?s - support)              ; nothing is on top of support ?s
    (smaller ?d1 - disk ?d2 - disk)   ; ?d1 is smaller than ?d2 (static relation)
  )
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)                     ; target peg is empty
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)                   ; the support we removed ?d from becomes clear (top exposed)
      (not (clear ?to))               ; peg is no longer clear once ?d placed on it
    )
  )
  (:action move-to-disk
    :parameters (?d - disk ?from - support ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)                     ; target disk must be top (nothing on it)
      (smaller ?d ?to)                ; enforce size rule: moved disk must be smaller than target disk
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)                   ; the support we removed ?d from becomes clear
      (not (clear ?to))               ; target disk is no longer clear once ?d placed on it
    )
  )
)