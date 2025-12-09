(define (domain hanoi)
  :requirements :strips :typing :negative-preconditions
  :types
    disk peg - place
    stage
  :predicates
    ;; disk is directly on a place (either another disk or a peg)
    (on ?d - disk ?p - place)
    ;; a place (disk or peg) has nothing on top of it
    (clear ?p - place)
    ;; static size ordering: (smaller d1 d2) means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; temporal sequencing: successor relation between stages
    (next ?s1 - stage ?s2 - stage)
    ;; which stage is currently enabled (enforces contiguous progression)
    (stage-ready ?s - stage)
  ;; Move a top disk onto an empty peg
  (:action mover-move-to-peg
    :parameters (?disk - disk ?from - place ?peg - peg ?cur - stage ?next - stage)
    :precondition (and
                    (on ?disk ?from)       ; disk is on its supporting place
                    (clear ?disk)          ; disk is top-most at its place
                    (clear ?peg)           ; target peg must be empty (stacking is onto disk otherwise)
                    (stage-ready ?cur)     ; current stage must be enabled
                    (next ?cur ?next)      ; the action advances to a successor stage
                    (not (= ?from ?peg))   ; no-op move forbidden
                  )
    :effect (and
              (not (on ?disk ?from))
              (on ?disk ?peg)
              (not (clear ?peg))    ; peg now has disk on top
              (clear ?from)         ; former support becomes clear
              (not (stage-ready ?cur))
              (stage-ready ?next)
            )
  )
  ;; Move a top disk onto another disk (must be smaller)
  (:action mover-move-to-disk
    :parameters (?disk - disk ?from - place ?target - disk ?cur - stage ?next - stage)
    :precondition (and
                    (on ?disk ?from)
                    (clear ?disk)
                    (clear ?target)        ; target disk must be top-most on its stack
                    (smaller ?disk ?target) ; enforce size ordering
                    (stage-ready ?cur)
                    (next ?cur ?next)
                    (not (= ?from ?target))
                  )
    :effect (and
              (not (on ?disk ?from))
              (on ?disk ?target)
              (not (clear ?target))
              (clear ?from)
              (not (stage-ready ?cur))
              (stage-ready ?next)
            )
  )
)