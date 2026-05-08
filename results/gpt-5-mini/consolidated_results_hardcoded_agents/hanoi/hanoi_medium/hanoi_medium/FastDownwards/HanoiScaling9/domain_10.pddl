(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on ?d - disk ?p)                ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p)                       ; nothing directly on this place (peg or disk)
    (smaller ?d1 - disk ?d2 - disk)  ; static size ordering: ?d1 is smaller than ?d2
    (succ ?s - stage ?s2 - stage)    ; stage successor relation to enforce move ordering
    (current ?s - stage)             ; which stage is active
  )

  ;; Move a top disk from ?from (peg or disk) to an empty peg ?to, advancing the global stage.
  (:action move-to-empty-peg
    :parameters (?d - disk ?from ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)          ; ?d is top of its stack
      (clear ?to)         ; destination peg is empty at top
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)       ; source becomes clear (nothing directly on it)
      (not (clear ?to))   ; destination is no longer clear
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from ?from (peg or disk) onto another top disk ?to (requires smaller), advancing the stage.
  (:action move-to-disk
    :parameters (?d - disk ?from ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)          ; ?d is top of its stack
      (clear ?to)         ; ?to is top of its stack
      (smaller ?d ?to)    ; cannot place larger on smaller
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)       ; source becomes clear
      (not (clear ?to))   ; destination is no longer clear
      (not (current ?s))
      (current ?s2)
    )
  )
)