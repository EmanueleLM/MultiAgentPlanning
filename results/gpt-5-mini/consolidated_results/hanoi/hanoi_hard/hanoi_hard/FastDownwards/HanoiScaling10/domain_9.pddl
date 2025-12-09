(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place stage
    disk peg - place
  )

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (disk or peg)
    (clear ?p - place)              ; place ?p has no disk directly on it
    (smaller ?d1 - disk ?d2 - disk) ; ?d1 is smaller than ?d2
    (succ ?s1 - stage ?s2 - stage)  ; temporal successor relation between stages
    (current ?s - stage)            ; which stage is the current one
  )

  ;; Move a top disk from some place onto an empty peg.
  (:action move-to-empty-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)       ; disk ?d is on ?from
      (clear ?d)          ; ?d has nothing on top (top disk)
      (clear ?to)         ; destination peg is empty on top
      (current ?s)        ; we are at stage ?s
      (succ ?s ?s2)       ; next stage is ?s2
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)       ; after removing ?d, the place it was on becomes clear
      (not (clear ?to))   ; after placing ?d, the destination is not clear
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from some place onto another disk (must be larger).
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)       ; disk ?d is on ?from
      (clear ?d)          ; ?d has nothing on top (top disk)
      (clear ?to)         ; target disk has nothing on top (top)
      (smaller ?d ?to)    ; moving disk must be smaller than the target disk
      (current ?s)        ; we are at stage ?s
      (succ ?s ?s2)       ; next stage is ?s2
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)       ; place we removed ?d from becomes clear
      (not (clear ?to))   ; target disk now has ?d on top, therefore not clear
      (not (current ?s))
      (current ?s2)
    )
  )
)