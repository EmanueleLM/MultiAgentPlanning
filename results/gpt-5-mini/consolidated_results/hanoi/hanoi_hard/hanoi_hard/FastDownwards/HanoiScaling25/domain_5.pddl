(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage - object)

  (:predicates
    ;; direct "on" relation: disk is directly on a peg or directly on another disk
    (on ?d - disk ?p - object)
    ;; nothing is directly on this object (peg or disk)
    (clear ?o - object)
    ;; static size ordering: ?a is strictly smaller than ?b
    (smaller ?a - disk ?b - disk)
    ;; discrete stage successor relation
    (next ?s - stage ?s2 - stage)
    ;; exactly one current stage marker holds
    (at-stage ?s - stage)
  )

  ;; Move the top disk from its current support (?from, a peg or disk)
  ;; to an empty peg (?to). This represents placing the disk onto an empty peg.
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)       ; disk is directly on its support
      (clear ?d)          ; disk is top (nothing on it)
      (clear ?to)         ; peg is empty (top is clear)
      (at-stage ?s)       ; current stage must match
      (next ?s ?s2)       ; enforce advancing to immediate successor stage
    )
    :effect (and
      (not (on ?d ?from)) ; disk no longer on its former support
      (on ?d ?to)         ; disk now directly on the destination peg
      (not (clear ?to))   ; destination peg is no longer clear
      (clear ?from)       ; the former support becomes clear
      (not (at-stage ?s)) ; advance the stage marker
      (at-stage ?s2)
    )
  )

  ;; Move the top disk from its current support (?from) onto another disk (?t).
  ;; Requires that the moved disk is strictly smaller than the target disk,
  ;; and that the target disk is currently top (clear).
  (:action move-onto-disk
    :parameters (?d - disk ?from - object ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)       ; disk is directly on its support
      (clear ?d)          ; disk is top (nothing on it)
      (clear ?t)          ; target disk is top of its stack
      (smaller ?d ?t)     ; size constraint: can only place smaller on larger
      (at-stage ?s)       ; current stage must match
      (next ?s ?s2)       ; enforce advancing to immediate successor stage
    )
    :effect (and
      (not (on ?d ?from)) ; disk removed from former support
      (on ?d ?t)          ; disk now directly on target disk
      (not (clear ?t))    ; target disk no longer clear
      (clear ?from)       ; former support becomes clear
      (not (at-stage ?s)) ; advance the stage marker
      (at-stage ?s2)
    )
  )
)