; Domain: hanoi_orchestrator
; Purpose: Orchestrator integrates contributions from:
; - disk_manager: supplies disk identities and size ordering (encoded as static predicate smaller/2)
; - move_planner: supplies legal move operators (encoded as two explicit actions that disallow illegal placements)
; - auditor: enforces invariants and bookkeeping (encoded as explicit clear/1 predicates and transitions that make illegal states impossible)
(define (domain hanoi-orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk place)  ; pegs are objects of type place; disks are of type disk

  ; Predicates:
  ; on ?d ?p  - disk ?d is directly on place ?p (where place may be a peg or another disk, both typed as place)
  ; clear ?p - the place (peg or disk) currently has nothing on top (i.e., it is a legal target for a disk)
  ; smaller ?d1 ?d2 - disk ?d1 is strictly smaller than disk ?d2 (static / invariant)
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d1 - disk ?d2 - disk)
  )

  ; Action: move a top disk onto an empty place (peg or disk considered as a place)
  ; (Agent: move_planner)
  (:action move-planner-move-to-empty
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)       ; disk is located at source (directly on ?from)
      (clear ?d)          ; disk is top of its source
      (clear ?to)         ; destination place is empty (no top disk)
      (not (= ?from ?to)) ; disallow no-op moves
    )
    :effect (and
      (not (on ?d ?from)) ; remove old location
      (on ?d ?to)         ; place disk on destination
      (clear ?from)       ; the source place becomes clear (the disk above it was removed)
      (not (clear ?to))   ; the destination is no longer clear since ?d sits on it
    )
  )

  ; Action: move a top disk onto another disk that is larger (destination place already occupied)
  ; (Agent: move_planner)
  (:action move-planner-move-onto-disk
    :parameters (?d - disk ?from - place ?to - place ?top - disk)
    :precondition (and
      (on ?d ?from)          ; disk is at source
      (clear ?d)             ; disk is top of its source
      (on ?top ?to)          ; the top disk at destination is ?top (so ?to is not empty)
      (clear ?top)           ; ?top is the top disk at ?to
      (smaller ?d ?top)      ; size constraint: moving disk must be smaller than destination top
      (not (= ?from ?to))    ; disallow no-op moves
    )
    :effect (and
      (not (on ?d ?from))    ; remove old location
      (on ?d ?to)            ; place disk on destination
      (clear ?from)          ; source place becomes clear
      (not (clear ?top))     ; the former top disk at destination is no longer clear
    )
  )

  ; Auditor / disk_manager invariants are encoded as static facts in problem instance:
  ; - smaller/2 is static (not changed by actions)
  ; - clear/on are changed only by actions above so illegal states are unreachable under these operators
)