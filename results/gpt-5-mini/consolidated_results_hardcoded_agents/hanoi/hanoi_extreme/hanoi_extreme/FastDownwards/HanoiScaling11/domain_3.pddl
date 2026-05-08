(define (domain hanoi7)
  (:requirements :strips :typing)
  (:types disk peg - place time)

  (:predicates
    (on ?d - disk ?p - place)       ; disk d is directly on place p (peg or disk)
    (clear ?p - place)             ; place p has nothing on top
    (smaller ?d - disk ?p - place) ; disk d is smaller than place p (disk or peg)
    (succ ?t - time ?t1 - time)    ; successor relation for discrete stages
    (current ?t - time)            ; pointer to the current stage
  )

  (:action move
    :parameters (?d - disk ?from - place ?to - place ?t - time ?t1 - time)
    :precondition (and
      (on ?d ?from)           ; d is on from
      (clear ?d)              ; d has nothing on top (is top disk at from)
      (clear ?to)             ; destination has nothing on top (we place on top)
      (smaller ?d ?to)        ; d is smaller than the destination (disk or peg)
      (succ ?t ?t1)           ; time advances to successor stage
      (current ?t)            ; we are at stage t
    )
    :effect (and
      (not (on ?d ?from))     ; remove old support
      (on ?d ?to)             ; place d on new support

      (not (clear ?to))       ; destination no longer clear (d sits on it)
      (clear ?from)           ; former support becomes clear (its top disk removed)
      (clear ?d)              ; moved disk has nothing on top

      (not (current ?t))      ; advance the stage pointer
      (current ?t1)
    )
  )
)