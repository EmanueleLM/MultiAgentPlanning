(define (domain hanoi)
  (:requirements :typing :negative-preconditions :strips)
  (:types disk peg step)

  (:predicates
    (on ?d - disk ?p - peg)            ; disk ?d is on peg ?p
    (top ?p - peg ?d - disk)          ; ?d is the top disk on peg ?p
    (bottom ?p - peg ?d - disk)       ; ?d is the bottom disk on peg ?p
    (above ?d - disk ?below - disk)   ; ?d is immediately above ?below (same peg)
    (empty ?p - peg)                  ; peg ?p has no disks
    (larger ?x - disk ?y - disk)      ; ?x is larger than ?y
    (step-current ?s - step)          ; current stage/step
    (next ?s1 - step ?s2 - step)      ; successor relation on steps
  )

  ;; Move: source has a disk immediately below the moved disk, destination has a top disk (non-empty dest)
  (:action move-with-below-to-top
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?below - disk ?t - disk)
    :precondition (and
      (step-current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (top ?from ?d)
      (above ?d ?below)
      (on ?below ?from)
      (top ?to ?t)
      (on ?t ?to)
      (larger ?t ?d)
    )
    :effect (and
      ;; move disk location
      (not (on ?d ?from))
      (on ?d ?to)
      ;; update top relations: source top becomes the disk below, destination top becomes moved disk
      (not (top ?from ?d))
      (top ?from ?below)
      (not (top ?to ?t))
      (top ?to ?d)
      ;; update above relations: moved disk no longer above its previous below; moved disk now above previous top of dest
      (not (above ?d ?below))
      (above ?d ?t)
      ;; destination is not empty
      (not (empty ?to))
      ;; advance step
      (not (step-current ?s))
      (step-current ?s2)
    )
  )

  ;; Move: source has a disk immediately below the moved disk, destination is empty
  (:action move-with-below-to-empty
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (step-current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (top ?from ?d)
      (above ?d ?below)
      (on ?below ?from)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; update top relations
      (not (top ?from ?d))
      (top ?from ?below)
      (top ?to ?d)
      ;; update above relations
      (not (above ?d ?below))
      ;; destination becomes bottom as well (only disk)
      (bottom ?to ?d)
      ;; dest no longer empty
      (not (empty ?to))
      ;; advance step
      (not (step-current ?s))
      (step-current ?s2)
    )
  )

  ;; Move: source disk is both top and bottom (only disk on source), destination has a top disk
  (:action move-only-to-top
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (step-current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (top ?from ?d)
      (bottom ?from ?d)
      (top ?to ?t)
      (on ?t ?to)
      (larger ?t ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; source becomes empty (no top, no bottom)
      (not (top ?from ?d))
      (not (bottom ?from ?d))
      (empty ?from)
      ;; destination top updated: moved disk becomes new top, sits above previous top
      (not (top ?to ?t))
      (top ?to ?d)
      (above ?d ?t)
      ;; advance step
      (not (step-current ?s))
      (step-current ?s2)
    )
  )

  ;; Move: source disk is both top and bottom (only disk on source), destination is empty
  (:action move-only-to-empty
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (step-current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (top ?from ?d)
      (bottom ?from ?d)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; source becomes empty
      (not (top ?from ?d))
      (not (bottom ?from ?d))
      (empty ?from)
      ;; destination now has single disk as top and bottom
      (top ?to ?d)
      (bottom ?to ?d)
      (not (empty ?to))
      ;; advance step
      (not (step-current ?s))
      (step-current ?s2)
    )
  )
)