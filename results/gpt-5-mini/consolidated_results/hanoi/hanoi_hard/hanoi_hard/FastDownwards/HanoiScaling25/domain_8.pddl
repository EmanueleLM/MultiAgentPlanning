(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  ;; disk and peg are both subtypes of support; stage is separate.
  (:types disk peg - support stage)

  (:predicates
    ;; disk is directly on a support (either a disk or a peg)
    (on ?d - disk ?s - support)
    ;; a support (disk or peg) has nothing directly on it (i.e., it is top or an empty peg)
    (clear ?s - support)
    ;; static size ordering: ?a is strictly smaller than ?b
    (smaller ?a - disk ?b - disk)
    ;; discrete stage successor relation
    (next ?t1 - stage ?t2 - stage)
    ;; exactly one current stage marker holds
    (at-stage ?t - stage)
  )

  ;; Move the top disk from its current support (?from: disk or peg)
  ;; to an empty peg (?to). Advances the stage to the immediate successor.
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)       ; disk is directly on its support
      (clear ?d)          ; disk is top (nothing on it)
      (clear ?to)         ; destination peg is empty (peg top)
      (at-stage ?s)       ; current stage marker
      (next ?s ?s2)       ; must advance to immediate successor stage
    )
    :effect (and
      (not (on ?d ?from)) ; disk no longer on its former support
      (on ?d ?to)         ; disk now directly on the destination peg
      (not (clear ?to))   ; destination peg is no longer empty/top
      (clear ?from)       ; former support becomes clear (now top / empty)
      (not (at-stage ?s)) ; advance the stage marker
      (at-stage ?s2)
    )
  )

  ;; Move the top disk from its current support (?from) onto another disk (?t).
  ;; Requires that the moved disk is strictly smaller than the target disk (?t),
  ;; and that the target disk is currently top (clear). Advances the stage.
  (:action move-onto-disk
    :parameters (?d - disk ?from - support ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)       ; disk is directly on its support
      (clear ?d)          ; disk is top (nothing on it)
      (clear ?t)          ; target disk is top of its stack
      (smaller ?d ?t)     ; size constraint: only smaller onto larger
      (at-stage ?s)       ; current stage marker
      (next ?s ?s2)       ; must advance to immediate successor stage
    )
    :effect (and
      (not (on ?d ?from)) ; disk removed from former support
      (on ?d ?t)          ; disk now directly on target disk
      (not (clear ?t))    ; target disk no longer clear
      (clear ?from)       ; former support becomes clear (now top / empty)
      (not (at-stage ?s)) ; advance the stage marker
      (at-stage ?s2)
    )
  )
)