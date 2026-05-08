(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types step place)

  (:predicates
    (on ?d - place ?p - place)        ; disk/peg ?d is directly on place ?p (peg or disk)
    (clear ?p - place)                ; nothing directly on top of place (peg or disk)
    (smaller ?d1 - place ?d2 - place) ; static size ordering: ?d1 strictly smaller than ?d2
    (peg ?p - place)                  ; identifies peg objects among places
    (at-step ?s - step)               ; current global stage
    (succ ?s1 - step ?s2 - step)      ; successor relation between stages
  )

  ;; Move a top disk onto another (larger) disk (destination must be a disk, not a peg).
  (:action move-to-disk
    :parameters (?d - place ?from - place ?to - place ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)               ; disk is top (movable)
      (clear ?to)              ; destination disk is top
      (smaller ?d ?to)         ; size constraint: moved disk smaller than destination disk
      (not (peg ?to))          ; destination is a disk (not a peg)
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

  ;; Move a top disk onto an empty peg (destination must be a peg and currently clear).
  (:action move-to-peg
    :parameters (?d - place ?from - place ?to - place ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)              ; peg must be empty to accept disk directly
      (peg ?to)                ; destination is a peg
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