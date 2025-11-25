(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    (on ?d - disk ?p - place)    ; disk d is directly on place p (peg or disk)
    (clear ?p - place)          ; no disk is on place p (i.e., p is available as a target)
    (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (static size ordering)
    (current ?s - step)
    (next ?s - step ?s2 - step)
  )

  ;; Move a top disk onto an empty peg/place (destination is a peg)
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on ?d ?from)      ; disk is on its support
      (clear ?d)         ; disk ?d is top (nothing on it)
      (clear ?to)        ; destination peg is empty (top)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)      ; from place becomes clear after removing top disk
      (not (clear ?to))  ; destination no longer clear
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk onto another top disk (destination is a disk)
  (:action move-onto-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)          ; disk ?d must be top
      (clear ?to)         ; destination disk ?to must be top (no disk on it)
      (smaller ?d ?to)    ; cannot place larger disk on smaller disk
      (not (= ?from ?to))
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