; PDDL domain for the classical 3-peg Tower of Hanoi with named disks A..G.
; Modeling choices (explained):
; - Types: a supertype 'place' is used so both 'disk' and 'peg' are usable as destinations or sources.
;   disk - place; peg - place. This lets (on ?d ?p) have ?p be either a peg or a disk.
; - Predicates:
;   (on ?d ?p) : disk ?d is directly on place ?p (p can be a peg or another disk).
;   (clear ?p)  : place ?p (peg or disk) currently has no disk on top (i.e. is a top item or empty peg).
;   (smaller ?d1 ?d2) : static size ordering; true iff d1 is strictly smaller than d2.
; - Two action schemas are provided to avoid disjunctive preconditions:
;   move-to-peg: move a top disk onto an empty peg.
;   move-to-disk: move a top disk onto an empty disk that is larger than the moving disk.
; - Preconditions enforce that only the top (clear) disk can be moved and the destination must be clear.
; - Effects maintain the 'on' and 'clear' facts so there is no bookkeeping token or post-hoc penalty action.
; - No equality precondition is used and :requirements are restricted to :strips, :typing, :negative-preconditions
;   to remain compatible with FastDownward per the specification.
; - This encoding prohibits illegal placements (larger on smaller) by construction.
; - No placeholders or soft constraints; all preferences are encoded as hard constraints.

(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types place disk peg)
  ; Note: disk and peg are subtypes of place so they can be used where a place is required.
  ; (disk - place) is the PDDL syntax: declare disk is a subtype of place.
  (:constants) ; empty constants block — objects appear in the problem file

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)              ; place ?p has no disk on top (i.e., is a top item or an empty peg)
    (smaller ?d1 - disk ?d2 - disk) ; static size relation: d1 is strictly smaller than d2
  )

  ; Move a top disk from any place onto an empty peg.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)       ; only a disk with nothing on top may be moved
                    (clear ?to)      ; destination peg must be empty (no disk on top)
                   )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)   ; the place we moved from becomes clear
              (not (clear ?to)) ; the destination peg is no longer clear
             )
  )

  ; Move a top disk from any place onto an empty disk that is larger than the moving disk.
  ; The 'smaller' predicate enforces the size constraint; no larger-on-smaller moves are possible.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (smaller ?d ?to) ; moving disk must be strictly smaller than destination disk
                   )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)
              (not (clear ?to))
             )
  )
)