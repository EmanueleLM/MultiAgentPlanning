(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  ;; type hierarchy: disk and peg are subtypes of place; stage is separate
  (:types disk peg - place stage)

  (:predicates
    ;; disk ?d is directly on location ?p (p is a peg or another disk)
    (on ?d - disk ?p - place)
    ;; nothing is on top of place ?p (p may be a peg or a disk)
    (clear ?p - place)
    ;; size ordering: ?d1 is smaller than ?d2 (static invariant)
    (smaller ?d1 - disk ?d2 - disk)
    ;; discrete stage/time modeling
    (at-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk onto an empty peg (peg must be empty at top).
  ;; The action consumes exactly one stage step: requires (at-stage ?s) and (next ?s ?s2).
  ;; It is forbidden to "move" the disk onto the same place it already occupies
  ;; by requiring that the disk is not already on the target (not (on ?d ?peg)).
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?peg - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)                ;; disk ?d is directly on ?from
      (clear ?d)                   ;; ?d is the top disk at its source
      (clear ?peg)                 ;; target peg must be empty at top
      (not (on ?d ?peg))           ;; disallow trivial move onto same place
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)                ;; the place it came from becomes clear
      (not (clear ?peg))           ;; target peg no longer clear (now has a top disk)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk onto another disk (must be smaller than the disk below).
  ;; Consumes one stage step. Disallows moving onto the same place by checking (not (on ?d ?below)).
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?below - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)                ;; disk ?d is directly on ?from
      (clear ?d)                   ;; ?d is the top disk at its source
      (clear ?below)               ;; target disk must have nothing on it
      (smaller ?d ?below)          ;; moved disk must be smaller than the target disk
      (not (on ?d ?below))         ;; disallow trivial move onto same place
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?below)
      (clear ?from)                ;; the source place becomes clear after removal
      (not (clear ?below))         ;; target disk now has a disk on top
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)