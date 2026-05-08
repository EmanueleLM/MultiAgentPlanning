(define (domain hanoi_orchestrated)
  ; Requirements limited to STRIPS, TYPING, and NEGATIVE-PRECONDITIONS for FastDownwards compatibility.
  (:requirements :strips :typing :negative-preconditions)

  ; Types
  (:types peg disk)

  ; Predicates
  ; - top ?p ?d          : disk ?d is currently the top disk on peg ?p
  ; - empty ?p           : peg ?p is empty (has no disks)
  ; - on ?d ?p           : disk ?d is directly on peg ?p (i.e., bottom-most disk directly on peg)
  ; - on-disk ?u ?v      : disk ?u is directly on disk ?v (u is immediately above v)
  ; - smaller ?u ?v      : disk ?u has strictly smaller size than disk ?v
  ; - distinct ?p1 ?p2   : peg ?p1 and peg ?p2 are distinct (helper to forbid same-peg moves)
  (:predicates
    (top ?p - peg ?d - disk)
    (empty ?p - peg)
    (on ?d - disk ?p - peg)
    (on-disk ?u - disk ?v - disk)
    (smaller ?u - disk ?v - disk)
    (distinct ?p1 - peg ?p2 - peg)
  )

  ; Agent-level intentions (kept as comments, not used by the planner):
  ; strategy_mover intention: provide a 15-move plan to move the stack from middle peg to left peg.
  ; observer intention: validate and report state after each sequential move.
  ; consistency_audit intention: ensure each move obeys top-disk, size, and sequential constraints.
  ;
  ; Reconciliation: canonical object names normalized as peg_left, peg_middle, peg_right and disk_A..disk_D.
  ; All preferences from the natural-language input are interpreted as hard constraints (e.g., only-top-disk moves,
  ; strict size ordering, single-disk atomic moves). No bookkeeping shortcuts are introduced.

  ; Actions:
  ; We explicitly separate four lawful move patterns to remain within STRIPS (no conditional effects):
  ; 1) disk is directly on source peg, destination peg is empty
  ; 2) disk is directly on source peg, destination peg has a top disk
  ; 3) disk is on another disk (in source), destination peg is empty
  ; 4) disk is on another disk (in source), destination peg has a top disk
  ;
  ; Each action requires the moved disk to be the top on its source peg. Destination must be distinct
  ; from source (enforced via the distinct predicate). For placing onto a non-empty destination the size
  ; relation (smaller) is required.

  (:action move_from_peg_to_empty
    :parameters (?x - disk ?s - peg ?t - peg)
    :precondition (and
      (top ?s ?x)
      (on ?x ?s)
      (empty ?t)
      (distinct ?s ?t)
    )
    :effect (and
      (not (top ?s ?x))
      (not (on ?x ?s))
      (not (empty ?t))
      (on ?x ?t)
      (top ?t ?x)
      (empty ?s)
    )
  )

  (:action move_from_peg_to_nonempty
    :parameters (?x - disk ?s - peg ?t - peg ?z - disk)
    :precondition (and
      (top ?s ?x)
      (on ?x ?s)
      (top ?t ?z)
      (smaller ?x ?z)
      (distinct ?s ?t)
    )
    :effect (and
      (not (top ?s ?x))
      (not (on ?x ?s))
      (not (top ?t ?z))
      (on-disk ?x ?z)
      (top ?t ?x)
      (empty ?s)
    )
  )

  (:action move_from_disk_to_empty
    :parameters (?x - disk ?y - disk ?s - peg ?t - peg)
    :precondition (and
      (top ?s ?x)
      (on-disk ?x ?y)
      (empty ?t)
      (distinct ?s ?t)
    )
    :effect (and
      (not (top ?s ?x))
      (not (on-disk ?x ?y))
      (top ?s ?y)
      (not (empty ?t))
      (on ?x ?t)
      (top ?t ?x)
    )
  )

  (:action move_from_disk_to_nonempty
    :parameters (?x - disk ?y - disk ?s - peg ?t - peg ?z - disk)
    :precondition (and
      (top ?s ?x)
      (on-disk ?x ?y)
      (top ?t ?z)
      (smaller ?x ?z)
      (distinct ?s ?t)
    )
    :effect (and
      (not (top ?s ?x))
      (not (on-disk ?x ?y))
      (top ?s ?y)
      (not (top ?t ?z))
      (on-disk ?x ?z)
      (top ?t ?x)
    )
  )
)