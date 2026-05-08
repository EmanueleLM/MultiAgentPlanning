(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types step place disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)              ; nothing directly on top of place (peg or disk)
    (smaller ?d1 - disk ?d2 - disk) ; static size ordering: ?d1 strictly smaller than ?d2
    (at-step ?s - step)             ; current global stage
    (succ ?s1 - step ?s2 - step)    ; successor relation between stages
  )

  ;; Move a top disk onto another (larger) disk.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)           ; disk is top (movable)
      (clear ?to)          ; destination disk is top
      (smaller ?d ?to)     ; size constraint: moved disk smaller than destination disk
      (at-step ?s)
      (succ ?s ?s2)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  ;; Move a top disk onto an empty peg.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)          ; peg must be empty to accept disk directly
      (at-step ?s)
      (succ ?s ?s2)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)