(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types step place)

  (:predicates
    (on ?d - place ?p - place)        ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)                ; nothing directly on top of place (peg or disk)
    (smaller ?d1 - place ?d2 - place) ; static size ordering: ?d1 strictly smaller than ?d2
    (peg ?p - place)                  ; identifies peg objects among places
    (disk ?d - place)                 ; identifies disk objects among places
    (at-step ?s - step)               ; current global stage
    (succ ?s1 - step ?s2 - step)      ; successor relation between stages
  )

  ;; Move a top disk onto another (larger) disk (destination is a disk and is top).
  ;; Step advancement is enforced by at-step/succ preconditions and effects.
  (:action move-to-disk
    :parameters (?d - place ?from - place ?to - place ?s - step ?s2 - step)
    :precondition (and
      (disk ?d)
      (disk ?to)
      (on ?d ?from)           ; ?d is directly on ?from
      (clear ?d)              ; ?d is top at source
      (clear ?to)             ; destination disk is top
      (smaller ?d ?to)        ; size constraint: moved disk smaller than destination disk
      (at-step ?s)
      (succ ?s ?s2)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?d)              ; moved disk remains top after move
      (not (clear ?to))       ; destination disk now has something on top
      (clear ?from)           ; place below source becomes top
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  ;; Move a top disk onto an empty peg (destination is a peg and is empty).
  (:action move-to-peg
    :parameters (?d - place ?from - place ?to - place ?s - step ?s2 - step)
    :precondition (and
      (disk ?d)
      (on ?d ?from)
      (clear ?d)
      (peg ?to)
      (clear ?to)             ; peg must be empty (top) to accept disk directly
      (at-step ?s)
      (succ ?s ?s2)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?d)              ; moved disk is top on destination
      (not (clear ?to))       ; peg no longer empty
      (clear ?from)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)