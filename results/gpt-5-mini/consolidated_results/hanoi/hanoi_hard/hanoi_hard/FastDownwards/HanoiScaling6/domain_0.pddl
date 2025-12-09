(define (domain hanoi-multiagent)
  ; Domain: Tower of Hanoi adapted for FastDownwards (classical, sequential)
  ; Integrated agents:
  ;   - mover_analysis: provides "start-move" actions (picking up a top disk)
  ;   - audit_report:  provides "complete-move" actions (placing a held disk)
  ;
  ; Comments / assumptions (explicit as required):
  ;   - Assumption: diskA is the smallest disk and diskF is the largest.
  ;     Size order: diskA < diskB < diskC < diskD < diskE < diskF.
  ;     This assumption is declared here as static (smaller ...) facts in the problem file.
  ;   - The domain models a two-step move to make the origins (mover_analysis) and
  ;     the audit/authorization (audit_report) contributions traceable:
  ;       1) mover_analysis_start_* picks up a legal top disk and marks a move in-progress.
  ;       2) audit_report_complete_* places the held disk and closes the move.
  ;   - The two-step protocol enforces "only one disk can be moved at a time" by
  ;     requiring the predicate (idle) to be true to start a move; starting sets (idle) false,
  ;     and only the corresponding complete action re-establishes (idle). Because actions are
  ;     atomic and (idle) gating is used, it is impossible to have two overlapping starts.
  ;
  ; Requirements:
  ;   Only solver-supported features are used: :strips, :typing, :negative-preconditions
  (:requirements :strips :typing :negative-preconditions)

  (:types
    object
    disk peg - object
  )

  (:predicates
    ; on ?d ?x  -- disk ?d is directly on object ?x (disk or peg)
    (on ?d - disk ?x - object)

    ; clear ?x -- no disk currently directly on top of object ?x (true for pegs and disks)
    (clear ?x - object)

    ; holding ?d -- the agent (mover_analysis) has picked up disk ?d (in-hand)
    (holding ?d - disk)

    ; idle -- no move currently in-progress (global locking predicate)
    (idle)

    ; smaller ?a ?b -- disk ?a is strictly smaller than disk ?b (static)
    (smaller ?a - disk ?b - disk)
  )

  ; -------------------------
  ; mover_analysis actions (start of a move: pick up a legal top disk)
  ; -------------------------

  ; Start move to an empty destination (destination is empty/top-clear)
  ; Origin: mover_analysis
  (:action mover_analysis_start_move_to_empty
    :parameters (?d - disk ?from - object ?to - object)
    :precondition (and
      (idle)                     ; no other move in-progress
      (on ?d ?from)              ; disk ?d is directly on ?from
      (clear ?d)                 ; ?d is the top disk on its support (no disk on top)
      (clear ?to)                ; destination object has no disk on top (empty-top)
    )
    :effect (and
      (not (on ?d ?from))        ; remove direct support relation from origin
      (holding ?d)               ; disk is now held
      (not (idle))               ; mark move in-progress (locks other starts)
      (clear ?from)              ; the support formerly under ?d now has nothing on top
    )
  )

  ; Start move to place onto an existing top disk that is larger
  ; Origin: mover_analysis
  (:action mover_analysis_start_move_onto_larger
    :parameters (?d - disk ?from - object ?t - disk ?t_support - object)
    :precondition (and
      (idle)
      (on ?d ?from)
      (clear ?d)
      (on ?t ?t_support)        ; ?t is currently on some support (peg or disk)
      (clear ?t)                ; ?t is top on its support
      (smaller ?d ?t)           ; size constraint: moving disk smaller than target top
    )
    :effect (and
      (not (on ?d ?from))
      (holding ?d)
      (not (idle))
      (clear ?from)
    )
  )

  ; -------------------------
  ; audit_report actions (completion of a move: place the held disk)
  ; -------------------------

  ; Complete move onto empty destination (audit_report)
  (:action audit_report_complete_move_to_empty
    :parameters (?d - disk ?to - object)
    :precondition (and
      (holding ?d)               ; disk must be currently held
      (not (idle))               ; there must be a move in-progress
      (clear ?to)                ; destination top must still be empty
    )
    :effect (and
      (not (holding ?d))
      (on ?d ?to)                ; disk is placed directly on the destination object
      (not (clear ?to))          ; destination no longer has nothing on top
      (clear ?d)                 ; placed disk has nothing on top
      (idle)                     ; move completed, global lock released
    )
  )

  ; Complete move onto a larger top disk ?t (audit_report)
  (:action audit_report_complete_move_onto_larger
    :parameters (?d - disk ?t - disk ?t_support - object)
    :precondition (and
      (holding ?d)
      (not (idle))
      (on ?t ?t_support)        ; ensure target top disk ?t still sits on its support
      (clear ?t)                ; ensure ?t is still a top disk
      (smaller ?d ?t)           ; maintain size ordering
    )
    :effect (and
      (not (holding ?d))
      (on ?d ?t)                ; placed directly on disk ?t
      (not (clear ?t))          ; target disk now has something on top
      (clear ?d)
      (idle)
    )
  )

  ; End of domain
)