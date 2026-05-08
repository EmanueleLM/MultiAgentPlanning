(define (domain hanoi)
  (:requirements :strips :negative-preconditions)

  (:predicates
    ;; disk ?d is directly on place ?p (place can be a peg or another disk)
    (on ?d ?p)
    ;; place ?p has nothing immediately on top
    (clear ?p)
    ;; disk size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 ?d2)
    ;; temporal successor relation for contiguous stages
    (next ?s1 ?s2)
    ;; exactly one stage is active at a time; actions require the current stage and enable the next
    (stage-ready ?s)
    ;; unary type tags (domain is untyped; use init facts to classify objects)
    (is-disk ?x)
    (is-peg ?x)
    (is-stage ?s)
  )

  ;; Move a top disk from any place (peg or disk) onto an empty peg.
  (:action mover-move-to-peg
    :parameters (?disk ?from ?to ?cur ?next)
    :precondition (and
      (is-disk ?disk)
      (on ?disk ?from)        ; disk sits on 'from'
      (clear ?disk)           ; disk is the top disk on its stack
      (clear ?to)             ; destination peg has nothing on top
      (is-peg ?to)            ; destination must be a peg
      (is-stage ?cur)         ; current stage active
      (is-stage ?next)
      (next ?cur ?next)       ; next stage is the immediate successor
      (stage-ready ?cur)
      (not (on ?disk ?to))    ; disallow no-op (moving to same place)
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?to)
      (not (clear ?to))     ; destination no longer clear
      (clear ?from)         ; source (the object the disk was on) becomes clear
      (not (stage-ready ?cur))
      (stage-ready ?next)
    )
  )

  ;; Move a top disk from any place (peg or disk) onto a clear disk (must be larger than moved disk).
  (:action mover-move-to-disk
    :parameters (?disk ?from ?target ?cur ?next)
    :precondition (and
      (is-disk ?disk)
      (is-disk ?target)
      (on ?disk ?from)         ; disk sits on 'from'
      (clear ?disk)            ; disk is the top disk on its stack
      (clear ?target)          ; target disk has nothing on top
      (smaller ?disk ?target)  ; moved disk must be smaller than target
      (is-stage ?cur)
      (is-stage ?next)
      (next ?cur ?next)
      (stage-ready ?cur)
      (not (on ?disk ?target)) ; disallow no-op
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?target)
      (not (clear ?target))    ; target no longer clear
      (clear ?from)            ; source becomes clear on top
      (not (stage-ready ?cur))
      (stage-ready ?next)
    )
  )
)