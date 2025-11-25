(define (domain hanoi-5-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg place stage)
  ;; disk and peg are subtypes of place
  (:type-constants)
  ;; Note: PDDL typing: declare disk and peg as subtypes of place via this types line:
  ;; (:types disk peg - place stage)
  ;; Some planners accept the simplified listing above; objects will be typed in the problem.

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (peg or another disk)
    (top ?d - disk)                  ; disk ?d has no disk on top of it (is the top of a stack)
    (peg-empty ?p - peg)             ; peg ?p currently has no disk directly on it
    (smaller ?d1 - disk ?d2 - disk)  ; static size ordering: ?d1 is smaller than ?d2
    (at-stage ?s - stage)            ; current global stage is ?s
    (next ?s1 - stage ?s2 - stage)   ; stage successor relation (static)
  )

  ;; Move a top disk from a disk (source) onto another disk (destination).
  ;; This action consumes one stage and enables the successor stage.
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s-next - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s-next)
      (on ?d ?from)
      (top ?d)
      (top ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (top ?from)            ; the supporting disk becomes top after removal
      (not (top ?to))        ; destination disk is no longer top (covered)
      (not (at-stage ?s))
      (at-stage ?s-next)
    )
  )

  ;; Move a top disk from a disk (source) onto an empty peg (destination peg is empty).
  (:action move-from-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s-next - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s-next)
      (on ?d ?from)
      (top ?d)
      (peg-empty ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (top ?from)            ; supporting disk becomes top
      (not (peg-empty ?to))  ; destination peg now has a disk directly on it
      (not (at-stage ?s))
      (at-stage ?s-next)
    )
  )

  ;; Move a top disk from a peg (source peg) onto another disk (destination).
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s-next - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s-next)
      (on ?d ?from)
      (top ?d)
      (top ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (peg-empty ?from)      ; source peg becomes empty after removing its directly-on disk
      (not (top ?to))        ; destination disk no longer top
      (not (at-stage ?s))
      (at-stage ?s-next)
    )
  )

  ;; Move a top disk from a peg (source) onto an empty peg (destination).
  (:action move-from-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s-next - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s-next)
      (on ?d ?from)
      (top ?d)
      (peg-empty ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (peg-empty ?from)      ; source peg becomes empty
      (not (peg-empty ?to))  ; destination peg receives a direct disk
      (not (at-stage ?s))
      (at-stage ?s-next)
    )
  )
)