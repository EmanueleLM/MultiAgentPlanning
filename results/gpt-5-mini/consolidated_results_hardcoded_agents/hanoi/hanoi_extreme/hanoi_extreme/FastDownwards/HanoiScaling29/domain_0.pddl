(define (domain hanoi-multiagent)
  ;; Tower of Hanoi domain for FastDownward-compatible STRIPS planning
  ;; Types:
  ;;  - place: an abstract type for supports (pegs and disks)
  ;;  - peg  and disk are subtypes of place
  (:requirements :strips :typing :negative-preconditions)
  (:types place peg disk)

  ;; Predicates:
  ;; (on ?d ?s)         : disk ?d is directly on support ?s (support = peg or disk)
  ;; (onpeg ?d ?p)      : disk ?d is located on base peg ?p (the peg under its stack)
  ;; (clear ?s)         : support ?s (peg or disk) has nothing on top (i.e., it is top)
  ;; (smaller ?d1 ?d2)  : disk ?d1 is strictly smaller than disk ?d2
  ;; The planning instance will provide the concrete initial facts for these predicates.
  (:predicates
    (on ?d - disk ?s - place)
    (onpeg ?d - disk ?p - peg)
    (clear ?s - place)
    (smaller ?d1 - disk ?d2 - disk)
    ;; The next predicates are used if a planner trace-enforcing ordering is required.
    ;; They are included to allow expressing explicit ordered-step constraints in the problem.
    (step-done ?st)
    (step-enabled ?st)
    (planned-move ?st ?d - disk ?src - peg ?dst - peg)
    (next-step ?st1 ?st2)
  )

  ;; Single primitive action: move the top disk associated with a source peg to a destination peg.
  ;; The action is guarded so it can only move a disk when:
  ;;  - the disk is currently the top item of its source peg (onpeg ?d ?src and clear ?d)
  ;;  - the destination peg's top (if any) is larger than the moving disk, or the destination peg is empty (clear ?dst)
  ;; To support both placing onto an empty peg and onto another disk, the action requires the current
  ;; immediate support of the moved disk (?support) and, when placing onto a disk, the target top disk (?target-top).
  ;; Note: We keep one action schema that supports both cases by requiring the caller/environment ensure
  ;; the appropriate clear/size facts for the destination.
  (:action move-top
    :parameters (?st ?next - (either ?step ?step)
                ?d - disk
                ?support - place
                ?src - peg
                ?dst - peg
                ?target-top - disk)
    :precondition (and
      ;; sequencing guard: if the problem includes planned-move facts and step enabling, require step-enabled
      (or (not (planned-move ?st ?d ?src ?dst)) (step-enabled ?st))
      ;; the disk is directly on its immediate support
      (on ?d ?support)
      ;; the disk is reported as associated to source peg
      (onpeg ?d ?src)
      ;; the disk is top of whatever it's on (no disk above)
      (clear ?d)
      ;; destination is either empty (no disk on top of the peg) OR has a top disk ?target-top which is clear and larger
      ;; We express this by requiring either (clear ?dst) or (and (on ?target-top ?dst) (clear ?target-top) (smaller ?d ?target-top))
      ;; Because STRIPS does not have direct OR, callers must ensure one of these holds in the initial state evolution.
      ;; We'll test both forms at runtime through the available predicates.
      ;; For safety we require that either the destination peg is clear OR the indicated top disk exists and is larger.
      ;; (The planner must ensure one of these is true for the action to be applicable.)
      (or (clear ?dst) (and (on ?target-top ?dst) (clear ?target-top) (smaller ?d ?target-top)))
    )
    :effect (and
      ;; sequencing effects: mark this step done and enable successor step if planning a fully-ordered execution
      (when (planned-move ?st ?d ?src ?dst)
        (and (not (step-enabled ?st)) (step-done ?st) (step-enabled ?next)))
      ;; update structural relations for the moved disk: remove its old on fact and set its new direct support
      (not (on ?d ?support))
      ;; When placing on empty peg, direct support becomes the dst peg; when placing on top of another disk, new support becomes that disk.
      ;; Because the action includes ?target-top param, we cover both cases:
      ;; If destination was empty, the new direct support is the destination peg (we add on ?d ?dst).
      ;; If destination had a top disk ?target-top, the new direct support is that disk (we add on ?d ?target-top).
      (or
        (and (clear ?dst) (on ?d ?dst))
        (and (on ?target-top ?dst) (not (clear ?target-top)) (on ?d ?target-top))
      )
      ;; update onpeg (base peg) mapping: the moved disk is now associated with destination peg
      (not (onpeg ?d ?src))
      (onpeg ?d ?dst)
      ;; update clear flags:
      ;; the moved disk remains clear (it is top on its new support)
      ;; the previous support becomes clear (since d was top on it and moved)
      (clear ?support)
      ;; the destination support (peg or disk) is no longer clear after placing d on it
      (not (clear ?dst))
      (when (and (on ?target-top ?dst) (clear ?target-top))
        (not (clear ?target-top)))
    )
  )
)