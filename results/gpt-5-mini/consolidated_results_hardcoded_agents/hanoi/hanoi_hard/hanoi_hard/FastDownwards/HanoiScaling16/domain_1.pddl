(define (domain hanoi6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk placement predicates
    (on-peg ?d - disk ?p - peg)      ; disk ?d is directly on peg ?p (no disk under it)
    (on-disk ?d - disk ?under - disk) ; disk ?d is directly on disk ?under
    (top ?p - peg ?d - disk)         ; disk ?d is the topmost disk on peg ?p
    (top-empty ?p - peg)            ; peg ?p currently has no disks

    ;; size ordering
    (smaller ?d1 - disk ?d2 - disk) ; ?d1 is strictly smaller than ?d2

    ;; explicit stage progression (discrete time / ordered stages)
    (next ?s - stage ?s2 - stage)   ; successor relation between stages
    (at-stage ?s - stage)           ; current global stage
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; MOVER actions (stage-progressing, explicit)       ;;
  ;; Each action consumes exactly one stage:            ;;
  ;; precondition includes (at-stage ?s) and (next ?s ?s2) ;;
  ;; effect removes (at-stage ?s) and asserts (at-stage ?s2) ;;
  ;; All movement constraints (top-only, size order) are enforced. ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Move a top disk that is directly on a peg to an empty peg
  (:action mover_move_onpeg_to_emptypeg
    :parameters (?d - disk ?p - peg ?q - peg ?s - stage ?s2 - stage)
    :precondition (and
      (top ?p ?d)
      (on-peg ?d ?p)
      (top-empty ?q)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)

      ;; source updates
      (not (top ?p ?d))
      (not (on-peg ?d ?p))
      (top-empty ?p)

      ;; target updates
      (not (top-empty ?q))
      (on-peg ?d ?q)
      (top ?q ?d)
    )
  )

  ;; Move a top disk that is directly on a peg to become directly on another top disk
  (:action mover_move_onpeg_to_disk
    :parameters (?d - disk ?p - peg ?q - peg ?dest - disk ?s - stage ?s2 - stage)
    :precondition (and
      (top ?p ?d)
      (on-peg ?d ?p)
      (top ?q ?dest)
      (smaller ?d ?dest)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)

      ;; source updates
      (not (top ?p ?d))
      (not (on-peg ?d ?p))
      (top-empty ?p)

      ;; target updates
      (not (top ?q ?dest))
      (on-disk ?d ?dest)
      (top ?q ?d)
    )
  )

  ;; Move a top disk that is directly on another disk to an empty peg
  (:action mover_move_ondisk_to_emptypeg
    :parameters (?d - disk ?under - disk ?p - peg ?q - peg ?s - stage ?s2 - stage)
    :precondition (and
      (top ?p ?d)
      (on-disk ?d ?under)
      (top-empty ?q)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)

      ;; source updates
      (not (top ?p ?d))
      (not (on-disk ?d ?under))
      (top ?p ?under)

      ;; target updates
      (not (top-empty ?q))
      (on-peg ?d ?q)
      (top ?q ?d)
    )
  )

  ;; Move a top disk that is directly on another disk to become directly on another top disk
  (:action mover_move_ondisk_to_disk
    :parameters (?d - disk ?under - disk ?p - peg ?q - peg ?dest - disk ?s - stage ?s2 - stage)
    :precondition (and
      (top ?p ?d)
      (on-disk ?d ?under)
      (top ?q ?dest)
      (smaller ?d ?dest)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)

      ;; source updates
      (not (top ?p ?d))
      (not (on-disk ?d ?under))
      (top ?p ?under)

      ;; target updates
      (not (top ?q ?dest))
      (on-disk ?d ?dest)
      (top ?q ?d)
    )
  )

  ;; No auxiliary repair or bookkeeping actions are provided; the stage progression
  ;; combined with the top/top-empty predicates enforces contiguous, stepwise transitions.
)