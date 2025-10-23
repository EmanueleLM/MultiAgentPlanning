(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place agent)

  (:predicates
    ;; disk d is directly on place p (p = peg or disk)
    (on ?d - disk ?p - place)
    ;; place (peg or disk) has nothing on top of it (is clear / top)
    (clear ?p - place)
    ;; size ordering: smaller d1 d2 means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; agent represents a peg (agent roles are explicit)
    (represents ?a - agent ?p - peg)
  )

  ;; Move a top disk onto an empty peg.
  ;; Agents are explicit parameters (roles are visible), the action enforces single-disk topness
  ;; and that the target peg is empty (clear).
  (:action move-to-peg
    :parameters (?ag-from - agent ?ag-to - agent ?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)      ;; disk is directly on some place (disk or peg)
      (clear ?d)         ;; disk has no disk on top => it is movable (top)
      (clear ?to)        ;; target peg has nothing on top
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)      ;; the place that supported the moved disk becomes clear/top
      (not (clear ?to))  ;; target peg becomes occupied (not clear)
    )
  )

  ;; Move a top disk onto another top disk (target must be larger).
  (:action move-to-disk
    :parameters (?ag-from - agent ?ag-to - agent ?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)      ;; disk is directly on some place
      (clear ?d)         ;; moving disk is top
      (clear ?to)        ;; target disk is top (so we place onto it)
      (smaller ?d ?to)   ;; moving disk must be smaller than the target disk
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)      ;; support becomes clear/top
      (not (clear ?to))  ;; target disk is no longer clear (it now has a disk on top)
    )
  )
)