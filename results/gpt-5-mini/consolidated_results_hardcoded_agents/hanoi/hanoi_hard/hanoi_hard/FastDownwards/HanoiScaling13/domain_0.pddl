; Tower of Hanoi domain for FastDownwards
; Author: orchestrator
; Notes:
; - Types: disk and peg are subtypes of place.
; - Two move actions are provided to avoid disjunctions in preconditions:
;   move-to-disk  : move a disk onto another disk (requires size constraint).
;   move-to-peg   : move a disk onto an empty peg.
; - Agent annotations: move actions are annotated in comments as operator actions.
; - The domain enforces classical Tower-of-Hanoi rules:
;   * one disk moved at a time
;   * only the top disk on a place may be moved (clear predicate)
;   * no larger disk may be placed on a smaller disk (smaller relation)
; - This domain uses only :strips, :typing and :negative-preconditions.
(:requirements :strips :typing :negative-preconditions)

(:types place disk peg)
; disk and peg are subtypes of place
; note: subtyping declared below in type hierarchy
; PDDL syntax for subtypes:
; disk peg - place
(:types disk peg - place)

(:predicates
    ; structural predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (place = disk or peg)
    (clear ?p - place)              ; nothing is on top of place ?p (place can be peg or disk)

    ; type predicates (optional but explicit for clarity)
    (disk? ?d - disk)
    (peg? ?p - peg)

    ; static size relation: true iff first disk is strictly smaller than second
    (smaller ?d1 - disk ?d2 - disk)
)

; -------------------------
; Actions
; -------------------------
; operator action: move disk onto another disk
(:action move-to-disk
 :parameters (?d - disk ?from - place ?to - disk)
 :precondition (and
    (on ?d ?from)
    (clear ?d)
    (clear ?to)
    (smaller ?d ?to)
 )
 :effect (and
    (not (on ?d ?from))
    (on ?d ?to)
    (not (clear ?to))
    (clear ?from)
    ; ?d remains clear after move (it had nothing on it before and still has nothing)
 )
)

; operator action: move disk onto an empty peg
(:action move-to-peg
 :parameters (?d - disk ?from - place ?to - peg)
 :precondition (and
    (on ?d ?from)
    (clear ?d)
    (clear ?to)               ; peg must be empty (top of peg clear)
 )
 :effect (and
    (not (on ?d ?from))
    (on ?d ?to)
    (not (clear ?to))
    (clear ?from)
    ; ?d remains clear after move
 )
)