(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk ?d is directly on place ?p (place can be a peg or another disk)
    (on ?d - disk ?p - object)
    ;; place ?p has nothing immediately on top
    (clear ?p - object)
    ;; disk size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; temporal successor relation for contiguous stages
    (next ?s1 - stage ?s2 - stage)
    ;; exactly one stage is active at a time; actions require the current stage and enable the next
    (stage-ready ?s - stage)
  )

  ;; Move a top disk from any place (peg or disk) onto an empty peg.
  (:action mover-move-to-peg
    :parameters (?disk - disk ?from - object ?to - peg ?cur - stage ?next - stage)
    :precondition (and
      (on ?disk ?from)      ; disk sits on 'from'
      (clear ?disk)         ; disk is the top disk on its stack
      (clear ?to)           ; destination peg has nothing on top (is empty on top)
      (stage-ready ?cur)    ; current stage active
      (next ?cur ?next)     ; next stage is the immediate successor
      (not (on ?disk ?to))  ; disallow no-op (moving to same place)
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?to)
      (not (clear ?to))     ; destination no longer clear
      (clear ?from)         ; source now clear on top
      (not (stage-ready ?cur))
      (stage-ready ?next)
    )
  )

  ;; Move a top disk from any place (peg or disk) onto a clear disk (must be larger than moved disk).
  (:action mover-move-to-disk
    :parameters (?disk - disk ?from - object ?target - disk ?cur - stage ?next - stage)
    :precondition (and
      (on ?disk ?from)         ; disk sits on 'from'
      (clear ?disk)            ; disk is the top disk on its stack
      (clear ?target)          ; target disk has nothing on top
      (smaller ?disk ?target)  ; moved disk must be smaller than target
      (stage-ready ?cur)       ; current stage active
      (next ?cur ?next)        ; next stage is the immediate successor
      (not (on ?disk ?target)) ; disallow no-op
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?target)
      (not (clear ?target))    ; target no longer clear
      (clear ?from)            ; source now clear on top
      (not (stage-ready ?cur))
      (stage-ready ?next)
    )
  )
)