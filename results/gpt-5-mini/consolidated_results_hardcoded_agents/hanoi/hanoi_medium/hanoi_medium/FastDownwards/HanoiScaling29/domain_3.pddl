(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  ;; Types:
  ;;  loc: the supertype for stack locations (pegs and disks that can support other disks)
  ;;  stage: discrete time/stage objects
  ;;  disk, peg are subtypes of loc so they can be used where a location is expected
  (:types loc stage disk peg - loc)

  (:predicates
    ;; disk ?d is directly on location ?p (where ?p is a peg or another disk)
    (on ?d - disk ?p - loc)
    ;; nothing is directly on top of location ?p
    (clear ?p - loc)
    ;; size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; staging predicates to enforce exact move count and immediate successor transitions
    (at-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk onto an empty peg, consume exactly one stage step.
  (:action move-to-peg
    :parameters (?d - disk ?src - loc ?dst - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?src)           ; ?d is directly on ?src
      (clear ?d)             ; ?d is top of its stack
      (clear ?dst)           ; destination peg is empty (no disk directly on it)
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

  ;; Move a top disk onto the top of a strictly larger disk, consume exactly one stage step.
  (:action move-to-disk
    :parameters (?d - disk ?src - loc ?dst - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?src)           ; ?d is directly on ?src
      (clear ?d)             ; ?d is top of its stack
      (clear ?dst)           ; destination disk must be top of its stack
      (smaller ?d ?dst)      ; cannot place a larger disk onto a smaller one
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