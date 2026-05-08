(define (domain hanoi-5-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (a peg or another disk)
    (top ?d - disk)                  ; disk has no disk on top of it
    (peg-empty ?p - peg)             ; peg currently has no disk directly on it
    (smaller ?d1 - disk ?d2 - disk)  ; static size ordering: ?d1 is smaller than ?d2
  )

  ;; Move a top disk from a disk (source) onto another disk (destination).
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d)
      (top ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (top ?from)            ; the disk that was supporting ?d becomes top
      (not (top ?to))        ; destination is no longer top (has ?d on it)
    )
  )

  ;; Move a top disk from a disk (source) onto an empty peg (destination peg is empty).
  (:action move-from-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (on ?d ?from)
      (top ?d)
      (peg-empty ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (top ?from)            ; supporting disk becomes top
      (not (peg-empty ?to))  ; peg now has a disk directly on it
    )
  )

  ;; Move a top disk from a peg (source peg) onto another disk (destination).
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d)
      (top ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (peg-empty ?from)      ; source peg becomes empty after removing its directly-on disk
      (not (top ?to))        ; destination disk no longer top
    )
  )

  ;; Move a top disk from a peg (source) onto an empty peg (destination).
  (:action move-from-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (top ?d)
      (peg-empty ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (peg-empty ?from)      ; source peg becomes empty
      (not (peg-empty ?to))  ; destination peg receives a direct disk
    )
  )
)