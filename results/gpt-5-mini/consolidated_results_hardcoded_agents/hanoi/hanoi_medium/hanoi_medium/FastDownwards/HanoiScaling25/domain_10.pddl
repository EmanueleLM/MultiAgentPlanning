(define (domain tower-of-hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on ?d - disk ?support - disk)        ; disk ?d is directly on disk/support ?support (support may be a real disk or a base object)
    (top ?p - peg ?d - disk)              ; disk ?d is the current top element of peg ?p
    (smaller ?x - disk ?y - disk)         ; disk ?x is strictly smaller than disk/support ?y
    (is-base ?d - disk)                   ; marker that a disk-typed object is a peg base (not movable)
    (successor ?s - stage ?s2 - stage)    ; ordered stages: ?s2 is the immediate successor of ?s
    (stage-active ?s - stage)             ; which stage is currently active
    (different ?p1 - peg ?p2 - peg)       ; explicit inequality for pegs
  )

  (:action move
    :parameters (?d - disk
                 ?below - disk
                 ?from - peg
                 ?toTop - disk
                 ?to - peg
                 ?s - stage
                 ?s2 - stage)
    :precondition (and
      (top ?from ?d)                ; ?d is top on source peg
      (on ?d ?below)                ; ?below is directly under ?d
      (top ?to ?toTop)              ; ?toTop is the current top on destination peg (may be a base)
      (not (is-base ?d))            ; cannot move a base object
      (smaller ?d ?toTop)           ; moving disk must be smaller than destination top (prevents larger-on-smaller)
      (stage-active ?s)             ; current stage must be active
      (successor ?s ?s2)            ; action advances to the immediate successor stage
      (different ?from ?to)         ; source and destination pegs must be different
    )
    :effect (and
      (not (top ?from ?d))          ; source top is no longer ?d
      (top ?from ?below)            ; new top of source becomes the object that was below ?d
      (not (top ?to ?toTop))        ; destination top (previous) is no longer top
      (top ?to ?d)                  ; moved disk becomes the new top of destination
      (not (on ?d ?below))          ; update stacking relation under moved disk
      (on ?d ?toTop)                ; moved disk is now on previous destination top
      (not (stage-active ?s))       ; advance stage marker
      (stage-active ?s2)
    )
  )
)