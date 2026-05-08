(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  ;; Types:
  ;; - place is the supertype for supports (pegs and disks).
  ;; - peg and disk are declared as subtypes of place below.
  (:types place agent stage peg disk - place)

  (:predicates
    ;; Direct support: disk ?d is directly on place ?p (a peg or another disk).
    (on ?d - disk ?p - place)

    ;; There is nothing directly on top of the place ?p (place may be a peg or a disk).
    (clear ?p - place)

    ;; Precomputed placement legality: disk ?d may be placed onto place ?p (peg or disk).
    (allowed ?d - disk ?p - place)

    ;; Current discrete stage marker and successor relation for stages.
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Single atomic move action that advances the global stage by exactly one successor step.
  ;; It moves a disk that is on top of its support (?from) to a destination (?to) that must be clear
  ;; and allowed for that disk. The action requires and enforces the stage successor (no slack).
  (:action move
    :parameters (?d - disk ?from - place ?to - place ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)    ; must advance to the immediate successor stage
      (on ?d ?from)    ; disk is directly supported by ?from
      (clear ?d)       ; disk has nothing on top (is the top disk on its support)
      (clear ?to)      ; destination is top (either empty peg or top of a disk)
      (allowed ?d ?to) ; placement obeys size ordering
    )
    :effect (and
      ;; Move the disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; Update clear predicates:
      ;; Destination is now occupied on top (no longer clear).
      (not (clear ?to))
      ;; The source becomes clear (the disk that was on top left it).
      (clear ?from)
      ;; The moved disk remains clear (nothing on top of it after the move).
      (clear ?d)

      ;; Advance the global stage marker: consume current ?s and make ?s2 current.
      (not (current ?s))
      (current ?s2)
    )
  )
)