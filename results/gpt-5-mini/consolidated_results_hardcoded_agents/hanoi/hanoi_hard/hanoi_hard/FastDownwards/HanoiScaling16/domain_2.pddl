(define (domain hanoi6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk placement predicates
    (on-peg ?d - disk ?p - peg)       ; ?d is directly on peg ?p (no disk under it)
    (on-disk ?d - disk ?under - disk) ; ?d is directly on top of disk ?under
    (top ?p - peg ?d - disk)          ; ?d is the topmost disk on peg ?p
    (top-empty ?p - peg)              ; peg ?p currently has no disks

    ;; size ordering
    (smaller ?d1 - disk ?d2 - disk)   ; ?d1 is strictly smaller than ?d2

    ;; explicit stage progression (discrete time / ordered stages)
    (next ?s - stage ?s2 - stage)     ; successor relation between stages
    (at-stage ?s - stage)             ; current global stage
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; MOVER actions (explicit stage progression)        ;;
  ;; Each action moves exactly one top disk and        ;;
  ;; consumes one stage: requires (at-stage ?s) and    ;;
  ;; (next ?s ?s2) and effects replace the stage.     ;;
  ;; Four action schemas cover all top/source & target ;;
  ;; combinations without any bookkeeping shortcuts.    ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; 1) Move a top disk that is directly on a peg to an empty peg
  (:action mover_move_onpeg_to_emptypeg
    :parameters (?d - disk ?src - peg ?tgt - peg ?s - stage ?s2 - stage)
    :precondition (and
      (top ?src ?d)
      (on-peg ?d ?src)
      (top-empty ?tgt)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)

      ;; source updates: disk removed from source peg; source becomes empty
      (not (top ?src ?d))
      (not (on-peg ?d ?src))
      (top-empty ?src)

      ;; target updates: disk becomes top on target peg
      (not (top-empty ?tgt))
      (on-peg ?d ?tgt)
      (top ?tgt ?d)
    )
  )

  ;; 2) Move a top disk that is directly on a peg to become on top of another disk
  (:action mover_move_onpeg_to_disk
    :parameters (?d - disk ?src - peg ?tgt - peg ?under - disk ?s - stage ?s2 - stage)
    :precondition (and
      (top ?src ?d)
      (on-peg ?d ?src)
      (top ?tgt ?under)        ; target peg non-empty with top disk ?under
      (smaller ?d ?under)      ; size ordering: moving disk must be smaller
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)

      ;; source updates: disk removed; source becomes empty
      (not (top ?src ?d))
      (not (on-peg ?d ?src))
      (top-empty ?src)

      ;; target updates: place disk on top of existing disk ?under
      (not (top ?tgt ?under))
      (on-disk ?d ?under)
      (top ?tgt ?d)
    )
  )

  ;; 3) Move a top disk that is directly on another disk to an empty peg
  (:action mover_move_ondisk_to_emptypeg
    :parameters (?d - disk ?under - disk ?src - peg ?tgt - peg ?s - stage ?s2 - stage)
    :precondition (and
      (top ?src ?d)
      (on-disk ?d ?under)
      (top-empty ?tgt)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)

      ;; source updates: remove moving disk and expose the disk under it as new top
      (not (top ?src ?d))
      (not (on-disk ?d ?under))
      (top ?src ?under)

      ;; target updates: disk becomes directly on the empty peg and top there
      (not (top-empty ?tgt))
      (on-peg ?d ?tgt)
      (top ?tgt ?d)
    )
  )

  ;; 4) Move a top disk that is directly on another disk to become directly on another top disk
  (:action mover_move_ondisk_to_disk
    :parameters (?d - disk ?under - disk ?src - peg ?tgt - peg ?dest - disk ?s - stage ?s2 - stage)
    :precondition (and
      (top ?src ?d)
      (on-disk ?d ?under)
      (top ?tgt ?dest)        ; destination peg has top disk ?dest
      (smaller ?d ?dest)      ; size ordering
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; stage progression
      (not (at-stage ?s))
      (at-stage ?s2)

      ;; source updates: remove moving disk and expose the disk under it as new top
      (not (top ?src ?d))
      (not (on-disk ?d ?under))
      (top ?src ?under)

      ;; target updates: place disk on top of existing disk ?dest
      (not (top ?tgt ?dest))
      (on-disk ?d ?dest)
      (top ?tgt ?d)
    )
  )
)