(define (domain hanoi-6)
  ;; Domain: 6-disk Tower of Hanoi for FastDownward
  ;; Integrates orchestrator intent: all move actions are labelled with "orchestrator_"
  ;; Rules enforced:
  ;;  - move exactly one top disk at a time
  ;;  - only top disks may move (checked by (clear ?d))
  ;;  - no larger disk may be placed on a smaller disk (checked by (larger ?to ?d) for disk destinations)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place place)

  (:predicates
    ;; on ?d ?p : disk ?d is directly on place ?p (place = peg or disk)
    (on ?d - disk ?p - place)
    ;; clear ?p : nothing is directly on place ?p (p can be peg or disk)
    (clear ?p - place)
    ;; larger ?big ?small : first disk is strictly larger than second disk
    (larger ?big - disk ?small - disk)
  )

  ;; Action: move a clear disk from any place to an empty peg
  ;; This represents an orchestrator-initiated physical move placing a disk on an empty peg.
  (:action orchestrator_move_disk_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)       ; disk must be on some support
      (clear ?d)          ; and be the top disk on that support
      (clear ?to)         ; target peg must be empty (no disk directly on it)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)       ; support below becomes clear after removal
      (not (clear ?to))   ; peg is no longer clear after placement
    )
  )

  ;; Action: move a clear disk from any place to the top of another clear disk,
  ;; allowed only if the destination disk is strictly larger than the moved disk.
  ;; This represents an orchestrator-initiated physical move placing a disk onto another disk.
  (:action orchestrator_move_disk_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)       ; disk must be on some support
      (clear ?d)          ; and be the top disk on that support
      (clear ?to)         ; destination disk must be top (no disk on it)
      (larger ?to ?d)     ; and destination disk must be larger than moved disk
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)       ; support below becomes clear after removal
      (not (clear ?to))   ; destination disk is no longer clear after placement
    )
  )
)