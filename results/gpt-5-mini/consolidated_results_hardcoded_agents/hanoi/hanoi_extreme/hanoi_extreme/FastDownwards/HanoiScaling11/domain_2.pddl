(define (domain hanoi7)
  (:requirements :strips :typing :negative-preconditions)
  (:types loc time disk peg - loc)

  (:predicates
    (on ?d - disk ?l - loc)        ; disk d is directly on loc l (peg or disk)
    (clear ?l - loc)               ; loc (peg or disk) has nothing on top
    (smaller ?d - disk ?l - loc)   ; disk d is smaller than loc l (disk or peg)
    (succ ?t - time ?t1 - time)    ; successor relation over discrete stages
    (current ?t - time)            ; pointer to the current stage
  )

  (:action move
    :parameters (?d - disk ?from - loc ?to - loc ?t - time ?t1 - time)
    :precondition (and
      (on ?d ?from)           ; d is supported by from
      (clear ?d)              ; d has no disk on top (is the top disk at from)
      (clear ?to)             ; destination top is clear (peg empty or top disk)
      (smaller ?d ?to)        ; d is smaller than the destination top (or peg)
      (succ ?t ?t1)           ; time advances to successor stage
      (current ?t)            ; we are currently at stage t
    )
    :effect (and
      (not (on ?d ?from))     ; remove old support
      (on ?d ?to)             ; place d on new support

      (not (clear ?to))       ; destination is no longer clear (d is on top)
      (clear ?from)           ; the former support becomes clear (no disk on it)
      (clear ?d)              ; moved disk remains clear (nothing above it)

      (not (current ?t))      ; advance the stage pointer
      (current ?t1)
    )
  )
)