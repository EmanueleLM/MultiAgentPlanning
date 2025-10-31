(define (domain hanoi)
  ; Tower of Hanoi domain synthesized from peg agent summaries.
  ; Agent-origin constraints encoded as hard rules:
  ; - peg_left: only top disk may be moved; only one disk moved at a time; standard placement rule (cannot place larger on smaller).
  ; - peg_middle and peg_right: can receive disks only if empty or top disk larger than incoming; moves only allowed from a non-null top.
  ; Global constraints: only one disk moved at a time; larger disks may never be placed on smaller disks.
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ; on ?d ?s means disk ?d is directly on support ?s (support is a disk or a peg)
    (on ?d - disk ?s - (either disk peg))
    ; clear ?s means there is nothing on top of support ?s (applies to both disks and pegs)
    (clear ?s - (either disk peg))
    ; size relation: (smaller d1 d2) true iff d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ; Move a top disk from a support (peg or disk) onto an empty peg.
  ; Precondition enforces the moved disk is the top disk on its support (clear ?d),
  ; and target peg must be empty (clear ?peg). The from-support becomes clear after move.
  (:action move-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?peg - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?peg)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)
      (not (clear ?peg))
    )
  )

  ; Move a top disk from a support (peg or disk) onto another disk.
  ; Precondition enforces the moved disk is top at its support and the destination disk is top,
  ; and size ordering (moving disk must be smaller than the destination disk).
  (:action move-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?d2 - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?d2)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?d2)
      (clear ?from)
      (not (clear ?d2))
    )
  )
)