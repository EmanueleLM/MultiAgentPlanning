(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types loc stage disk peg - loc)

  (:predicates
    ;; disk ?d is directly on location ?p (where ?p is a peg or another disk)
    (on ?d - disk ?p - loc)
    ;; nothing is directly on top of location ?p
    (clear ?p - loc)
    ;; size ordering: ?d1 is strictly smaller than ?d2 (static)
    (smaller ?d1 - disk ?d2 - disk)
    ;; staging predicates to enforce exact move-by-move progression
    (at-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk from a source location onto an empty peg. Consumes exactly one stage step.
  (:action move-to-peg
    :parameters (?d - disk ?src - loc ?dst - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?src)           ; ?d is directly on ?src
      (clear ?d)             ; ?d is top of its stack
      (clear ?dst)           ; destination peg has nothing directly on it
      (at-stage ?s)
      (next ?s ?s2)          ; advance to immediate successor stage
      (not (= ?src ?dst))    ; src and dst must be different
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?dst)
      (clear ?src)           ; after removing ?d, the source location becomes clear
      (not (clear ?dst))     ; destination location now has something on top
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk from a source location onto the top of a strictly larger disk. Consumes exactly one stage step.
  (:action move-to-disk
    :parameters (?d - disk ?src - loc ?dst - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?src)           ; ?d is directly on ?src
      (clear ?d)             ; ?d is top of its stack
      (clear ?dst)           ; destination disk must be top of its stack
      (smaller ?d ?dst)      ; moving disk must be smaller than the disk it will be placed on
      (at-stage ?s)
      (next ?s ?s2)          ; advance to immediate successor stage
      (not (= ?src ?dst))    ; src and dst must be different
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?dst)
      (clear ?src)           ; source becomes clear after removal
      (not (clear ?dst))     ; destination disk no longer clear (now has ?d on top)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)