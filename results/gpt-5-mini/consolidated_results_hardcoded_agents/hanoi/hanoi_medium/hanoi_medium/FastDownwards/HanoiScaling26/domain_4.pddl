(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk - place stage)

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)               ; place ?p has nothing immediately on top
    (smaller ?d1 - disk ?d2 - disk)  ; disk ?d1 is smaller than disk ?d2
    (next ?s1 - stage ?s2 - stage)   ; temporal successor relation for contiguous stages
    (stage-ready ?s - stage)         ; exactly one stage is active at a time
  )

  ;; Move a clear disk from a place onto an empty peg (peg must be clear).
  (:action mover-move-to-peg
    :parameters (?disk - disk ?from - place ?to - peg ?cur - stage ?next - stage)
    :precondition (and
      (on ?disk ?from)
      (clear ?disk)
      (clear ?to)             ; destination peg is empty on top
      (stage-ready ?cur)
      (next ?cur ?next)
      (not (on ?disk ?to))    ; disallow no-op move to same place
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?to)
      (not (clear ?to))       ; peg now has something on top
      (clear ?from)           ; the place from which disk was removed becomes clear
      (not (stage-ready ?cur))
      (stage-ready ?next)
    )
  )

  ;; Move a clear disk from a place onto a clear disk (must be smaller than the target).
  (:action mover-move-to-disk
    :parameters (?disk - disk ?from - place ?target - disk ?cur - stage ?next - stage)
    :precondition (and
      (on ?disk ?from)
      (clear ?disk)
      (clear ?target)
      (smaller ?disk ?target) ; moved disk must be smaller than target disk
      (stage-ready ?cur)
      (next ?cur ?next)
      (not (on ?disk ?target)) ; disallow no-op move to same place
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?target)
      (not (clear ?target))   ; target disk no longer clear
      (clear ?from)           ; place from which disk was removed becomes clear
      (not (stage-ready ?cur))
      (stage-ready ?next)
    )
  )
)