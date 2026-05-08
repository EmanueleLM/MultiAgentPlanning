(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  ;; Types: place is a supertype for pegs and disks; stage models discrete time steps.
  (:types place stage disk peg - place)

  (:predicates
    ;; disk ?d is directly on place ?p (place can be a peg or a disk)
    (on ?d - disk ?p - place)
    ;; nothing directly on top of place ?p (place = peg or disk)
    (clear ?p - place)
    ;; strict size ordering predicate: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; stage/time bookkeeping
    (at-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk from any place (peg or disk) onto an empty peg, advancing one stage.
  (:action move-to-peg
    :parameters (?d - disk ?src - place ?dst - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?src)           ; ?d is directly on ?src
      (clear ?d)             ; ?d is top of its stack (nothing on it)
      (clear ?dst)           ; destination peg top must be empty
      (at-stage ?s)
      (next ?s ?s2)          ; advance exactly to the immediate successor stage
      (not (= ?src ?dst))    ; src and dst must be different places
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?dst)
      (clear ?src)           ; src place becomes clear (nothing on it)
      (not (clear ?dst))     ; dst is no longer clear (now has ?d on it)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk from any place onto the top of a strictly larger disk, advancing one stage.
  (:action move-to-disk
    :parameters (?d - disk ?src - place ?dst - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?src)           ; ?d is directly on ?src
      (clear ?d)             ; ?d is top of its stack
      (clear ?dst)           ; destination disk must be clear (top)
      (smaller ?d ?dst)      ; cannot place a larger disk on a smaller one
      (at-stage ?s)
      (next ?s ?s2)          ; advance exactly to the immediate successor stage
      (not (= ?src ?dst))    ; src and dst must be different places
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?dst)
      (clear ?src)           ; src place becomes clear
      (not (clear ?dst))     ; dst is no longer clear
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)