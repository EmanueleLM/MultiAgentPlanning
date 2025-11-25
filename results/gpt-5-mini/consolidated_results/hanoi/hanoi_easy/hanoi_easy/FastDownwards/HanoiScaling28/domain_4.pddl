(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (disk or peg)
    (clear ?p - place)              ; nothing is directly on place ?p (available as target)
    (smaller ?d1 - disk ?d2 - disk) ; static size ordering: ?d1 is smaller than ?d2
    (current ?s - step)             ; current stage
    (next ?s - step ?s2 - step)     ; ordering of stages (single-move-at-a-time)
    (different ?p1 - place ?p2 - place) ; explicit inequality between places
  )

  ;; Move a top disk from any place onto an empty peg (destination is a peg)
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on ?d ?from)     ; ?d is directly on its support ?from
      (clear ?d)        ; ?d is the top disk on its support
      (clear ?to)       ; destination peg is currently clear (no disk on it)
      (different ?from ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)      ; source becomes clear (its former support has nothing on it)
      (not (clear ?to))  ; destination no longer clear
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from any place onto another top disk (respecting size ordering)
  (:action move-onto-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)         ; ?d is top on its support
      (clear ?to)        ; ?to is top (no disk on it)
      (smaller ?d ?to)   ; cannot place larger disk on smaller disk
      (different ?from ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )
)